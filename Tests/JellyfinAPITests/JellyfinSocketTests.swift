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

    @Test
    func aSubscriptionOutlivesOneOfItsSubscribers() throws {
        let session = try TestConnection.makeSocket(client: TestConnection.makeUnreachableClient())

        defer { session.disconnect() }

        let first = session.subscribe(.sessions, delay: .seconds(5), interval: .seconds(5))
        let second = session.subscribe(.sessions, delay: .seconds(1), interval: .seconds(2))

        #expect(session.configuration(for: .sessions)?.interval == .seconds(2))

        second.cancel()

        #expect(session.configuration(for: .sessions)?.interval == .seconds(5))

        second.cancel()

        #expect(session.configuration(for: .sessions) != nil)

        first.cancel()

        #expect(session.configuration(for: .sessions) == nil)
    }

    @Test(.timeLimit(.minutes(1)))
    func disconnectingDuringBackoffEndsTheStream() async throws {
        let session = try TestConnection.makeSocket(
            client: TestConnection.makeUnreachableClient(),
            reconnectDelay: .seconds(30)
        )

        let stop = Task {
            try await Task.sleep(for: .seconds(2))
            session.disconnect()
        }

        defer { stop.cancel() }

        // A cancel landing in the backoff sleep has to finish the stream, or this hangs.
        for try await _ in session.events {}
    }

    @Test(.timeLimit(.minutes(1)))
    func socketConnectsAndReportsTheDisconnect() async throws {
        let client = try TestConnection.makeClient(deviceID: "socket-disconnect")

        try await client.signIn(username: TestConnection.username, password: TestConnection.password)

        let session = client.socket().connect()

        defer { session.disconnect() }

        var connects = 0
        var disconnects = 0

        for try await event in session.events {
            switch event {
            case .connected:
                connects += 1
                session.disconnect()

            case .disconnected:
                disconnects += 1

            default:
                break
            }
        }

        #expect(connects == 1)
        #expect(disconnects == 1)
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

    @Test(.timeLimit(.minutes(25)))
    func socketStaysConnected() async throws {
        let client = try TestConnection.makeClient(deviceID: "socket-observe")

        try await client.signIn(username: TestConnection.username, password: TestConnection.password)

        let session = client.socket().connect()

        let stop = Task {
            try await Task.sleep(for: .seconds(1200))
            session.disconnect()
        }

        defer {
            stop.cancel()
            session.disconnect()
        }

        var attempts = 0
        var disconnects = 0
        var messages = 0

        for try await event in session.events {
            switch event {
            case .connecting: attempts += 1
            case .disconnected: disconnects += 1
            case .message: messages += 1
            default: break
            }
        }

        #expect(messages > 0)
        #expect(attempts == 1)
        // One for the disconnect that ends the run. Two means it dropped mid-run.
        #expect(disconnects == 1)
    }
}
