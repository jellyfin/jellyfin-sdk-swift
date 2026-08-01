//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import Foundation
import JellyfinAPI
import Testing

#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

struct QuickConnectTests {

    @Test
    func pollingSurvivesTransientFailures() async throws {
        let client = try makeClient(
            host: "transient-failures.test",
            script: [
                .json(#"{"Secret": "polling-secret", "Code": "123456"}"#),
                .failure(URLError(.networkConnectionLost)),
                .json(#"{"Secret": "polling-secret", "Authenticated": false}"#),
                .failure(URLError(.networkConnectionLost)),
                .json(#"{"Secret": "authorized-secret", "Authenticated": true}"#),
            ]
        )

        var events: [QuickConnect.Event] = []

        for try await event in client.quickConnect.connect(poll: 1) {
            events.append(event)
        }

        #expect(events == [.polling(code: "123456"), .authenticated(secret: "authorized-secret")])
    }

    @Test
    func pollingFailsAfterConsecutiveFailuresExceedTolerance() async throws {
        let client = try makeClient(
            host: "exceeded-tolerance.test",
            script: [
                .json(#"{"Secret": "polling-secret", "Code": "123456"}"#),
                .failure(URLError(.networkConnectionLost)),
                .failure(URLError(.networkConnectionLost)),
                .failure(URLError(.networkConnectionLost)),
            ]
        )

        await #expect(throws: Error.self) {
            for try await _ in client.quickConnect.connect(poll: 1, failureTolerance: 2) {}
        }
    }

    @Test
    func failedInitiateThrows() async throws {
        let client = try makeClient(
            host: "failed-initiate.test",
            script: [
                .failure(URLError(.networkConnectionLost)),
            ]
        )

        await #expect(throws: Error.self) {
            for try await _ in client.quickConnect.connect(poll: 1) {}
        }
    }

    private func makeClient(host: String, script: [ScriptedURLProtocol.Response]) throws -> JellyfinClient {
        ScriptedURLProtocol.register(script: script, for: host)

        let sessionConfiguration = URLSessionConfiguration.ephemeral
        sessionConfiguration.protocolClasses = [ScriptedURLProtocol.self]

        return try JellyfinClient(
            configuration: .init(
                url: #require(URL(string: "https://\(host)")),
                client: "QuickConnectTests",
                deviceName: "Tests",
                deviceID: "test-device-id",
                version: "1.0"
            ),
            sessionConfiguration: sessionConfiguration
        )
    }
}

/// Serves canned responses, keyed by request host so parallel tests don't consume each other's scripts.
final class ScriptedURLProtocol: URLProtocol {

    enum Response {
        case json(String)
        case failure(Error)
    }

    private static let lock = NSLock()
    nonisolated(unsafe)
    private static var scripts: [String: [Response]] = [:]

    static func register(script: [Response], for host: String) {
        lock.lock()
        defer { lock.unlock() }
        scripts[host] = script
    }

    private static func next(for host: String) -> Response? {
        lock.lock()
        defer { lock.unlock() }
        guard var script = scripts[host], !script.isEmpty else { return nil }
        let response = script.removeFirst()
        scripts[host] = script
        return response
    }

    override class func canInit(with request: URLRequest) -> Bool {
        request.url?.host?.hasSuffix(".test") == true
    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        request
    }

    override func startLoading() {
        guard let url = request.url,
              let host = url.host,
              let response = Self.next(for: host)
        else {
            client?.urlProtocol(self, didFailWithError: URLError(.resourceUnavailable))
            return
        }

        switch response {
        case let .json(body):
            let httpResponse = HTTPURLResponse(
                url: url,
                statusCode: 200,
                httpVersion: "HTTP/1.1",
                headerFields: ["Content-Type": "application/json"]
            )!

            client?.urlProtocol(self, didReceive: httpResponse, cacheStoragePolicy: .notAllowed)
            client?.urlProtocol(self, didLoad: Data(body.utf8))
            client?.urlProtocolDidFinishLoading(self)
        case let .failure(error):
            client?.urlProtocol(self, didFailWithError: error)
        }
    }

    override func stopLoading() {}
}
