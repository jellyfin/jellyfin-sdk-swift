//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Connect to the Jellyfin WebSocket from the `JellyfinClient`.
///
/// ## Example
/// ```swift
/// let session = client.socket().connect()
/// session.subscribe(.sessions)
///
/// for try await event in session.events {
///     switch event {
///     case .connecting:
///         print("connecting…")
///     case let .connected(url):
///         print("connected to \(url)")
///     case let .message(message):
///         print(message)
///     }
/// }
///
/// session.unsubscribe(.sessions)
/// session.disconnect()
/// ```
public struct JellyfinSocket: Sendable {

    let client: JellyfinClient
    let supportsMediaControl: Bool
    let supportedCommands: [GeneralCommandType]
    let playableMediaTypes: [MediaType]

    /// Open a WebSocket session.
    ///
    /// The session reconnects with exponential backoff on transport errors and
    /// re-sends active subscriptions on each reconnect.
    ///
    /// - Parameters:
    ///   - reconnectAttempts: Number of times to retry on transport errors.
    ///   - reconnectDelay: Initial backoff delay that doubles for each retry.
    ///   - responseTimeout: Maximum silence from the server before disconnecting.
    public func connect(
        reconnectAttempts: Int = 5,
        reconnectDelay: Duration = .seconds(2),
        responseTimeout: Duration = .seconds(5)
    ) -> Session {
        Session(
            client: client,
            supportsMediaControl: supportsMediaControl,
            supportedCommands: supportedCommands,
            playableMediaTypes: playableMediaTypes,
            reconnectAttempts: reconnectAttempts,
            reconnectDelay: reconnectDelay,
            responseTimeout: responseTimeout
        )
    }
}

// MARK: - Session

public extension JellyfinSocket {

    final class Session: @unchecked Sendable {

        public enum Event: Sendable {

            /// The socket is attempting to connect.
            case connecting

            /// The socket has received its first message and is connected.
            case connected(URL)

            /// A message was received from the server.
            case message(OutboundWebSocketMessage)
        }

        enum SocketError: Error {
            case connectionTimeout
            case reconnectAttemptsReached
        }

        /// Stream of events emitted by the server.
        /// Iterating this stream pulls events for the lifetime of the session.
        public let events: AsyncThrowingStream<Event, Error>

        // MARK: - State

        struct Configuration: Hashable {
            let initialDelay: Duration
            let interval: Duration

            var startMessage: String {
                "\(initialDelay.milliseconds),\(interval.milliseconds)"
            }
        }

        private let capabilities: Paths.PostCapabilitiesParameters
        private let client: JellyfinClient
        private let lock = NSLock()
        private var _subscriptions: [Subscription: Configuration] = [:]
        private var _pending: [InboundWebSocketMessage] = []
        private var _wakeup: (@Sendable () -> Void)?
        private var _explicitlyDisconnected = false

        private let eventsContinuation: AsyncThrowingStream<Event, Error>.Continuation
        private var task: Task<Void, Never>!

        // MARK: - Init

        init(
            client: JellyfinClient,
            supportsMediaControl: Bool,
            supportedCommands: [GeneralCommandType],
            playableMediaTypes: [MediaType],
            reconnectAttempts: Int,
            reconnectDelay: Duration,
            responseTimeout: Duration
        ) {
            var capabilities = Paths.PostCapabilitiesParameters()

            capabilities.isSupportsMediaControl = supportsMediaControl
            capabilities.supportedCommands = supportedCommands
            capabilities.playableMediaTypes = playableMediaTypes

            self.capabilities = capabilities
            self.client = client

            let (events, continuation) = AsyncThrowingStream<Event, Error>.makeStream()
            self.events = events
            self.eventsContinuation = continuation

            self.task = Task { [weak self] in
                await self?.run(
                    reconnectAttempts: reconnectAttempts,
                    reconnectDelay: reconnectDelay,
                    responseTimeout: responseTimeout
                )
            }
        }

        deinit {
            task?.cancel()
            eventsContinuation.finish()
        }

        // MARK: - Public API

        /// Add a subscription. Sends the start message for a subscription type.
        ///
        /// - Parameters:
        ///   - subscription: The subscription topic.
        ///   - delay: Delay before the first update.
        ///   - interval: Update interval.
        public func subscribe(
            _ subscription: Subscription,
            delay: Duration = .seconds(5),
            interval: Duration = .seconds(5)
        ) {
            let configuration = Configuration(
                initialDelay: delay,
                interval: interval
            )

            lock.lock()
            _subscriptions[subscription] = configuration
            _pending.append(subscription.startMessage(data: configuration.startMessage))
            let wake = _wakeup
            lock.unlock()
            wake?()
        }

        /// Unsubscribe from a subscription.
        ///
        /// Attempts to send the stop message if connected.
        public func unsubscribe(_ subscription: Subscription) {
            lock.lock()
            _subscriptions[subscription] = nil
            _pending.append(subscription.stopMessage)

            let wake = _wakeup
            lock.unlock()
            wake?()
        }

        /// Disconnect the current web socket session.
        public func disconnect() {
            lock.lock()
            _explicitlyDisconnected = true
            lock.unlock()
            task?.cancel()
        }
    }
}

// MARK: - State helpers

private extension JellyfinSocket.Session {

    var isExplicitlyDisconnected: Bool {
        lock.lock()
        defer { lock.unlock() }

        return _explicitlyDisconnected
    }

    func setWakeup(_ block: (@Sendable () -> Void)?) {
        lock.lock()
        defer { lock.unlock() }

        _wakeup = block
    }

    /// Snapshot active subscriptions and clear the pending queue.
    ///
    /// Used at (re)connect so the initial state matches the active subscription set without duplicating buffered start/stop messages.
    func consumeInitialMessages() -> [InboundWebSocketMessage] {
        lock.lock()
        defer { lock.unlock() }

        _pending = []

        return _subscriptions.map { subscription, configuration in
            subscription.startMessage(data: configuration.startMessage)
        }
    }

    func pendingMessages() -> [InboundWebSocketMessage] {
        lock.lock()
        defer { lock.unlock() }

        let pending = _pending
        _pending = []
        return pending
    }

    func run(
        reconnectAttempts: Int,
        reconnectDelay: Duration,
        responseTimeout: Duration
    ) async {
        var attempts = 0

        while !Task.isCancelled, !isExplicitlyDisconnected {
            do {
                try await connect(
                    responseTimeout: responseTimeout
                )

                eventsContinuation.finish()

                return
            } catch is CancellationError {
                eventsContinuation.finish()
                return
            } catch {
                attempts += 1

                guard attempts <= reconnectAttempts else {
                    eventsContinuation.finish(throwing: SocketError.reconnectAttemptsReached)
                    return
                }

                let delay = reconnectDelay * Int(pow(2.0, Double(attempts - 1)))

                do {
                    try await Task.sleep(for: delay)
                } catch {
                    eventsContinuation.finish()
                    return
                }
            }
        }

        eventsContinuation.finish()
    }

    func connect(responseTimeout: Duration) async throws {
        let url = try client.socketURL

        eventsContinuation.yield(.connecting)

        // Register capabilities before the WebSocket connects so the session is controllable.
        try await client.send(Paths.postCapabilities(parameters: capabilities))

        let urlSession = URLSession(configuration: .default)
        defer { urlSession.invalidateAndCancel() }

        var request = URLRequest(url: url)
        request.setValue(client.authorizationHeaders, forHTTPHeaderField: "Authorization")

        let webSocketTask = urlSession.webSocketTask(with: request)
        webSocketTask.resume()

        defer {
            webSocketTask.cancel(with: .goingAway, reason: nil)

            Task.detached { [capabilities, client] in
                try await client.send(Paths.postCapabilities(parameters: capabilities))
            }
        }

        let (wakeupStream, wakeupContinuation) = AsyncStream<Void>.makeStream()

        setWakeup { wakeupContinuation.yield(()) }

        defer {
            setWakeup(nil)
            wakeupContinuation.finish()
        }

        let encoder = JSONEncoder()

        for message in consumeInitialMessages() {
            try await webSocketTask.send(.data(encoder.encode(message)))
        }

        try await listen(
            webSocketTask: webSocketTask,
            url: url,
            wakeupStream: wakeupStream,
            responseTimeout: responseTimeout
        )
    }

    func listen(
        webSocketTask: URLSessionWebSocketTask,
        url: URL,
        wakeupStream: AsyncStream<Void>,
        responseTimeout: Duration
    ) async throws {
        let activity = ActivityClock()
        let (intervalStream, intervalContinuation) = AsyncStream<Duration>.makeStream()
        let eventsContinuation = self.eventsContinuation

        let _: Void = try await withThrowingTaskGroup { group in

            // Read loop
            group.addTask {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .formatted(OpenISO8601DateFormatter())

                var hasYieldedConnected = false
                defer { intervalContinuation.finish() }

                while !Task.isCancelled {
                    let message = try await webSocketTask.receive()

                    activity.touch()

                    if !hasYieldedConnected {
                        hasYieldedConnected = true
                        eventsContinuation.yield(.connected(url))
                    }

                    guard let data = Self.extractData(from: message) else { continue }
                    guard let decoded = try? decoder.decode(OutboundWebSocketMessage.self, from: data) else { continue }

                    if case let .forceKeepAliveMessage(message) = decoded, let seconds = message.data {
                        intervalContinuation.yield(.seconds(Double(seconds) / 2.0))
                    }

                    eventsContinuation.yield(.message(decoded))
                }
            }

            // Outbound writer — drains pending on each wakeup
            group.addTask { [weak self] in
                let encoder = JSONEncoder()

                for await _ in wakeupStream {
                    guard let self else { return }

                    for message in self.pendingMessages() {
                        try await webSocketTask.send(.data(encoder.encode(message)))
                    }
                }
            }

            // Keep-alive sender — starts on first ForceKeepAlive
            group.addTask {
                let encoder = JSONEncoder()

                let keepAlive = InboundWebSocketMessage.inboundKeepAliveMessage(
                    InboundKeepAliveMessage(messageType: .keepAlive)
                )

                let missLimit = 2
                var misses = 0

                for await interval in intervalStream {
                    while !Task.isCancelled {
                        try await webSocketTask.send(.data(encoder.encode(keepAlive)))
                        try await Task.sleep(for: responseTimeout)

                        if activity.elapsed < responseTimeout {
                            misses = 0
                            try await Task.sleep(for: interval - responseTimeout)
                        } else {
                            misses += 1
                            if misses > missLimit {
                                throw SocketError.connectionTimeout
                            }
                            // Loop to resend immediately.
                        }
                    }
                }
            }

            try await group.next()

            group.cancelAll()
        }
    }

    static func extractData(from message: URLSessionWebSocketTask.Message) -> Data? {
        switch message {
        case let .string(text):
            text.data(using: .utf8)
        case let .data(data):
            data
        @unknown default:
            nil
        }
    }
}
