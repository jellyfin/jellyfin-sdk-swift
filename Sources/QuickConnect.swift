//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// A provider for the Quick Connect authorization flow.
///
/// To start the authorization flow, call `start()`. The `state` variable
/// will be updated to the current flow state and can be subscribed to with
/// async/await or Combine. See `QuickConnect.State` for all possible states.
///
/// To stop the authorization flow, typically for user cancellation, call `stop()`.
public final class QuickConnect: ObservableObject {

    // MARK: State

    public enum State: Equatable {

        /// Idle
        case idle

        /// Retrieving Quick Connect code
        case retrievingCode

        /// Polling with code
        case polling(code: String)

        /// Authenticated with secret
        case authenticated(secret: String)

        /// An internal error has occurred
        case error(QuickConnectError)
    }

    // MARK: Error

    public enum QuickConnectError: LocalizedError, Equatable {

        /// Polling has hit its maximum
        case maxPollingHit

        /// An other error has occurred, typically a network error
        case other(String)

        /// Retrieving the Quick Connect code failed.
        ///
        /// Only thrown when incorrect/incomplete expected data
        /// is returned from the server.
        case retrievingCodeFailed

        var localizedError: String {
            switch self {
            case .maxPollingHit:
                "Max polling hit"
            case let .other(message):
                message
            case .retrievingCodeFailed:
                "Retrieving code failed"
            }
        }
    }

    /// The current state of the authorization flow.
    @Published
    public private(set) var state: State = .idle

    private let client: JellyfinClient
    private let pollInterval: Int
    private let maxPolls: Int

    private var mainTask: Task<Void, Never>?

    /// Creates a manager for performing a Quick Connect authorization flow.
    ///
    /// - Parameters:
    ///   - client: The `JellyfinClient` to perform Quick Connect authorization with.
    ///   - pollInterval: The polling interval, in seconds, while in the `polling` state.
    ///   - maxPolls: The maximum number of polls while in the `polling` state. Hitting
    ///               this amount of polls will throw a `maxPollingHit` error state.
    ///
    /// - Precondition: `pollInterval > 0`
    /// - Precondition: `maxPolls > 0`
    public init(
        client: JellyfinClient,
        pollInterval: Int = 5,
        maxPolls: Int = 200
    ) {
        precondition(pollInterval > 0, "Polling interval must be at least one second")
        precondition(maxPolls > 0, "Maximum polling must be positive")

        self.client = client
        self.pollInterval = pollInterval
        self.maxPolls = maxPolls
    }

    /// Starts the Quick Connect authorization flow.
    ///
    /// - Important: Make sure to subscribe or await for `state` changes
    ///              prior to starting Quick Connect.
    @MainActor
    public func start() {
        guard state == .idle else { return }

        mainTask = Task {
            await run()
        }
    }

    /// Stops the current Quick Connect authorization flow.
    @MainActor
    public func stop() {
        mainTask?.cancel()
        state = .idle
    }

    private func run() async {
        do {
            await MainActor.run {
                state = .retrievingCode
            }

            let (secret, code) = try await retrieveSecretAndCode()

            await MainActor.run {
                self.state = .polling(code: code)
            }

            let authorizedSecret = try await poll(secret: secret)

            await MainActor.run {
                state = .authenticated(secret: authorizedSecret)
            }
        } catch let error as QuickConnectError {
            await MainActor.run {
                state = .error(error)
            }
        } catch is CancellationError {
            // Task was cancelled, not an issue
        } catch {
            await MainActor.run {
                state = .error(.other(error.localizedDescription))
            }
        }
    }

    private func retrieveSecretAndCode() async throws -> (secret: String, code: String) {

        let initiatePath = Paths.initiate
        let response = try await client.send(initiatePath)

        guard let secret = response.value.secret,
              let code = response.value.code
        else {
            throw QuickConnectError.retrievingCodeFailed
        }

        return (secret, code)
    }

    // Note: `Task.sleep` doesn't guarantee actual time == given time, but
    //       variance is fairly tight and exact time doesn't matter.
    private func poll(secret: String) async throws -> String {

        for _ in 0 ..< maxPolls {
            if let authSecret = try await checkAuthorization(secret: secret) {
                return authSecret
            }

            try await Task.sleep(nanoseconds: UInt64(1_000_000_000 * pollInterval))
        }

        throw QuickConnectError.maxPollingHit
    }

    private func checkAuthorization(secret: String) async throws -> String? {

        let request = Paths.connect(secret: secret)
        let response = try await client.send(request)

        let isAuthenticated = response.value.isAuthenticated ?? false

        guard isAuthenticated, let authorizedSecret = response.value.secret else { return nil }

        return authorizedSecret
    }
}
