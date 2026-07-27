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
    ///   - reconnectAttempts: Number of consecutive times to retry when the server can't be
    ///     reached, or `nil` to retry until ``Session/disconnect()``. A rejected login ends
    ///     the session either way.
    ///   - reconnectDelay: Initial backoff delay that doubles for each retry, up to 16x.
    ///   - healthyUptime: How long a connection must last to count as a recovery.
    ///     Anything shorter is treated as a server issue.
    ///   - responseTimeout: How long the server has to answer a keep-alive. Three
    ///     unanswered in a row drops the connection.
    ///   - keepAliveInterval: How often to send a keep-alive. Must stay under the
    ///     server's socket timeout, which is 60 seconds.
    public func connect(
        reconnectAttempts: Int? = nil,
        reconnectDelay: Duration = .seconds(2),
        healthyUptime: Duration = .seconds(30),
        responseTimeout: Duration = .seconds(5),
        keepAliveInterval: Duration = .seconds(20)
    ) -> Session {
        Session(
            client: client,
            supportsMediaControl: supportsMediaControl,
            supportedCommands: supportedCommands,
            playableMediaTypes: playableMediaTypes,
            reconnectAttempts: reconnectAttempts,
            reconnectDelay: reconnectDelay,
            healthyUptime: healthyUptime,
            responseTimeout: responseTimeout,
            keepAliveInterval: keepAliveInterval
        )
    }
}

// MARK: - Session

public extension JellyfinSocket {

    /// Releasing the last reference disconnects, so hold onto this for as long as the
    /// socket should stay open.
    final class Session: @unchecked Sendable {

        public enum Event: Sendable {

            /// The socket is attempting to connect.
            case connecting

            /// The socket has received its first message and is connected.
            case connected(URL)

            /// An established connection was lost. Reconnecting continues unless the
            /// stream finishes.
            case disconnected

            /// A message was received from the server.
            case message(OutboundWebSocketMessage)
        }

        public enum SocketError: Error {
            case connectionTimeout

            /// The server rejected the credentials. Retrying won't help.
            case unauthorized(statusCode: Int)

            /// Carries the error from the final attempt.
            case reconnectAttemptsReached(Error?)

            /// Whether reconnecting would repeat the same refusal.
            var isFatal: Bool {
                if case .unauthorized = self { return true }
                return false
            }

            /// The fatal error for a refused status, if it is one.
            static func rejection(statusCode: Int) -> SocketError? {
                guard statusCode == 401 || statusCode == 403 else { return nil }
                return .unauthorized(statusCode: statusCode)
            }
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
        let client: JellyfinClient

        let reconnectAttempts: Int?
        let reconnectDelay: Duration
        let healthyUptime: Duration
        let responseTimeout: Duration
        let keepAliveInterval: Duration

        private let lock = NSLock()
        private var _subscriptions: [Subscription: [UUID: Configuration]] = [:]
        private var _pending: [InboundWebSocketMessage] = []
        private var _wakeup: (@Sendable () -> Void)?
        private var _explicitlyDisconnected = false
        private var _connectedAt: ContinuousClock.Instant?

        // Only touched by the run loop, one cycle at a time.
        var attempts = 0
        var backoff = 0
        var lastError: Error?

        private let eventsContinuation: AsyncThrowingStream<Event, Error>.Continuation
        private var task: Task<Void, Never>!

        // MARK: - Init

        init(
            client: JellyfinClient,
            supportsMediaControl: Bool,
            supportedCommands: [GeneralCommandType],
            playableMediaTypes: [MediaType],
            reconnectAttempts: Int?,
            reconnectDelay: Duration,
            healthyUptime: Duration,
            responseTimeout: Duration,
            keepAliveInterval: Duration
        ) {
            var capabilities = Paths.PostCapabilitiesParameters()

            capabilities.isSupportsMediaControl = supportsMediaControl
            capabilities.supportedCommands = supportedCommands
            capabilities.playableMediaTypes = playableMediaTypes

            self.capabilities = capabilities
            self.client = client

            self.reconnectAttempts = reconnectAttempts
            self.reconnectDelay = reconnectDelay
            self.responseTimeout = responseTimeout

            // Zero uptime disables flap backoff, and the server reaps quiet sockets at 60s.
            self.healthyUptime = max(healthyUptime, .seconds(1))
            self.keepAliveInterval = min(keepAliveInterval, .seconds(45))

            let (events, continuation) = AsyncThrowingStream<Event, Error>.makeStream()
            self.events = events
            self.eventsContinuation = continuation

            self.task = Task { [weak self] in
                /// Scoped so the session isn't held across the wait, letting an
                /// abandoned one deinit instead of reconnecting forever.
                func cycle() async -> Duration? {
                    guard let self else { return nil }

                    return await runCycle()
                }

                while let delay = await cycle() {
                    do {
                        try await Task.sleep(for: delay)
                    } catch {
                        break
                    }
                }
            }
        }

        deinit {
            task?.cancel()
            eventsContinuation.finish()
        }

        // MARK: - Public API

        /// Add a subscription. Sends the start message for a subscription type.
        ///
        /// Subscribers to a topic are counted, and the topic runs at the shortest delay
        /// and interval any of them asked for.
        ///
        /// - Parameters:
        ///   - subscription: The subscription topic.
        ///   - delay: Delay before the first update.
        ///   - interval: Update interval.
        ///
        /// - Returns: A token releasing this subscriber when cancelled.
        @discardableResult
        public func subscribe(
            _ subscription: Subscription,
            delay: Duration = .seconds(5),
            interval: Duration = .seconds(5)
        ) -> SubscriptionToken {
            let id = UUID()

            let configuration = Configuration(
                initialDelay: delay,
                interval: interval
            )

            lock.lock()
            _subscriptions[subscription, default: [:]][id] = configuration
            queueStart(for: subscription)
            let wake = _wakeup
            lock.unlock()
            wake?()

            return SubscriptionToken(session: self, subscription: subscription, id: id)
        }

        /// Unsubscribe every subscriber from a subscription. Cancel a token instead to
        /// release a single subscriber.
        public func unsubscribe(_ subscription: Subscription) {
            lock.lock()
            _subscriptions[subscription] = nil
            _pending.append(subscription.stopMessage)

            let wake = _wakeup
            lock.unlock()
            wake?()
        }

        /// Release one subscriber, stopping the topic once none are left.
        func release(_ subscription: Subscription, id: UUID) {
            lock.lock()

            guard _subscriptions[subscription]?.removeValue(forKey: id) != nil else {
                lock.unlock()
                return
            }

            if _subscriptions[subscription]?.isEmpty ?? true {
                _subscriptions[subscription] = nil
                _pending.append(subscription.stopMessage)
            } else {
                queueStart(for: subscription)
            }

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

        /// The shortest delay and interval any subscriber asked for. Requires the lock.
        func effectiveConfiguration(for subscription: Subscription) -> Configuration? {
            guard let claims = _subscriptions[subscription],
                  let delay = claims.values.map(\.initialDelay).min(),
                  let interval = claims.values.map(\.interval).min()
            else { return nil }

            return Configuration(initialDelay: delay, interval: interval)
        }

        /// Queue a start message at the topic's current pace. Requires the lock.
        func queueStart(for subscription: Subscription) {
            guard let configuration = effectiveConfiguration(for: subscription) else { return }

            _pending.append(subscription.startMessage(data: configuration.startMessage))
        }

        /// One subscriber's claim on a subscription. Cancelling is idempotent.
        public final class SubscriptionToken: @unchecked Sendable {

            private weak var session: Session?
            private let subscription: Subscription
            private let id: UUID
            private let lock = NSLock()
            private var isCancelled = false

            init(session: Session, subscription: Subscription, id: UUID) {
                self.session = session
                self.subscription = subscription
                self.id = id
            }

            public func cancel() {
                lock.lock()
                let alreadyCancelled = isCancelled
                isCancelled = true
                lock.unlock()

                guard !alreadyCancelled else { return }

                session?.release(subscription, id: id)
            }
        }

        /// How long to wait after `unhealthyCycles` consecutive bad cycles.
        ///
        /// The first retry waits `base` and doubles from there, capped at 16x to stay
        /// under the server's 60 second session timeout.
        static func backoffDelay(base: Duration, unhealthyCycles: Int) -> Duration {
            base * (1 << min(max(unhealthyCycles - 1, 0), 4))
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

    /// Record when a connection was established.
    func markConnected() {
        lock.lock()
        defer { lock.unlock() }

        _connectedAt = .now
    }

    /// How long the connection lasted, if one was established since this was last read.
    func consumeUptime() -> Duration? {
        lock.lock()
        defer { lock.unlock() }

        guard let connectedAt = _connectedAt else { return nil }

        _connectedAt = nil
        return connectedAt.duration(to: .now)
    }

    func setWakeup(_ block: (@Sendable () -> Void)?) {
        lock.lock()
        defer { lock.unlock() }

        _wakeup = block
    }

    /// Snapshot active subscriptions and clear the pending queue, so a reconnect starts
    /// from the active set rather than replaying buffered start and stop messages.
    func consumeInitialMessages() -> [InboundWebSocketMessage] {
        lock.lock()
        defer { lock.unlock() }

        _pending = []

        return _subscriptions.keys.compactMap { subscription in
            guard let configuration = effectiveConfiguration(for: subscription) else { return nil }

            return subscription.startMessage(data: configuration.startMessage)
        }
    }

    func pendingMessages() -> [InboundWebSocketMessage] {
        lock.lock()
        defer { lock.unlock() }

        let pending = _pending
        _pending = []
        return pending
    }

    /// Run one connection to completion and report how long to wait before the next,
    /// or `nil` once the session is over.
    func runCycle() async -> Duration? {
        guard !Task.isCancelled, !isExplicitlyDisconnected else {
            eventsContinuation.finish()
            return nil
        }

        var refusal: (any Error)?

        do {
            try await connect(
                responseTimeout: responseTimeout,
                keepAliveInterval: keepAliveInterval
            )
        } catch let error as SocketError where error.isFatal {
            refusal = error
        } catch {
            lastError = error
        }

        let uptime = consumeUptime()

        // Only report a drop the caller saw, so this pairs with `connected`.
        if uptime != nil {
            eventsContinuation.yield(.disconnected)
        }

        if let refusal {
            eventsContinuation.finish(throwing: refusal)
            return nil
        }

        guard !Task.isCancelled, !isExplicitlyDisconnected else {
            eventsContinuation.finish()
            return nil
        }

        switch uptime {
        case let uptime? where uptime >= healthyUptime:
            attempts = 0
            backoff = 0

        // Flapping. The server is reachable, so back off without spending the budget.
        case .some:
            backoff += 1

        case nil:
            attempts += 1
            backoff += 1
        }

        if let reconnectAttempts, attempts > reconnectAttempts {
            eventsContinuation.finish(throwing: SocketError.reconnectAttemptsReached(lastError))
            return nil
        }

        return Self.backoffDelay(base: reconnectDelay, unhealthyCycles: backoff)
    }

    func connect(responseTimeout: Duration, keepAliveInterval: Duration) async throws {
        let url = try client.socketURL

        eventsContinuation.yield(.connecting)

        // Register capabilities before the WebSocket connects so the session is controllable.
        // A failure isn't fatal here: refused credentials surface again on the handshake.
        _ = try? await client.send(Paths.postCapabilities(parameters: capabilities))

        let urlSession = URLSession(configuration: .default)

        // Runs last, after the close below, so the frame flushes instead of being cut off
        // and logged server-side as a connection dropped without a handshake.
        defer { urlSession.finishTasksAndInvalidate() }

        var request = URLRequest(url: url)
        request.setValue(client.authorizationHeaders, forHTTPHeaderField: "Authorization")

        let webSocketTask = urlSession.webSocketTask(with: request)
        webSocketTask.resume()

        var isRejected = false

        defer {
            webSocketTask.cancel(with: .goingAway, reason: nil)

            // Re-posting a rejected token is a guaranteed 401.
            if !isRejected {
                Task.detached { [capabilities, client] in
                    try await client.send(Paths.postCapabilities(parameters: capabilities))
                }
            }
        }

        let (wakeupStream, wakeupContinuation) = AsyncStream<Void>.makeStream()

        setWakeup { wakeupContinuation.yield(()) }

        defer {
            setWakeup(nil)
            wakeupContinuation.finish()
        }

        let encoder = JSONEncoder()

        // Both socket uses stay here: only the first failure still has the response.
        do {
            for message in consumeInitialMessages() {
                try await webSocketTask.send(.data(encoder.encode(message)))
            }

            try await listen(
                webSocketTask: webSocketTask,
                url: url,
                wakeupStream: wakeupStream,
                responseTimeout: responseTimeout,
                keepAliveInterval: keepAliveInterval
            )
        } catch {
            // A refusal surfaces as a generic transport error, so read the status instead.
            guard let response = webSocketTask.response as? HTTPURLResponse,
                  let rejection = SocketError.rejection(statusCode: response.statusCode)
            else { throw error }

            isRejected = true
            throw rejection
        }
    }

    func listen(
        webSocketTask: URLSessionWebSocketTask,
        url: URL,
        wakeupStream: AsyncStream<Void>,
        responseTimeout: Duration,
        keepAliveInterval: Duration
    ) async throws {
        let activity = ActivityClock()
        let eventsContinuation = self.eventsContinuation

        let _: Void = try await withThrowingTaskGroup { group in

            // Read loop
            group.addTask { [weak self] in
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .formatted(OpenISO8601DateFormatter())

                var hasYieldedConnected = false

                while !Task.isCancelled {
                    let message = try await webSocketTask.receive()

                    activity.touch()

                    if !hasYieldedConnected {
                        hasYieldedConnected = true
                        self?.markConnected()
                        eventsContinuation.yield(.connected(url))
                    }

                    guard let data = Self.extractData(from: message) else { continue }
                    guard let decoded = try? decoder.decode(OutboundWebSocketMessage.self, from: data) else { continue }

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

            // Keep-alive sender
            group.addTask {
                let encoder = JSONEncoder()

                let keepAlive = InboundWebSocketMessage.inboundKeepAliveMessage(
                    WebSocketMessageTypeInfo(messageType: .keepAlive)
                )

                let missLimit = 2
                var misses = 0

                // Compared across the send, since elapsed time can't tell an answer from slop.
                while !Task.isCancelled {
                    let mark = activity.lastMessage

                    try await webSocketTask.send(.data(encoder.encode(keepAlive)))
                    try await Task.sleep(for: responseTimeout)

                    if activity.lastMessage != mark {
                        misses = 0
                        // Clamped: a responseTimeout above the interval would busy-loop.
                        try await Task.sleep(for: max(keepAliveInterval - responseTimeout, .zero))
                    } else {
                        misses += 1

                        if misses > missLimit {
                            throw SocketError.connectionTimeout
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
