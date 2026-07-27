//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import Foundation
@testable import JellyfinAPI
import Testing

struct JellyfinSocketTests {

    @Test(arguments: [
        (0, Duration.seconds(2)),
        (1, .seconds(2)),
        (2, .seconds(4)),
        (3, .seconds(8)),
        (4, .seconds(16)),
        (5, .seconds(32)),
        (6, .seconds(32)),
        (1000, .seconds(32)),
    ])
    func backoffDoublesFromTheBaseDelayAndCapsUnderTheServerTimeout(
        unhealthyCycles: Int,
        expectedDelay: Duration
    ) {
        let delay = JellyfinSocket.Session.backoffDelay(base: .seconds(2), unhealthyCycles: unhealthyCycles)

        #expect(delay == expectedDelay)
        #expect(delay < .seconds(60))
    }

    @Test(arguments: [
        (401, true),
        (403, true),
        (101, false),
        (200, false),
        (404, false),
        (429, false),
        (500, false),
        (503, false),
    ])
    func onlyRefusedCredentialsAreFatal(statusCode: Int, isRefused: Bool) {
        let rejection = JellyfinSocket.Session.SocketError.rejection(statusCode: statusCode)

        #expect((rejection != nil) == isRefused)
        #expect(rejection?.isFatal ?? true)
    }

    @Test(arguments: [
        (Duration.zero, Duration.seconds(-5)),
        (.seconds(1), .seconds(20)),
        (.seconds(30), .seconds(45)),
        (.seconds(600), .seconds(3600)),
    ])
    func tunablesAreClampedToUsableValues(healthyUptime: Duration, keepAliveInterval: Duration) throws {
        let session = try makeUnreachableSession(healthyUptime: healthyUptime, keepAliveInterval: keepAliveInterval)

        defer { session.disconnect() }

        #expect(session.healthyUptime >= .seconds(1))
        #expect(session.keepAliveInterval <= .seconds(45))
    }

    @Test
    func aSubscriptionOutlivesOneOfItsSubscribers() throws {
        let session = try makeUnreachableSession()

        defer { session.disconnect() }

        let first = session.subscribe(.sessions, delay: .seconds(5), interval: .seconds(5))
        let second = session.subscribe(.sessions, delay: .seconds(1), interval: .seconds(2))

        #expect(session.effectiveConfiguration(for: .sessions)?.interval == .seconds(2))

        second.cancel()

        #expect(session.effectiveConfiguration(for: .sessions)?.interval == .seconds(5))

        second.cancel()

        #expect(session.effectiveConfiguration(for: .sessions) != nil)

        first.cancel()

        #expect(session.effectiveConfiguration(for: .sessions) == nil)
    }

    @Test
    func subscriptionsAreIdentifiableFromTheirMessages() {
        #expect(OutboundWebSocketMessage.sessionsMessage(.init()).subscription == .sessions)
        #expect(OutboundWebSocketMessage.activityLogEntryMessage(.init()).subscription == .activityLog)
        #expect(OutboundWebSocketMessage.scheduledTasksInfoMessage(.init()).subscription == .scheduledTasks)
        #expect(OutboundWebSocketMessage.forceKeepAliveMessage(.init()).subscription == nil)

        #expect(JellyfinSocket.Session.Event.connecting.subscription == nil)
        #expect(JellyfinSocket.Session.Event.disconnected.subscription == nil)
    }

    @Test(.timeLimit(.minutes(1)))
    func releasingTheSessionEndsIt() async throws {
        weak var session: JellyfinSocket.Session?

        func startAndRelease() async throws {
            let strongSession = try makeUnreachableSession()
            session = strongSession

            try await Task.sleep(for: .seconds(5))
        }

        try await startAndRelease()

        while session != nil {
            try await Task.sleep(for: .milliseconds(50))
        }

        #expect(session == nil)
    }

    @Test(.timeLimit(.minutes(30)))
    func socketStaysConnected() async throws {
        let result = try await observe(
            duration: .seconds(1200), // 20m
            deviceID: "socket-observe"
        )

        #expect(result.messages > 0)
        #expect(result.attempts == 1)
        #expect(result.disconnects == 0)
    }

    @Test(.timeLimit(.minutes(5)))
    func socketReceivesSessionUpdates() async throws {
        let result = try await observe(
            duration: .seconds(60), // 1m
            deviceID: "socket-sessions",
            subscription: .sessions
        )

        #expect(result.sessionMessages > 0)
        #expect(result.attempts == 1)
    }

    @Test(.timeLimit(.minutes(1)))
    func socketReportsWhenAConnectionIsLost() async throws {
        let client = try TestConnection.makeClient(deviceID: "socket-disconnect")

        try await client.signIn(username: TestConnection.username, password: TestConnection.password)

        let session = client.socket().connect()

        defer { session.disconnect() }

        var result = Observation()

        for try await event in session.events {
            switch event {
            case .connected:
                result.connects += 1
                session.disconnect()

            case .disconnected:
                result.disconnects += 1

            default:
                break
            }
        }

        #expect(result.connects == 1)
        #expect(result.disconnects == 1)
    }

    @Test(.timeLimit(.minutes(1)))
    func socketGivesUpAfterReconnectAttempts() async throws {
        let session = try makeUnreachableSession(reconnectAttempts: 1, reconnectDelay: .milliseconds(50))

        defer { session.disconnect() }

        await #expect(throws: JellyfinSocket.Session.SocketError.self) {
            for try await _ in session.events {}
        }
    }

    @Test(.timeLimit(.minutes(1)))
    func socketEndsOnRefusedCredentials() async throws {
        let client = try TestConnection.makeClient(
            deviceID: "socket-unauthorized",
            accessToken: "0000000000000000000000000000dead"
        )

        let session = client.socket().connect()

        defer { session.disconnect() }

        var caught: (any Error)?

        do {
            for try await _ in session.events {}
        } catch {
            caught = error
        }

        guard case let .unauthorized(statusCode)? = caught as? JellyfinSocket.Session.SocketError else {
            Issue.record("expected unauthorized, got \(String(describing: caught))")
            return
        }

        #expect(statusCode == 401 || statusCode == 403)
    }

    private struct Observation {
        var attempts = 0
        var connects = 0
        var disconnects = 0
        var messages = 0
        var sessionMessages = 0
    }

    private func observe(
        duration: Duration,
        deviceID: String,
        subscription: JellyfinSocket.Subscription? = nil
    ) async throws -> Observation {
        let client = try TestConnection.makeClient(deviceID: deviceID)

        try await client.signIn(username: TestConnection.username, password: TestConnection.password)

        let session = client.socket().connect()

        if let subscription {
            session.subscribe(subscription)
        }

        let stop = Task {
            try await Task.sleep(for: duration)
            session.disconnect()
        }

        defer {
            stop.cancel()
            session.disconnect()
        }

        var result = Observation()

        for try await event in session.events {
            switch event {
            case .connecting:
                result.attempts += 1

            case .connected:
                result.connects += 1

            case .disconnected:
                result.disconnects += 1

            case let .message(message):
                result.messages += 1

                if case .sessionsMessage = message {
                    result.sessionMessages += 1
                }
            }
        }

        return result
    }

    private func makeUnreachableSession(
        healthyUptime: Duration = .seconds(30),
        keepAliveInterval: Duration = .seconds(20),
        reconnectAttempts: Int? = nil,
        reconnectDelay: Duration = .seconds(2)
    ) throws -> JellyfinSocket.Session {
        let client = try JellyfinClient(
            configuration: .init(
                url: #require(URL(string: "http://127.0.0.1:1")),
                client: "JellyfinSDKTests",
                deviceName: "Tests",
                deviceID: "jellyfin-sdk-swift",
                version: TestConnection.version
            )
        )

        return client.socket()
            .connect(
                reconnectAttempts: reconnectAttempts,
                reconnectDelay: reconnectDelay,
                healthyUptime: healthyUptime,
                keepAliveInterval: keepAliveInterval
            )
    }
}
