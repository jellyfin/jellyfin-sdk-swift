//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Combine
import Foundation
import Logging

public final class JellyfinSocket: ObservableObject, @unchecked Sendable {

    // MARK: - Public Properties

    @MainActor
    public let messages = PassthroughSubject<OutboundWebSocketMessage, Never>()

    @Published
    public private(set) var state: SocketState = .idle

    @Published
    public private(set) var lastServerActivity: Date?

    @Published
    public private(set) var subscriptions = Set<SocketSubscription>()

    // MARK: - Configuration

    private let client: JellyfinClient
    private let userID: String?
    private let supportsMediaControl: Bool
    private let supportedCommands: [GeneralCommandType]
    private var logger: Logger

    // MARK: - Connection Settings

    private let maxReconnectAttempts = 5
    private let reconnectDelayBase: TimeInterval = 2.0
    private let connectionTimeout: TimeInterval = 10.0
    private let serverResponseTimeout: TimeInterval = 90.0
    private var keepAliveInterval: TimeInterval = 20.0

    // MARK: - Internal State

    private var urlSession: URLSession!
    private var webSocketTask: URLSessionWebSocketTask?
    private var reconnectAttempts = 0
    private var explicitlyDisconnected = false
    private var messageQueue: [Data] = []
    private var cancellables = Set<AnyCancellable>()

    // MARK: - Timers

    private var keepAliveTimer: Timer?
    private var connectionTimeoutTimer: Timer?
    private var responseTimeoutTimer: Timer?

    // MARK: - JSON Coding

    private let encoder = JSONEncoder()
    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(OpenISO8601DateFormatter())
        return decoder
    }()

    // MARK: - Init

    public init(
        client: JellyfinClient,
        userID: String? = nil,
        supportsMediaControl: Bool = false,
        supportedCommands: [GeneralCommandType] = GeneralCommandType.allCases,
        logger: Logger = Logger(label: "JellyfinSocket")
    ) {
        self.client = client
        self.userID = userID
        self.supportsMediaControl = supportsMediaControl
        self.supportedCommands = supportedCommands
        self.logger = logger

        let queue = OperationQueue()
        queue.name = "org.jellyfin.sdk.websocket"
        queue.maxConcurrentOperationCount = 1

        self.urlSession = URLSession(
            configuration: .default,
            delegate: nil,
            delegateQueue: queue
        )
    }

    deinit {
        explicitlyDisconnected = true
        webSocketTask?.cancel(with: .goingAway, reason: nil)
        invalidateTimers()

        Task.detached { [client, supportsMediaControl, supportedCommands] in
            await Self.updateCapabilities(
                client: client,
                supportsMediaControl: supportsMediaControl,
                supportedCommands: supportedCommands,
                enable: false
            )
        }
    }

    // MARK: - Connect

    public func connect() {
        guard !state.isConnected, webSocketTask == nil else {
            logger.warning("Already connected or connecting")
            return
        }

        explicitlyDisconnected = false
        state = .connecting
        reconnectAttempts = 0

        startConnectionTimeout()

        Task.detached { [weak self] in
            await self?.establishConnection()
        }
    }

    // MARK: - Disconnect

    public func disconnect() {
        logger.info("Disconnecting")
        explicitlyDisconnected = true
        performDisconnect(error: SocketError.explicitDisconnect)
    }

    // MARK: - Send

    @discardableResult
    public func send(_ message: InboundWebSocketMessage) -> Bool {
        guard !explicitlyDisconnected else {
            logger.warning("Cannot send while disconnected")
            return false
        }

        do {
            let data = try encoder.encode(message)
            return send(data)
        } catch {
            logger.error("Failed to encode message: \(error)")
            return false
        }
    }

    // MARK: - Subscribe

    public func subscribe(_ subscription: SocketSubscription) {
        subscriptions.insert(subscription)

        let message: InboundWebSocketMessage = switch subscription {
        case .activityLog:
            .activityLogEntryStartMessage(ActivityLogEntryStartMessage(data: subscription.data, messageType: .activityLogEntryStart))
        case .scheduledTasks:
            .scheduledTasksInfoStartMessage(ScheduledTasksInfoStartMessage(data: subscription.data, messageType: .scheduledTasksInfoStart))
        case .sessions:
            .sessionsStartMessage(SessionsStartMessage(data: subscription.data, messageType: .sessionsStart))
        }

        send(message)
    }

    // MARK: - Unsubscribe

    public func unsubscribe(_ subscription: SocketSubscription) {
        subscriptions.remove(subscription)

        let message: InboundWebSocketMessage = switch subscription {
        case .activityLog:
            .activityLogEntryStopMessage(ActivityLogEntryStopMessage(messageType: .activityLogEntryStop))
        case .scheduledTasks:
            .scheduledTasksInfoStopMessage(ScheduledTasksInfoStopMessage(messageType: .scheduledTasksInfoStop))
        case .sessions:
            .sessionsStopMessage(SessionsStopMessage(messageType: .sessionsStop))
        }

        send(message)
    }
}

// MARK: - Connection

private extension JellyfinSocket {

    func establishConnection() async {
        guard !explicitlyDisconnected else {
            await MainActor.run { state = .closed(error: SocketError.explicitDisconnect) }
            return
        }

        guard let url = buildSocketURL() else {
            await MainActor.run { handleDisconnection(error: SocketError.invalidURL) }
            return
        }

        logger.info("Connecting to \(url.host ?? "unknown")")

        webSocketTask = urlSession.webSocketTask(with: URLRequest(url: url))
        webSocketTask?.resume()
        listen()
    }

    func buildSocketURL() -> URL? {
        guard let token = client.accessToken else {
            logger.error("Missing access token")
            return nil
        }

        guard var components = URLComponents(url: client.configuration.url, resolvingAgainstBaseURL: false) else {
            return nil
        }

        components.scheme = components.scheme == "https" ? "wss" : "ws"
        components.path = "/socket"
        components.queryItems = [
            URLQueryItem(name: "api_key", value: token),
            URLQueryItem(name: "deviceId", value: client.configuration.deviceID),
            userID.map { URLQueryItem(name: "user_id", value: $0) }
        ].compactMap { $0 }

        return components.url
    }
}

// MARK: - Listening

private extension JellyfinSocket {

    func listen() {
        webSocketTask?.receive { [weak self] result in
            guard let self else { return }

            Task { @MainActor in
                guard !self.explicitlyDisconnected else { return }

                switch result {
                case .success(let message):
                    self.handleMessage(message)
                    self.listen()
                case .failure(let error):
                    self.handleReceiveError(error)
                }
            }
        }
    }

    func handleMessage(_ message: URLSessionWebSocketTask.Message) {
        connectionTimeoutTimer?.invalidate()

        if case .connecting = state {
            onConnected()
        }

        lastServerActivity = Date()
        resetResponseTimeout()

        guard let data = extractData(from: message) else { return }

        do {
            let decoded = try decoder.decode(OutboundWebSocketMessage.self, from: data)
            handleDecodedMessage(decoded)
        } catch {
            logger.error("Failed to decode message: \(error)")
        }
    }

    func extractData(from message: URLSessionWebSocketTask.Message) -> Data? {
        switch message {
        case .string(let text):
            return text.data(using: .utf8)
        case .data(let data):
            return data
        @unknown default:
            return nil
        }
    }

    func handleDecodedMessage(_ message: OutboundWebSocketMessage) {
        Task { @MainActor in
            messages.send(message)
        }

        switch message {
        case .forceKeepAliveMessage(let msg):
            if let interval = msg.data {
                keepAliveInterval = Double(interval) / 2.0
                startKeepAlive()
                sendKeepAlive()
            }
        case .outboundKeepAliveMessage:
            logger.debug("KeepAlive pong")
        default:
            break
        }
    }

    func handleReceiveError(_ error: Error) {
        let nsError = error as NSError
        if nsError.domain == NSURLErrorDomain && nsError.code == NSURLErrorCancelled {
            logger.info("WebSocket cancelled")
            return
        }
        logger.error("Receive error: \(error)")
        handleDisconnection(error: error)
    }
}

// MARK: - Connection Lifecycle

private extension JellyfinSocket {

    func onConnected() {
        logger.info("Connected")

        if let url = webSocketTask?.currentRequest?.url {
            state = .connected(url: url)
        }

        reconnectAttempts = 0

        Task.detached { [client, supportsMediaControl, supportedCommands] in
            await Self.updateCapabilities(
                client: client,
                supportsMediaControl: supportsMediaControl,
                supportedCommands: supportedCommands,
                enable: true
            )
        }

        resubscribe()
        flushMessageQueue()
        startKeepAlive()
    }

    func performDisconnect(error: Error?) {
        invalidateTimers()
        webSocketTask?.cancel(with: .goingAway, reason: nil)
        webSocketTask = nil
        messageQueue.removeAll()
        state = .closed(error: error)
    }

    func handleDisconnection(error: Error?) {
        invalidateTimers()
        webSocketTask?.cancel(with: .normalClosure, reason: nil)
        webSocketTask = nil

        if explicitlyDisconnected {
            state = .closed(error: SocketError.explicitDisconnect)
            return
        }

        guard reconnectAttempts < maxReconnectAttempts else {
            logger.error("Max reconnect attempts reached")
            state = .error(SocketError.maxReconnectAttemptsReached)
            return
        }

        reconnectAttempts += 1
        let delay = pow(reconnectDelayBase, Double(reconnectAttempts))
        logger.info("Reconnecting in \(delay)s (attempt \(reconnectAttempts)/\(maxReconnectAttempts))")

        state = .connecting

        Task {
            try? await Task.sleep(nanoseconds: UInt64(delay * 1_000_000_000))
            guard !explicitlyDisconnected else { return }
            await establishConnection()
        }
    }
}

// MARK: - Message Queue

private extension JellyfinSocket {

    @discardableResult
    func send(_ data: Data) -> Bool {
        guard state.isConnected, let task = webSocketTask else {
            if !explicitlyDisconnected {
                messageQueue.append(data)
            }
            return !explicitlyDisconnected
        }

        task.send(.data(data)) { [weak self] error in
            if let error {
                self?.logger.error("Send error: \(error)")
            }
        }
        return true
    }

    func flushMessageQueue() {
        let queued = messageQueue
        messageQueue.removeAll()
        queued.forEach { send($0) }
    }

    func resubscribe() {
        subscriptions.forEach { subscribe($0) }
    }
}

// MARK: - Keep Alive

private extension JellyfinSocket {

    func sendKeepAlive() {
        logger.debug("KeepAlive ping")
        send(.inboundKeepAliveMessage(InboundKeepAliveMessage(messageType: .keepAlive)))
    }

    func startKeepAlive() {
        stopKeepAlive()

        sendKeepAlive()
        resetResponseTimeout()

        keepAliveTimer = Timer.scheduledTimer(withTimeInterval: keepAliveInterval, repeats: true) { [weak self] _ in
            guard let self, self.state.isConnected, !self.explicitlyDisconnected else {
                self?.stopKeepAlive()
                return
            }
            self.sendKeepAlive()
            self.resetResponseTimeout()
        }
    }

    func stopKeepAlive() {
        keepAliveTimer?.invalidate()
        keepAliveTimer = nil
        responseTimeoutTimer?.invalidate()
        responseTimeoutTimer = nil
    }
}

// MARK: - Timers

private extension JellyfinSocket {

    func startConnectionTimeout() {
        connectionTimeoutTimer?.invalidate()
        connectionTimeoutTimer = Timer.scheduledTimer(withTimeInterval: connectionTimeout, repeats: false) { [weak self] _ in
            guard let self, self.state == .connecting else { return }
            self.logger.error("Connection timeout")
            self.handleDisconnection(error: SocketError.connectionTimeout)
        }
    }

    func resetResponseTimeout() {
        responseTimeoutTimer?.invalidate()
        responseTimeoutTimer = Timer.scheduledTimer(withTimeInterval: serverResponseTimeout, repeats: false) { [weak self] _ in
            guard let self, self.state.isConnected, !self.explicitlyDisconnected else { return }
            self.logger.warning("Server response timeout")
            self.handleDisconnection(error: SocketError.connectionTimeout)
        }
    }

    func invalidateTimers() {
        keepAliveTimer?.invalidate()
        keepAliveTimer = nil
        connectionTimeoutTimer?.invalidate()
        connectionTimeoutTimer = nil
        responseTimeoutTimer?.invalidate()
        responseTimeoutTimer = nil
    }
}

// MARK: - Capabilities

private extension JellyfinSocket {

    static func updateCapabilities(
        client: JellyfinClient,
        supportsMediaControl: Bool,
        supportedCommands: [GeneralCommandType],
        enable: Bool
    ) async {
        var parameters = Paths.PostCapabilitiesParameters()
        parameters.isSupportsMediaControl = enable ? supportsMediaControl : false
        parameters.supportedCommands = enable ? supportedCommands : nil

        try? await client.send(Paths.postCapabilities(parameters: parameters))
    }
}
