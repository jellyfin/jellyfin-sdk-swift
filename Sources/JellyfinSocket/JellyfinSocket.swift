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
    ///   - reconnectAttempts: Consecutive retries when the server can't be reached, or `nil`
    ///     for no limit. Reaching the server resets the count. A rejected login always ends.
    ///   - reconnectDelay: Initial backoff delay that doubles for each retry, up to 16x.
    ///   - healthyUptime: How long a connection must last to count as a recovery.
    ///   - responseTimeout: How long the server has to answer a keep-alive, three misses drops it.
    ///   - keepAliveInterval: Keep-alive period. Must stay under the server's 60 second timeout.
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

    /// Call ``Session/disconnect()`` to close the socket. A session released between
    /// connection attempts also ends, but one that is connected holds itself open.
    final class Session: @unchecked Sendable {

        public enum Event: Sendable {

            /// The socket is attempting to connect.
            case connecting

            /// The socket has received its first message and is connected.
            case connected(URL)

            /// An established connection was lost. Reconnecting continues unless the stream finishes.
            case disconnected

            /// A message was received from the server.
            case message(OutboundWebSocketMessage)
        }

        public enum SocketError: Error {
            case connectionTimeout

            /// There is no access token to connect with. Sign in first.
            case missingAccessToken

            /// The server rejected the credentials. Retrying won't help.
            case unauthorized(statusCode: Int)

            /// Carries the error from the final attempt.
            case reconnectAttemptsReached(Error?)

            /// Whether reconnecting would repeat the same refusal.
            var isFatal: Bool {
                switch self {
                case .missingAccessToken, .unauthorized:
                    true
                default:
                    false
                }
            }

            /// The fatal error for a refused status, if it is one.
            static func rejection(statusCode: Int) -> SocketError? {
                guard statusCode == 401 || statusCode == 403 else { return nil }
                return .unauthorized(statusCode: statusCode)
            }
        }

        /// Stream of events emitted by the server, for the lifetime of the session.
        /// The buffer is bounded, so two `connected` in a row means events were dropped.
        public let events: AsyncThrowingStream<Event, Error>

        // MARK: - State

        struct Configuration: Hashable {
            let initialDelay: Duration
            let interval: Duration

            /// The payload a start message carries.
            var payload: String {
                "\(initialDelay.milliseconds),\(interval.milliseconds)"
            }
        }

        /// Cycle bookkeeping, owned by the run loop so nothing else can reach it.
        struct RunState {
            var failedConnections = 0
            var unhealthyCycles = 0
            var lastError: (any Error)?
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
            self.reconnectDelay = max(reconnectDelay, .milliseconds(100))
            self.responseTimeout = max(responseTimeout, .milliseconds(1))
            self.healthyUptime = max(healthyUptime, .seconds(1))
            self.keepAliveInterval = min(max(keepAliveInterval, .seconds(1)), .seconds(45))

            let (events, continuation) = AsyncThrowingStream<Event, Error>.makeStream(
                bufferingPolicy: .bufferingNewest(512)
            )

            self.events = events
            self.eventsContinuation = continuation

            self.task = Task { [weak self, continuation] in
                // Also covers a cancel landing in the sleep below.
                defer { continuation.finish() }

                var state = RunState()

                /// Scoped so an abandoned session can deinit between cycles.
                func cycle() async -> (RunState, Duration)? {
                    guard let self else { return nil }

                    return await runCycle(state: state)
                }

                while let (updated, delay) = await cycle() {
                    state = updated

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

        /// Unsubscribe every subscriber from a subscription.
        /// Cancel a token instead to release a single subscriber.
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

        /// The shortest delay and interval any subscriber asked for.
        func configuration(for subscription: Subscription) -> Configuration? {
            lock.lock()
            defer { lock.unlock() }

            return effectiveConfiguration(for: subscription)
        }

        /// The shortest delay and interval any subscriber asked for. Caller must hold `lock`.
        func effectiveConfiguration(for subscription: Subscription) -> Configuration? {
            guard let claims = _subscriptions[subscription],
                  let delay = claims.values.map(\.initialDelay).min(),
                  let interval = claims.values.map(\.interval).min()
            else { return nil }

            return Configuration(initialDelay: delay, interval: interval)
        }

        /// Queue a start message at the topic's current pace. Caller must hold `lock`.
        func queueStart(for subscription: Subscription) {
            guard let configuration = effectiveConfiguration(for: subscription) else { return }

            _pending.append(subscription.startMessage(data: configuration.payload))
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

    /// Snapshot active subscriptions, so a reconnect starts from those rather than the queue.
    func consumeInitialMessages() -> [InboundWebSocketMessage] {
        lock.lock()
        defer { lock.unlock() }

        _pending = []

        return _subscriptions.keys.compactMap { subscription in
            guard let configuration = effectiveConfiguration(for: subscription) else { return nil }

            return subscription.startMessage(data: configuration.payload)
        }
    }

    func pendingMessages() -> [InboundWebSocketMessage] {
        lock.lock()
        defer { lock.unlock() }

        let pending = _pending
        _pending = []
        return pending
    }

    /// Run one connection to completion. `nil` ends the session.
    func runCycle(state: RunState) async -> (RunState, Duration)? {
        guard !Task.isCancelled, !isExplicitlyDisconnected else { return nil }

        var state = state
        var refusal: SocketError?

        do {
            try await connect(
                responseTimeout: responseTimeout,
                keepAliveInterval: keepAliveInterval
            )
        } catch let error as SocketError where error.isFatal {
            refusal = error
        } catch {
            state.lastError = error
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

        guard !Task.isCancelled, !isExplicitlyDisconnected else { return nil }

        switch uptime {
        case let uptime? where uptime >= healthyUptime:
            state.failedConnections = 0
            state.unhealthyCycles = 0
            state.lastError = nil

        // Flapping. The server is reachable, so back off without spending the budget.
        case .some:
            state.failedConnections = 0
            state.unhealthyCycles += 1
            state.lastError = nil

        case nil:
            state.failedConnections += 1
            state.unhealthyCycles += 1
        }

        if let reconnectAttempts, state.failedConnections > reconnectAttempts {
            eventsContinuation.finish(throwing: SocketError.reconnectAttemptsReached(state.lastError))
            return nil
        }

        return (state, Self.backoffDelay(base: reconnectDelay, unhealthyCycles: state.unhealthyCycles))
    }

    func connect(responseTimeout: Duration, keepAliveInterval: Duration) async throws {
        let url: URL

        do {
            url = try client.socketURL
        } catch JellyfinClient.ClientError.noAccessToken {
            throw SocketError.missingAccessToken
        }

        eventsContinuation.yield(.connecting)

        // Not fatal: refused credentials surface again on the handshake.
        _ = try? await client.send(Paths.postCapabilities(parameters: capabilities))

        let urlSession = URLSession(configuration: .default)

        // Runs after the close below so the frame flushes instead of being cut off.
        defer { urlSession.finishTasksAndInvalidate() }

        var request = URLRequest(url: url)
        request.setValue(client.authorizationHeaders, forHTTPHeaderField: "Authorization")

        let webSocketTask = urlSession.webSocketTask(with: request)
        webSocketTask.resume()

        var isRejected = false

        defer {
            webSocketTask.cancel(with: .goingAway, reason: nil)

            // The server drops the device from /Sessions once the socket closes.
            if !isRejected, !isExplicitlyDisconnected {
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

        try await withThrowingTaskGroup(of: Void.self) { group in

            // MARK: Read loop

            group.addTask { [weak self] in
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .formatted(OpenISO8601DateFormatter())

                var hasYieldedConnected = false

                // `receive()` ignores Swift cancellation, so only cancelling the task unblocks it.
                try await withTaskCancellationHandler {
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
                } onCancel: {
                    webSocketTask.cancel(with: .goingAway, reason: nil)
                }
            }

            // MARK: Outbound writer

            group.addTask { [weak self] in
                let encoder = JSONEncoder()

                for await _ in wakeupStream {
                    guard let self else { return }

                    for message in self.pendingMessages() {
                        try await webSocketTask.send(.data(encoder.encode(message)))
                    }
                }
            }

            // MARK: Keep-alive sender

            group.addTask {
                let encoder = JSONEncoder()

                let keepAlive = InboundWebSocketMessage.inboundKeepAliveMessage(
                    WebSocketMessageTypeInfo(messageType: .keepAlive)
                )

                let missLimit = 2
                var misses = 0

                // Compared across the send, since elapsed time can't tell an answer from just timing.
                while !Task.isCancelled {
                    let mark = activity.lastMessage

                    try await webSocketTask.send(.data(encoder.encode(keepAlive)))
                    try await Task.sleep(for: responseTimeout)

                    if activity.lastMessage != mark {
                        misses = 0
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
