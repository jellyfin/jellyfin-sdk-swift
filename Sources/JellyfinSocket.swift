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

    private let client: JellyfinClient
    private let supportsMediaControl: Bool
    private let supportedCommands: [GeneralCommandType]
    private let playableMediaTypes: [MediaType]

    public init(
        client: JellyfinClient,
        supportsMediaControl: Bool = false,
        supportedCommands: [GeneralCommandType] = GeneralCommandType.allCases,
        playableMediaTypes: [MediaType] = [.video, .audio]
    ) {
        self.client = client
        self.supportsMediaControl = supportsMediaControl
        self.supportedCommands = supportedCommands
        self.playableMediaTypes = playableMediaTypes
    }

    /// Open a WebSocket session.
    ///
    /// The session reconnects with exponential backoff on transport errors and
    /// re-sends active subscriptions on each reconnect.
    ///
    /// - Parameters:
    ///   - maxReconnectAttempts: Number of times to retry on transport errors.
    ///   - reconnectDelayBase: Initial backoff delay that doubles for each retry.
    ///   - responseTimeout: Maximum silence from the server before disconnecting.
    public func connect(
        maxReconnectAttempts: Int = 5,
        reconnectDelayBase: Duration = .seconds(2),
        responseTimeout: Duration = .seconds(90)
    ) -> Session {
        Session(
            client: client,
            supportsMediaControl: supportsMediaControl,
            supportedCommands: supportedCommands,
            playableMediaTypes: playableMediaTypes,
            maxReconnectAttempts: maxReconnectAttempts,
            reconnectDelayBase: reconnectDelayBase,
            responseTimeout: responseTimeout
        )
    }
}

// MARK: - Session

public extension JellyfinSocket {

    final class Session: @unchecked Sendable {

        public enum Event: Sendable {

            /// The socket has begun connecting (initial connection or a reconnect).
            case connecting

            /// The socket has received its first message and is connected.
            case connected(URL)

            /// A message was received from the server.
            case message(OutboundWebSocketMessage)
        }

        public enum SocketError: Error, LocalizedError, Equatable, Sendable {

            case connectionTimeout
            case invalidURL
            case maxReconnectAttemptsReached
            case missingAccessToken

            public var errorDescription: String? {
                switch self {
                case .connectionTimeout:
                    "Connection timed out"
                case .invalidURL: 
                    "Invalid WebSocket URL"
                case .maxReconnectAttemptsReached: 
                    "Maximum reconnection attempts reached"
                case .missingAccessToken: 
                    "Missing access token"
                }
            }
        }

        /// Stream of events emitted by the server.
        /// Iterating this stream pulls events for the lifetime of the session.
        public let events: AsyncThrowingStream<Event, Error>

        // MARK: - State

        struct Config: Sendable, Hashable {
            let initialDelay: Duration
            let interval: Duration
        }

        private let lock = NSLock()
        private var _subscriptions: [SocketSubscription: Config] = [:]
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
            maxReconnectAttempts: Int,
            reconnectDelayBase: Duration,
            responseTimeout: Duration
        ) {
            let (events, continuation) = AsyncThrowingStream<Event, Error>.makeStream()
            self.events = events
            self.eventsContinuation = continuation

            self.task = Task { [weak self] in
                await self?.run(
                    client: client,
                    supportsMediaControl: supportsMediaControl,
                    supportedCommands: supportedCommands,
                    playableMediaTypes: playableMediaTypes,
                    maxReconnectAttempts: maxReconnectAttempts,
                    reconnectDelayBase: reconnectDelayBase,
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
        ///   - initialDelay: Delay before the first update; defaults to the
        ///     subscription's `defaultInitialDelay`.
        ///   - interval: Update cadence; defaults to the subscription's
        ///     `defaultInterval`.
        public func subscribe(
            _ subscription: SocketSubscription,
            initialDelay: Duration? = nil,
            interval: Duration? = nil
        ) {
            let config = Config(
                initialDelay: initialDelay ?? subscription.defaultInitialDelay,
                interval: interval ?? subscription.defaultInterval
            )

            lock.lock()
            _subscriptions[subscription] = config
            _pending.append(subscription.startMessage(initialDelay: config.initialDelay, interval: config.interval))
            let wake = _wakeup
            lock.unlock()
            wake?()
        }

        /// Remove a subscription.
        /// Sends the stop message if connected, otherwise drops it from the active set.
        public func unsubscribe(_ subscription: SocketSubscription) {
            lock.lock()
            _subscriptions[subscription] = nil
            _pending.append(subscription.stopMessage)
            let wake = _wakeup
            lock.unlock()
            wake?()
        }

        /// Close the session. The `events` stream finishes after this call.
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
    /// Used at (re)connect so the initial state matches the active subscription set without duplicating buffered start/stop messages.
    func consumeInitialMessages() -> [InboundWebSocketMessage] {
        lock.lock()
        defer { lock.unlock() }
        _pending = []
        return _subscriptions.map { subscription, config in
            subscription.startMessage(initialDelay: config.initialDelay, interval: config.interval)
        }
    }

    func drainPending() -> [InboundWebSocketMessage] {
        lock.lock()
        defer { lock.unlock() }
        let pending = _pending
        _pending = []
        return pending
    }
}

// MARK: - Run loop

private extension JellyfinSocket.Session {

    func run(
        client: JellyfinClient,
        supportsMediaControl: Bool,
        supportedCommands: [GeneralCommandType],
        playableMediaTypes: [MediaType],
        maxReconnectAttempts: Int,
        reconnectDelayBase: Duration,
        responseTimeout: Duration
    ) async {
        var attempts = 0

        while !Task.isCancelled, !isExplicitlyDisconnected {
            do {
                try await sessionAttempt(
                    client: client,
                    supportsMediaControl: supportsMediaControl,
                    supportedCommands: supportedCommands,
                    playableMediaTypes: playableMediaTypes,
                    responseTimeout: responseTimeout
                )
                eventsContinuation.finish()
                return
            } catch is CancellationError {
                eventsContinuation.finish()
                return
            } catch let error as SocketError where error == .invalidURL || error == .missingAccessToken {
                eventsContinuation.finish(throwing: error)
                return
            } catch {
                attempts += 1
                guard attempts <= maxReconnectAttempts else {
                    eventsContinuation.finish(throwing: SocketError.maxReconnectAttemptsReached)
                    return
                }
                let delay = reconnectDelayBase * Int(pow(2.0, Double(attempts - 1)))
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

    func sessionAttempt(
        client: JellyfinClient,
        supportsMediaControl: Bool,
        supportedCommands: [GeneralCommandType],
        playableMediaTypes: [MediaType],
        responseTimeout: Duration
    ) async throws {
        guard let url = try buildSocketURL(client: client) else { throw SocketError.invalidURL }

        eventsContinuation.yield(.connecting)

        // Register capabilities BEFORE the WebSocket connects so the session is controllable.
        try await Self.updateCapabilities(
            client: client,
            supportsMediaControl: supportsMediaControl,
            supportedCommands: supportedCommands,
            playableMediaTypes: playableMediaTypes
        )

        let urlSession = URLSession(configuration: .default)
        defer { urlSession.invalidateAndCancel() }

        var request = URLRequest(url: url)
        request.setValue(client.authHeaders, forHTTPHeaderField: "Authorization")

        let webSocketTask = urlSession.webSocketTask(with: request)
        webSocketTask.resume()

        defer {
            webSocketTask.cancel(with: .goingAway, reason: nil)
            Task.detached { [client, supportsMediaControl, supportedCommands, playableMediaTypes] in
                try? await Self.updateCapabilities(
                    client: client,
                    supportsMediaControl: supportsMediaControl,
                    supportedCommands: supportedCommands,
                    playableMediaTypes: playableMediaTypes
                )
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
            try await webSocketTask.send(.data(try encoder.encode(message)))
        }

        try await runPipes(
            webSocketTask: webSocketTask,
            url: url,
            wakeupStream: wakeupStream,
            responseTimeout: responseTimeout
        )
    }

    func runPipes(
        webSocketTask: URLSessionWebSocketTask,
        url: URL,
        wakeupStream: AsyncStream<Void>,
        responseTimeout: Duration
    ) async throws {
        let activity = ActivityClock()
        let (intervalStream, intervalContinuation) = AsyncStream<Duration>.makeStream()
        let eventsContinuation = self.eventsContinuation

        try await withThrowingTaskGroup(of: Void.self) { group in

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

                    guard let data = Self.extractData(from: message),
                          let decoded = try? decoder.decode(OutboundWebSocketMessage.self, from: data)
                    else { continue }

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
                    for message in self.drainPending() {
                        try await webSocketTask.send(.data(try encoder.encode(message)))
                    }
                }
            }

            // Keep-alive sender — starts on first ForceKeepAlive
            group.addTask {
                let encoder = JSONEncoder()
                let keepAlive = InboundWebSocketMessage.inboundKeepAliveMessage(
                    InboundKeepAliveMessage(messageType: .keepAlive)
                )

                for await interval in intervalStream {
                    while !Task.isCancelled {
                        let data = try encoder.encode(keepAlive)
                        try await webSocketTask.send(.data(data))
                        try await Task.sleep(for: interval)
                    }
                }
            }

            // Server response timeout
            group.addTask {
                while !Task.isCancelled {
                    try await Task.sleep(for: .seconds(5))
                    if activity.elapsed > responseTimeout {
                        throw SocketError.connectionTimeout
                    }
                }
            }

            try await group.next()
            group.cancelAll()
        }
    }
}

// MARK: - Helpers

private extension JellyfinSocket.Session {

    func buildSocketURL(client: JellyfinClient) throws -> URL? {
        guard let token = client.accessToken else { throw SocketError.missingAccessToken }
        guard var components = URLComponents(url: client.configuration.url, resolvingAgainstBaseURL: false)
        else { return nil }

        components.scheme = components.scheme == "https" ? "wss" : "ws"
        components.path = "/socket"
        components.queryItems = [
            URLQueryItem(name: "api_key", value: token),
            URLQueryItem(name: "deviceId", value: client.configuration.deviceID)
        ].compactMap { $0 }

        return components.url
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

    static func updateCapabilities(
        client: JellyfinClient,
        supportsMediaControl: Bool,
        supportedCommands: [GeneralCommandType],
        playableMediaTypes: [MediaType]
    ) async throws {
        var parameters = Paths.PostCapabilitiesParameters()
        parameters.isSupportsMediaControl = supportsMediaControl
        parameters.supportedCommands = supportedCommands
        parameters.playableMediaTypes = playableMediaTypes

        try await client.send(Paths.postCapabilities(parameters: parameters))
    }
}

// MARK: - ActivityClock

private final class ActivityClock: @unchecked Sendable {

    private let lock = NSLock()
    private var instant: ContinuousClock.Instant = .now

    func touch() {
        lock.lock()
        defer { lock.unlock() }
        instant = .now
    }

    var elapsed: Duration {
        lock.lock()
        defer { lock.unlock() }
        return instant.duration(to: .now)
    }
}
