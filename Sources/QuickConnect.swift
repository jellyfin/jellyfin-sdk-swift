//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Start `QuickConnect` from a `JellyfinClient` instance.
///
/// ## Example
/// ```swift
/// for try await event in client.quickConnect.connect() {
///     switch event {
///     case let .polling(code: code):
///         print("Code: \(code)")
///     case let .authenticated(secret: secret):
///         try await client.signIn(quickConnectSecret: secret)
///     }
/// }
/// ```
public struct QuickConnect: Sendable {

    public enum Event: Equatable, Sendable {

        /// Polling with code
        case polling(code: String)

        /// Authenticated with secret
        case authenticated(secret: String)
    }

    enum QuickConnectError: Error {
        case maxPollingHit
        case retrievingCodeFailed
    }

    private let client: JellyfinClient

    init(client: JellyfinClient) {
        self.client = client
    }

    /// Starts a Quick Connect authorization flow when iterated.
    ///
    /// - Parameters:
    ///   - poll: Poll interval in seconds
    ///   - max: Maximum number of polls
    public func connect(
        poll: Int = 5,
        max: Int = 200
    ) -> AsyncThrowingStream<Event, Error> {

        precondition(poll > 0, "Polling interval must be at least one second")
        precondition(max > 0, "Maximum polling must be positive")

        return AsyncThrowingStream { continuation in
            let task = Task {
                do {
                    try await run(poll: poll, max: max) { state in
                        continuation.yield(state)
                    }
                    continuation.finish()
                } catch is CancellationError {
                    continuation.finish()
                } catch {
                    continuation.finish(throwing: error)
                }
            }

            continuation.onTermination = { _ in
                task.cancel()
            }
        }
    }

    private func run(
        poll: Int,
        max: Int,
        yield: (Event) -> Void
    ) async throws {

        let (secret, code) = try await retrieveSecretAndCode()

        yield(.polling(code: code))

        let authorizedSecret = try await pollForAuthorization(secret: secret, interval: poll, max: max)

        yield(.authenticated(secret: authorizedSecret))
    }

    private func retrieveSecretAndCode() async throws -> (secret: String, code: String) {

        let request = Paths.initiateQuickConnect
        let response = try await client.send(request)

        guard let secret = response.value.secret,
              let code = response.value.code
        else {
            throw QuickConnectError.retrievingCodeFailed
        }

        return (secret, code)
    }

    private func pollForAuthorization(
        secret: String,
        interval: Int,
        max: Int
    ) async throws -> String {

        for _ in 0 ..< max {
            if let authSecret = try await checkAuthorization(secret: secret) {
                return authSecret
            }

            try await Task.sleep(for: .seconds(interval))
        }

        throw QuickConnectError.maxPollingHit
    }

    private func checkAuthorization(secret: String) async throws -> String? {

        let request = Paths.getQuickConnectState(secret: secret)
        let response = try await client.send(request)

        guard response.value.isAuthenticated == true, let authorizedSecret = response.value.secret else { return nil }

        return authorizedSecret
    }
}
