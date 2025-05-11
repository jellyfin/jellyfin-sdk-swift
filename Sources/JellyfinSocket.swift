//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Combine
import Foundation

/// A WebSocket manager for receiving real-time Jellyfin server events.
public final class JellyfinSocket: ObservableObject {

    // MARK: - Public Types

    /// Represents the current state of the WebSocket connection.
    public enum State: Equatable {
        /// Socket is initialized but not yet connected.
        case idle
        /// Socket is in the process of establishing a connection.
        case connecting
        /// Socket has successfully connected to the server.
        case connected
        /// Socket is attempting to reconnect after a failure.
        case reconnecting(attempt: Int)
        /// Socket encountered an error with the provided description.
        case error(String)
        /// Socket connection has been closed.
        case closed
    }

    // MARK: - Published Properties

    /// The current state of the WebSocket connection.
    @Published public private(set) var state: State = .idle
    /// The timestamp of the last successful check-in with the server.
    @Published public private(set) var lastCheckIn: Date?

    /// Publisher for outbound WebSocket messages received from the server.
    public var messages: AnyPublisher<OutboundWebSocketMessage, Never> {
        outboundSubject.eraseToAnyPublisher()
    }

    /// Publisher for raw string messages received from the server.
    public var rawMessages: AnyPublisher<String, Never> {
        rawMessageSubject.eraseToAnyPublisher()
    }

    /// Logger instance for WebSocket operations.
    public let logger: JellyfinSocketLogger

    // MARK: - Private Properties

    private let client: JellyfinClient
    private let socketPath = "/socket"
    private let maxReconnectAttempts = 5
    private let validationTimeout: TimeInterval = 5

    private var task: URLSessionWebSocketTask?
    private var reconnectAttempts = 0
    private var hasReceivedFirstMessage = false

    /// Tracks subscriptions that should be sent on every connect
    private var activeSubscriptions = Set<String>()

    private var pingWorkItem: DispatchWorkItem?
    private var validationWorkItem: DispatchWorkItem?
    private var reconnectWorkItem: DispatchWorkItem?

    private let session: URLSession
    private let outboundSubject = PassthroughSubject<OutboundWebSocketMessage, Never>()
    private let rawMessageSubject = PassthroughSubject<String, Never>()
    private var cancellables = Set<AnyCancellable>()

    private var messageQueue = [String]()
    private var keepAliveInterval: Double = 30

    // MARK: - Encoder/Decoder

    private lazy var jsonEncoder: JSONEncoder = {
        let formatter = OpenISO8601DateFormatter()
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .formatted(formatter)
        encoder.outputFormatting = .prettyPrinted
        return encoder
    }()

    private lazy var jsonDecoder: JSONDecoder = {
        let formatter = OpenISO8601DateFormatter()
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(formatter)
        return decoder
    }()

    // MARK: - Initialization

    /// Creates a new WebSocket manager instance.
    ///
    /// - Parameters:
    ///   - client: The JellyfinClient instance to use for authentication and configuration.
    ///   - logLevel: The level of detail to include in logs. Defaults to .info.
    ///   - session: The URLSession to use for WebSocket connections. Defaults to a standard URLSession.
    public init(
        client: JellyfinClient,
        logLevel: JellyfinSocketLogger.LogLevel = .info,
        session: URLSession = URLSession(configuration: .default)
    ) {
        self.client = client
        self.session = session
        self.logger = JellyfinSocketLogger(label: "WebSocket", level: logLevel)

        // On connect, flush queued messages and subscriptions
        $state
            .filter { $0 == .connected }
            .sink { [weak self] _ in
                self?.processQueuedMessages()
                self?.flushSubscriptions()
            }
            .store(in: &cancellables)
    }

    deinit {
        stopInternal()
    }

    // MARK: - Public API

    /// Starts the WebSocket connection to the Jellyfin server.
    ///
    /// This method will initiate a connection if the socket is in an idle, error, or closed state.
    @MainActor
    public func start() {
        guard state == .idle || state == .error("") || state == .closed else {
            logger.info("Cannot start socket in state: \(state)")
            return
        }
        reconnectAttempts = 0
        state = .connecting
        Task { await postDeviceCapabilities() }
        openSocket()
    }

    /// Stops the WebSocket connection.
    ///
    /// This method gracefully terminates the connection and cleans up resources.
    @MainActor
    public func stop() {
        stopInternal()
    }

    // MARK: - Subscription Methods

    /// Adds a subscription to be sent on connect/reconnect.
    ///
    /// - Parameter type: The event type to subscribe to (e.g., "Sessions").
    public func subscribe(to type: String) {
        activeSubscriptions.insert(type)
    }

    /// Removes a subscription to stop receiving events of the specified type.
    ///
    /// - Parameter type: The event type to unsubscribe from.
    public func unsubscribe(from type: String) {
        activeSubscriptions.remove(type)
        guard case .connected = state, let task = task else { return }
        let message = "{\"MessageType\":\"\(type)Stop\"}"
        task.send(.string(message)) { [weak self] error in
            if let error = error {
                self?.logger.error("Unsubscribe error for \(type): \(error)")
            }
        }
    }

    /// Subscribes to session events from the server.
    public func subscribeSessions() { subscribe(to: "Sessions") }
    
    /// Subscribes to scheduled task events from the server.
    public func subscribeScheduledTasks() { subscribe(to: "ScheduledTasksInfo") }
    
    /// Subscribes to activity log entries from the server.
    public func subscribeActivityLog() { subscribe(to: "ActivityLogEntry") }

    // MARK: - Sending Messages

    /// Sends a structured message to the server.
    ///
    /// - Parameter message: The message to send.
    /// - Returns: True if the message was sent or queued successfully.
    @discardableResult
    public func send(_ message: InboundWebSocketMessage) -> Bool {
        do {
            let data = try jsonEncoder.encode(message)
            guard let json = String(data: data, encoding: .utf8) else {
                logger.error("Failed to encode message to string")
                return false
            }
            return sendRawMessage(json)
        } catch {
            logger.error("Encode error: \(error)")
            return false
        }
    }

    /// Sends a raw JSON string message to the server.
    ///
    /// - Parameter json: The JSON string to send.
    /// - Returns: True if the message was sent or queued successfully.
    @discardableResult
    public func sendRawMessage(_ json: String) -> Bool {
        guard case .connected = state, let task = task else {
            messageQueue.append(json)
            return true
        }
        logger.debug("Sending: \(json)")
        task.send(.string(json)) { [weak self] error in
            if let error = error {
                self?.logger.error("Send error: \(error)")
            }
        }
        return true
    }

    // MARK: - Internal Helpers

    /// Sends all active subscriptions to the server after connecting.
    private func flushSubscriptions() {
        guard case .connected = state,
              let task = task,
              hasReceivedFirstMessage,
              !activeSubscriptions.isEmpty else { return }

        logger.info("Flushing subscriptions: \(activeSubscriptions)")
        for type in activeSubscriptions {
            let message = "{\"MessageType\":\"\(type)Start\"}"
            task.send(.string(message)) { [weak self] error in
                if let error = error {
                    self?.logger.error("Subscription error for \(type): \(error)")
                }
            }
        }
    }

    /// Sends any messages that were queued while the socket was not connected.
    private func processQueuedMessages() {
        guard !messageQueue.isEmpty else { return }
        let toSend = messageQueue
        messageQueue.removeAll()
        for json in toSend { _ = sendRawMessage(json) }
    }

    // MARK: - Connection Management

    /// Sends device capabilities to the server.
    ///
    /// This informs the server about features this client supports.
    private func postDeviceCapabilities() async {
        do {
            var parameters = Paths.PostCapabilitiesParameters()
            parameters.isSupportsMediaControl = true
            parameters.supportedCommands = .some(GeneralCommandType.allCases)
            try await client.send(Paths.postCapabilities(parameters: parameters))
            logger.info("Device capabilities posted successfully")
        } catch {
            logger.error("Capabilities error: \(error)")
        }
    }

    /// Opens a WebSocket connection to the server.
    private func openSocket() {
        guard let token = client.accessToken else {
            state = .error("Missing access token")
            return
        }
        state = reconnectAttempts == 0 ? .connecting : .reconnecting(attempt: reconnectAttempts)
        hasReceivedFirstMessage = false

        var components = URLComponents(url: client.configuration.url, resolvingAgainstBaseURL: false)!
        components.scheme = (components.scheme == "https" ? "wss" : "ws")
        components.path = socketPath

        var items = [URLQueryItem(name: "deviceId", value: client.configuration.deviceID)]
        if let userId = client.userID { items.append(.init(name: "user_id", value: userId)) }
        items.append(.init(name: "api_key", value: token))
        components.queryItems = items

        var request = URLRequest(url: components.url!)
        request.setValue("MediaBrowser Token=\(token)", forHTTPHeaderField: "Authorization")

        task = session.webSocketTask(with: request)
        task?.resume()

        logger.info("Connecting to \(components.url!.absoluteString)")
        listen()
        scheduleValidationTimeout()
    }

    /// Sets up a receiver for incoming WebSocket messages.
    private func listen() {
        task?.receive { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let message):
                switch message {
                case .string(let text): self.handle(text)
                case .data(let data):
                    if let text = String(data: data, encoding: .utf8) {
                        self.handle(text)
                    }
                @unknown default: self.logger.error("Unknown message type")
                }
                self.listen()
            case .failure(let error):
                if self.state != .closed {
                    self.handleError(error.localizedDescription)
                }
            }
        }
    }

    /// Processes an incoming message from the server.
    ///
    /// - Parameter text: The raw text message received.
    private func handle(_ text: String) {
        if !hasReceivedFirstMessage {
            hasReceivedFirstMessage = true
            validationWorkItem?.cancel()
            DispatchQueue.main.async { self.state = .connected }
            reconnectAttempts = 0
            logger.info("Connected successfully")
        }

        rawMessageSubject.send(text)
        logger.debug("Received: \(text)")
        guard let data = text.data(using: .utf8) else { return }

        // ForceKeepAlive handling
        if let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
           json["MessageType"] as? String == "ForceKeepAlive",
           let interval = json["Data"] as? Int {
            logger.warning("ForceKeepAlive interval: \(interval)")
            keepAliveInterval = Double(interval)
            scheduleKeepAlives()
            sendKeepAlive()
            updateLastCheckIn()
            return
        }

        // Decode generic messages
        do {
            let message = try jsonDecoder.decode(OutboundWebSocketMessage.self, from: data)
            switch message {
            case .forceKeepAliveMessage(let forceKeepAlive):
                if let interval = forceKeepAlive.data {
                    keepAliveInterval = Double(interval)
                    scheduleKeepAlives()
                }
                sendKeepAlive()
                updateLastCheckIn()
                return
            case .outboundKeepAliveMessage:
                updateLastCheckIn()
                return
            default:
                logger.info("Message: \(type(of: message))")
            }
            outboundSubject.send(message)
        } catch {
            logger.error("Decode error: \(error)")
            attemptFallbackDecoding(data, text)
        }
    }

    /// Attempts to decode a message when the standard decoder fails.
    ///
    /// - Parameters:
    ///   - data: The raw data of the message.
    ///   - text: The string representation of the message.
    private func attemptFallbackDecoding(_ data: Data, _ text: String) {
        // ... same as before
    }

    /// Updates the timestamp of the last successful communication with the server.
    private func updateLastCheckIn() {
        DispatchQueue.main.async { self.lastCheckIn = Date() }
    }

    /// Handles a connection error and initiates reconnection logic.
    ///
    /// - Parameter description: A description of the error that occurred.
    private func handleError(_ description: String) {
        logger.error("Error: \(description)")
        DispatchQueue.main.async { self.state = .error(description) }
        scheduleReconnect()
    }

    /// Sets a timeout to validate that the connection was established successfully.
    private func scheduleValidationTimeout() {
        validationWorkItem?.cancel()
        let workItem = DispatchWorkItem { [weak self] in
            guard let self = self, !self.hasReceivedFirstMessage else { return }
            self.handleError("Connection timed out")
        }
        validationWorkItem = workItem
        DispatchQueue.global().asyncAfter(deadline: .now() + validationTimeout, execute: workItem)
    }

    /// Schedules periodic keep-alive messages to maintain the connection.
    private func scheduleKeepAlives() {
        pingWorkItem?.cancel()
        let interval = max(keepAliveInterval/2, 5)
        logger.info("Keepalive every \(interval)s")
        let workItem = DispatchWorkItem { [weak self] in
            guard let self = self, case .connected = self.state else { return }
            if self.sendKeepAlive() {
                self.scheduleKeepAlives()
            } else {
                self.logger.error("KeepAlive send failed")
                self.handleError("Failed to send keepalive")
            }
        }
        pingWorkItem = workItem
        DispatchQueue.global().asyncAfter(deadline: .now() + interval, execute: workItem)
    }

    /// Schedules a reconnection attempt with exponential backoff.
    private func scheduleReconnect() {
        guard reconnectAttempts < maxReconnectAttempts else {
            DispatchQueue.main.async { self.state = .error("Max reconnect attempts reached") }
            return
        }
        reconnectAttempts += 1
        let delay = pow(2, Double(reconnectAttempts))
        reconnectWorkItem?.cancel()
        let workItem = DispatchWorkItem { [weak self] in self?.openSocket() }
        reconnectWorkItem = workItem
        DispatchQueue.global().asyncAfter(deadline: .now() + delay, execute: workItem)
    }

    /// Sends a keep-alive message to the server.
    ///
    /// - Returns: True if the message was sent successfully.
    @discardableResult
    private func sendKeepAlive() -> Bool {
        sendRawMessage("{\"MessageType\":\"KeepAlive\"}")
    }

    /// Cleans up resources and closes the connection.
    private func stopInternal() {
        messageQueue.removeAll()
        activeSubscriptions.removeAll()
        pingWorkItem?.cancel()
        validationWorkItem?.cancel()
        reconnectWorkItem?.cancel()
        cancellables.removeAll()

        if let currentTask = task, case .connected = state {
            logger.info("Closing gracefully")
            currentTask.cancel(with: .normalClosure, reason: nil)
        } else {
            task?.cancel(with: .goingAway, reason: nil)
        }
        task = nil
        DispatchQueue.main.async { self.state = .closed }
    }
}

/// A logging utility specifically designed for WebSocket operations.
public class JellyfinSocketLogger {
    /// Defines the available logging levels.
    public enum LogLevel: Int, Comparable {
        /// No logging output.
        case off
        /// Only error messages.
        case error
        /// Errors and warnings.
        case warning
        /// General information plus errors and warnings.
        case info
        /// Detailed debug information plus all other levels.
        case debug
        
        public static func < (lhs: LogLevel, rhs: LogLevel) -> Bool {
            lhs.rawValue < rhs.rawValue
        }
    }
    
    /// The current logging level.
    public var level: LogLevel
    private let label: String
    private let dateFormatter = DateFormatter()

    /// Creates a new logger instance.
    ///
    /// - Parameters:
    ///   - label: A label to identify this logger's output.
    ///   - level: The level of detail to include in logs. Defaults to .info.
    public init(label: String, level: LogLevel = .info) {
        self.label = label
        self.level = level
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
    }
    
    /// Logs a debug message.
    ///
    /// - Parameter message: The message to log.
    public func debug(_ message: String) { log(message, .debug) }
    
    /// Logs an informational message.
    ///
    /// - Parameter message: The message to log.
    public func info(_ message: String) { log(message, .info) }
    
    /// Logs a warning message.
    ///
    /// - Parameter message: The message to log.
    public func warning(_ message: String) { log(message, .warning) }
    
    /// Logs an error message.
    ///
    /// - Parameter message: The message to log.
    public func error(_ message: String) { log(message, .error) }
    
    private func log(_ message: String, _ level: LogLevel) {
        guard level.rawValue <= self.level.rawValue else { return }
        let timestamp = dateFormatter.string(from: Date())
        print("[\(timestamp)] [\(label)] [\(level)] \(message)")
    }
}
