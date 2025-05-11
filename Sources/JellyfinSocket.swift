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
        /// Socket is initialized but not connected
        case idle
        /// Socket is in the process of connecting
        case connecting
        /// Socket is successfully connected and ready
        case connected
        /// Socket is attempting to reconnect after disconnection
        case reconnecting(attempt: Int)
        /// Socket encountered an error
        case error(String)
        /// Socket is intentionally closed
        case closed
    }

    /// Strongly-typed subscription targets (periodic feeds).
    public enum SubscriptionType {
        /// Session updates: initial delay ms, interval ms
        case sessions(initialDelay: Int = 0, interval: Int = 30_000)
        /// Scheduled task updates
        case scheduledTasks(initialDelay: Int = 0, interval: Int = 60_000)
        /// Activity log entries
        case activityLog(initialDelay: Int = 0, interval: Int = 60_000)

        /// Returns the message type used to start a subscription
        var startMessageType: String {
            switch self {
            case .sessions:
                return "SessionsStart"
            case .scheduledTasks:
                return "ScheduledTasksInfoStart"
            case .activityLog:
                return "ActivityLogEntryStart"
            }
        }
        
        /// Returns the message type used to stop a subscription
        var stopMessageType: String {
            switch self {
            case .sessions:
                return "SessionsStop"
            case .scheduledTasks:
                return "ScheduledTasksInfoStop"
            case .activityLog:
                return "ActivityLogEntryStop"
            }
        }

        /// Returns the data string format used in subscription requests
        var dataString: String {
            let (initialDelay, interval): (Int,Int)
            switch self {
            case let .sessions(delay, intervalValue),
                 let .scheduledTasks(delay, intervalValue),
                 let .activityLog(delay, intervalValue):
                initialDelay = delay; interval = intervalValue
            }
            return "\(initialDelay),\(interval)"
        }
        
        /// Maps subscription types to session message types they produce
        var relatedMessageTypes: [SessionMessageType] {
            switch self {
            case .sessions:
                return [.sessions]
            case .scheduledTasks:
                return [.scheduledTasksInfo, .scheduledTaskEnded]
            case .activityLog:
                return [.activityLogEntry]
            }
        }
    }

    // MARK: - Published Properties

    /// Current state of the WebSocket connection
    @Published public private(set) var state: State = .idle
    
    /// Timestamp of the last successful keep-alive check
    @Published public private(set) var lastCheckIn: Date?
    
    /// Set of message types the client is interested in receiving
    @Published public private(set) var activeTypes = Set<SessionMessageType>()

    // MARK: - Message Publishers
    
    /// Publisher for filtered WebSocket messages according to subscribed types
    public var messages: AnyPublisher<OutboundWebSocketMessage, Never> {
        if activeTypes.isEmpty {
            return outboundSubject.eraseToAnyPublisher()
        } else {
            return outboundSubject
                .filter { [weak self] message in
                    guard let self = self else { return false }
                    return self.messageMatchesActiveTypes(message)
                }
                .eraseToAnyPublisher()
        }
    }
    
    /// Raw message publisher without filtering
    public var allMessages: AnyPublisher<OutboundWebSocketMessage, Never> {
        return outboundSubject.eraseToAnyPublisher()
    }
    
    /// Publisher for raw string messages received from the server
    public var rawMessages: AnyPublisher<String, Never> {
        rawMessageSubject.eraseToAnyPublisher()
    }

    /// Logger for WebSocket operations
    public let logger: JellyfinSocketLogger

    // MARK: - Private Properties

    /// The JellyfinClient instance used for authentication and configuration
    private let client: JellyfinClient
    
    /// WebSocket endpoint path
    private let socketPath = "/socket"
    
    /// Maximum number of reconnection attempts before giving up
    private let maxReconnectAttempts = 5
    
    /// Timeout for initial connection validation in seconds
    private let validationTimeout: TimeInterval = 5

    /// The active WebSocket task
    private var task: URLSessionWebSocketTask?
    
    /// Counter for reconnection attempts
    private var reconnectAttempts = 0
    
    /// Flag to track whether the first message has been received
    private var hasReceivedFirstMessage = false

    /// Tracks active server-side subscriptions
    private var activeSubscriptions = Set<String>()

    /// DispatchWorkItem for scheduling ping/keep-alive messages
    private var pingWorkItem: DispatchWorkItem?
    
    /// DispatchWorkItem for initial connection validation timeout
    private var validationWorkItem: DispatchWorkItem?
    
    /// DispatchWorkItem for scheduling reconnection attempts
    private var reconnectWorkItem: DispatchWorkItem?

    /// URLSession used for WebSocket connection
    private let session: URLSession
    
    /// Subject for broadcasting processed WebSocket messages
    private let outboundSubject = PassthroughSubject<OutboundWebSocketMessage, Never>()
    
    /// Subject for broadcasting raw WebSocket messages
    private let rawMessageSubject = PassthroughSubject<String, Never>()
    
    /// Storage for Combine cancellables
    private var cancellables = Set<AnyCancellable>()

    /// Queue for messages that couldn't be sent immediately
    private var messageQueue = [String]()
    
    /// Interval in seconds between keep-alive messages
    private var keepAliveInterval: Double = 30

    // MARK: - Encoder/Decoder

    /// JSON encoder configured for Jellyfin API
    private lazy var jsonEncoder: JSONEncoder = {
        let formatter = OpenISO8601DateFormatter()
        let e = JSONEncoder()
        e.dateEncodingStrategy = .formatted(formatter)
        e.outputFormatting = .prettyPrinted
        return e
    }()
    
    /// JSON decoder configured for Jellyfin API
    private lazy var jsonDecoder: JSONDecoder = {
        let formatter = OpenISO8601DateFormatter()
        let d = JSONDecoder()
        d.dateDecodingStrategy = .formatted(formatter)
        return d
    }()

    // MARK: - Initialization

    /// Initializes a new JellyfinSocket instance
    /// - Parameters:
    ///   - client: The JellyfinClient instance to use for authentication and configuration
    ///   - logLevel: The desired logging level (default: .info)
    ///   - session: The URLSession to use for network operations (default: a new session with default configuration)
    public init(
        client: JellyfinClient,
        logLevel: JellyfinSocketLogger.LogLevel = .info,
        session: URLSession = .init(configuration: .default)
    ) {
        self.client = client
        self.session = session
        self.logger = JellyfinSocketLogger(label: "WebSocket", level: logLevel)

        // On connect, flush queued messages & subscriptions
        $state
            .filter { $0 == .connected }
            .sink { [weak self] _ in
                self?.processQueuedMessages()
                self?.flushSubscriptions()
            }
            .store(in: &cancellables)
    }

    /// Cleans up resources when the instance is deallocated
    deinit {
        stopInternal()
    }
    
    // MARK: - Message Type Filtering
    
    /// Determines if a message matches the user's active message types
    /// - Parameter message: The message to check
    /// - Returns: True if the message should be delivered based on active types
    private func messageMatchesActiveTypes(_ message: OutboundWebSocketMessage) -> Bool {
        // If no filters, allow all messages
        if activeTypes.isEmpty {
            return true
        }
        
        // Extract the message type and check if it's in the active types
        let messageType: SessionMessageType?
        
        switch message {
        case .sessionsMessage:
            messageType = .sessions
        case .generalCommandMessage:
            messageType = .generalCommand
        case .userDataChangedMessage:
            messageType = .userDataChanged
        case .playMessage:
            messageType = .play
        case .playstateMessage:
            messageType = .playstate
        case .syncPlayCommandMessage:
            messageType = .syncPlayCommand
        case .syncPlayGroupUpdateCommandMessage:
            messageType = .syncPlayGroupUpdate
        case .restartRequiredMessage:
            messageType = .restartRequired
        case .serverShuttingDownMessage:
            messageType = .serverShuttingDown
        case .serverRestartingMessage:
            messageType = .serverRestarting
        case .libraryChangedMessage:
            messageType = .libraryChanged
        case .userDeletedMessage:
            messageType = .userDeleted
        case .userUpdatedMessage:
            messageType = .userUpdated
        case .seriesTimerCreatedMessage:
            messageType = .seriesTimerCreated
        case .timerCreatedMessage:
            messageType = .timerCreated
        case .seriesTimerCancelledMessage:
            messageType = .seriesTimerCancelled
        case .timerCancelledMessage:
            messageType = .timerCancelled
        case .refreshProgressMessage:
            messageType = .refreshProgress
        case .scheduledTaskEndedMessage:
            messageType = .scheduledTaskEnded
        case .scheduledTasksInfoMessage:
            messageType = .scheduledTasksInfo
        case .activityLogEntryMessage:
            messageType = .activityLogEntry
        case .pluginInstallationCancelledMessage:
            messageType = .packageInstallationCancelled
        case .pluginInstallationCompletedMessage:
            messageType = .packageInstallationCompleted
        case .pluginInstallationFailedMessage:
            messageType = .packageInstallationFailed
        case .pluginInstallingMessage:
            messageType = .packageInstalling
        case .pluginUninstalledMessage:
            messageType = .packageUninstalled
        case .forceKeepAliveMessage:
            messageType = .forceKeepAlive
        case .outboundKeepAliveMessage:
            messageType = .keepAlive
        }
        
        // Check if the message type is in the active types
        return messageType.map { activeTypes.contains($0) } ?? false
    }

    // MARK: - Public API

    /// Starts the WebSocket connection
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

    /// Stops the WebSocket connection
    @MainActor
    public func stop() {
        stopInternal()
    }
    
    // MARK: - Message Type Subscription (Client-side Filtering)
    
    /// Subscribe to receive messages of specific types
    /// - Parameter types: Array of message types to subscribe to
    public func subscribe(to types: [SessionMessageType]) {
        DispatchQueue.main.async {
            self.activeTypes.formUnion(Set(types))
        }
    }
    
    /// Subscribe to receive messages of a specific type
    /// - Parameter type: Message type to subscribe to
    public func subscribe(to type: SessionMessageType) {
        DispatchQueue.main.async {
            self.activeTypes.insert(type)
        }
    }
    
    /// Unsubscribe from receiving messages of specific types
    /// - Parameter types: Array of message types to unsubscribe from
    public func unsubscribe(from types: [SessionMessageType]) {
        DispatchQueue.main.async {
            for type in types {
                self.activeTypes.remove(type)
            }
        }
    }
    
    /// Unsubscribe from receiving messages of a specific type
    /// - Parameter type: Message type to unsubscribe from
    public func unsubscribe(from type: SessionMessageType) {
        DispatchQueue.main.async {
            self.activeTypes.remove(type)
        }
    }
    
    // MARK: - Server Feed Activation
    
    /// Activate a server-side subscription feed
    /// - Parameter type: The subscription type to activate
    public func activate(_ type: SubscriptionType) {
        // Register the subscription with the server
        activeSubscriptions.insert(type.startMessageType)
        
        // Also subscribe to the related message types for client-side filtering
        subscribe(to: type.relatedMessageTypes)
        
        // Send the subscription request to the server
        let request = SubscriptionRequest(MessageType: type.startMessageType, Data: type.dataString)
        guard
            let data = try? jsonEncoder.encode(request),
            let json = String(data: data, encoding: .utf8)
        else {
            logger.error("Failed to encode subscription \(type)")
            return
        }
        _ = sendRawMessage(json)
    }
    
    /// Deactivate a server-side subscription feed
    /// - Parameter type: The subscription type to deactivate
    public func deactivate(_ type: SubscriptionType) {
        activeSubscriptions.remove(type.startMessageType)
        
        // Send unsubscribe request to the server
        let stopMsg = SubscriptionStop(MessageType: type.stopMessageType)
        guard
            let data = try? jsonEncoder.encode(stopMsg),
            let json = String(data: data, encoding: .utf8)
        else {
            // Fallback to simpler JSON if encoding fails
            _ = sendRawMessage("{\"MessageType\":\"\(type.stopMessageType)\"}")
            return
        }
        _ = sendRawMessage(json)
    }
    
    // MARK: - Convenience Methods for Common Use Cases
    
    /// Activate sessions feed and subscribe to session messages
    public func activateSessions() {
        activate(.sessions())
    }
    
    /// Activate scheduled tasks feed and subscribe to task messages
    public func activateScheduledTasks() {
        activate(.scheduledTasks())
    }
    
    /// Activate activity log feed and subscribe to log messages
    public func activateActivityLog() {
        activate(.activityLog())
    }

    /// Send a structured message
    /// - Parameter message: The message to send
    /// - Returns: True if the message was sent or queued successfully
    @discardableResult
    public func send(_ message: InboundWebSocketMessage) -> Bool {
        do {
            let data = try jsonEncoder.encode(message)
            guard let json = String(data: data, encoding: .utf8) else {
                logger.error("Failed to encode message")
                return false
            }
            return sendRawMessage(json)
        } catch {
            logger.error("Encode error: \(error)")
            return false
        }
    }

    /// Send a raw JSON string
    /// - Parameter json: The JSON string to send
    /// - Returns: True if the message was sent or queued successfully
    @discardableResult
    public func sendRawMessage(_ json: String) -> Bool {
        guard case .connected = state, let task = task else {
            // Queue the message for later if not connected
            messageQueue.append(json)
            return true
        }
        logger.debug("Sending: \(json)")
        task.send(.string(json)) { [weak self] err in
                            if let error = err { self?.logger.error("Send error: \(error)") }
        }
        return true
    }

    // MARK: - Internal Helpers

    /// Flushes active subscriptions on connect/reconnect
    private func flushSubscriptions() {
        guard case .connected = state,
              let task = task,
              hasReceivedFirstMessage,
              !activeSubscriptions.isEmpty else { return }

        logger.info("Flushing subscriptions: \(activeSubscriptions)")
        for type in activeSubscriptions {
            let msg = "{\"MessageType\":\"\(type)\"}"
            task.send(.string(msg)) { [weak self] err in
                if let error = err { self?.logger.error("Sub error for \(type): \(error)") }
            }
        }
    }

    /// Sends queued messages
    private func processQueuedMessages() {
        guard !messageQueue.isEmpty else { return }
        let queue = messageQueue; messageQueue.removeAll()
        for json in queue { _ = sendRawMessage(json) }
    }

    /// Posts device capabilities to the server
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

    /// Opens the WebSocket connection
    private func openSocket() {
        guard let token = client.accessToken else {
            state = .error("Missing access token"); return
        }
        state = reconnectAttempts == 0
            ? .connecting : .reconnecting(attempt: reconnectAttempts)
        hasReceivedFirstMessage = false

        // Construct WebSocket URL with authentication parameters
        var urlComponents = URLComponents(url: client.configuration.url,
                                  resolvingAgainstBaseURL: false)!
        urlComponents.scheme = (urlComponents.scheme == "https" ? "wss" : "ws")
        urlComponents.path = socketPath
        var items = [URLQueryItem(name: "deviceId",
                                  value: client.configuration.deviceID)]
        if let userId = client.userID {
            items.append(.init(name: "user_id", value: userId))
        }
        items.append(.init(name: "api_key", value: token))
        urlComponents.queryItems = items

        var request = URLRequest(url: urlComponents.url!)
        request.setValue("MediaBrowser Token=\(token)",
                     forHTTPHeaderField: "Authorization")

        task = session.webSocketTask(with: request)
        task?.resume()
        logger.info("Connecting to \(urlComponents.url!.absoluteString)")
        listen()
        scheduleValidationTimeout()
    }

    /// Listens for incoming messages
    private func listen() {
        task?.receive { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let msg):
                switch msg {
                case .string(let text): self.handle(text)
                case .data(let data):
                    if let textContent = String(data: data, encoding: .utf8) {
                        self.handle(textContent)
                    } else {
                        self.logger.error("Binary → utf8 failed")
                    }
                @unknown default:
                    self.logger.error("Unknown WS msg")
                }
                // Continue listening for the next message
                self.listen()
            case .failure(let err):
                if self.state != .closed {
                    self.handleError(err.localizedDescription)
                }
            }
        }
    }

    /// Processes an incoming text message
    /// - Parameter text: The message text to process
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

        // Handle ForceKeepAlive - special case handling before full decoding
        if let json = try? JSONSerialization.jsonObject(with: data) as? [String:Any],
           json["MessageType"] as? String == "ForceKeepAlive",
           let interval = json["Data"] as? Int {
            logger.warning("ForceKeepAlive interval: \(interval)")
            keepAliveInterval = Double(interval)
            scheduleKeepAlives()
            sendKeepAlive()
            updateLastCheckIn()
            return
        }

        // Decode the full message
        do {
            let message = try jsonDecoder.decode(OutboundWebSocketMessage.self, from: data)
            switch message {
            case .forceKeepAliveMessage(let forceKeepAlive):
                if let intervalValue = forceKeepAlive.data {
                    keepAliveInterval = Double(intervalValue)
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

    /// Attempts to decode messages that failed standard decoding
    /// - Parameters:
    ///   - data: The message data
    ///   - text: The original message text
    private func attemptFallbackDecoding(_ data: Data, _ text: String) {
        if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
           let messageType = json["MessageType"] as? String {
            logger.info("Attempting fallback for: \(messageType)")
            switch messageType {
            case "Sessions":
                let msg = SessionsMessage(
                    data: nil,
                    messageID: json["MessageId"] as? String,
                    messageType: .sessions
                )
                outboundSubject.send(.sessionsMessage(msg))
            case "GeneralCommand":
                if let commandData = json["Data"] as? [String: Any],
                   let commandName = commandData["Name"] as? String {
                    logger.info("GeneralCommand: \(commandName)")
                    let generalCmd = GeneralCommandMessage(
                        data: nil,
                        messageID: json["MessageId"] as? String,
                        messageType: .generalCommand
                    )
                    outboundSubject.send(.generalCommandMessage(generalCmd))
                }
            default:
                logger.warning("Unhandled in fallback: \(messageType)")
            }
        }
    }

    /// Updates the lastCheckIn timestamp
    private func updateLastCheckIn() {
        DispatchQueue.main.async { self.lastCheckIn = Date() }
    }

    /// Handles connection errors
    /// - Parameter desc: The error description
    private func handleError(_ desc: String) {
        logger.error("Error: \(desc)")
        DispatchQueue.main.async { self.state = .error(desc) }
        scheduleReconnect()
    }

    /// Schedules a timeout for initial connection validation
    private func scheduleValidationTimeout() {
        validationWorkItem?.cancel()
        let workItem = DispatchWorkItem { [weak self] in
            guard let weakSelf = self, !weakSelf.hasReceivedFirstMessage else { return }
            weakSelf.handleError("Connection timed out")
        }
        validationWorkItem = workItem
        DispatchQueue.global().asyncAfter(deadline: .now() + validationTimeout, execute: workItem)
    }

    /// Schedules periodic keep-alive messages
    private func scheduleKeepAlives() {
        pingWorkItem?.cancel()
        let interval = max(keepAliveInterval/2, 5)
        logger.info("Keepalive every \(interval)s")
        let workItem = DispatchWorkItem { [weak self] in
            guard let weakSelf = self, case .connected = weakSelf.state else { return }
            if weakSelf.sendKeepAlive() {
                weakSelf.scheduleKeepAlives()
            } else {
                weakSelf.logger.error("KeepAlive send failed")
                weakSelf.handleError("Failed to send keepalive")
            }
        }
        pingWorkItem = workItem
        DispatchQueue.global().asyncAfter(deadline: .now() + interval, execute: workItem)
    }

    /// Schedules a reconnection attempt with exponential backoff
    private func scheduleReconnect() {
        guard reconnectAttempts < maxReconnectAttempts else {
            DispatchQueue.main.async { self.state = .error("Max reconnect attempts reached") }
            return
        }
        reconnectAttempts += 1
        // Exponential backoff: 2^n seconds
        let delay = pow(2, Double(reconnectAttempts))
        reconnectWorkItem?.cancel()
        let workItem = DispatchWorkItem { [weak self] in self?.openSocket() }
        reconnectWorkItem = workItem
        DispatchQueue.global().asyncAfter(deadline: .now() + delay, execute: workItem)
    }

    /// Sends a keep-alive message to the server
    /// - Returns: True if the message was sent or queued successfully
    @discardableResult
    private func sendKeepAlive() -> Bool {
        sendRawMessage("{\"MessageType\":\"KeepAlive\"}")
    }

    /// Gracefully closes the connection and cleans up resources
    private func stopInternal() {
        messageQueue.removeAll()
        activeSubscriptions.removeAll()
        pingWorkItem?.cancel()
        validationWorkItem?.cancel()
        reconnectWorkItem?.cancel()
        cancellables.removeAll()

        if let t = task, case .connected = state {
            logger.info("Closing gracefully")
            t.cancel(with: .normalClosure, reason: nil)
        } else {
            task?.cancel(with: .goingAway, reason: nil)
        }
        task = nil
        DispatchQueue.main.async { self.state = .closed }
    }
}

// MARK: - Subscription payload structs

/// Represents a subscription request to the server
private struct SubscriptionRequest: Codable {
    let MessageType: String
    let Data: String
}

/// Represents a subscription stop request to the server
private struct SubscriptionStop: Codable {
    let MessageType: String
}

// MARK: - Logger

/// Logger for WebSocket events with configurable log levels
public class JellyfinSocketLogger {
    /// Available log levels in ascending order of verbosity
    public enum LogLevel: Int, Comparable {
        case off, error, warning, info, debug
        public static func < (l: LogLevel, r: LogLevel) -> Bool { l.rawValue < r.rawValue }
    }
    
    /// Current log level
    public var level: LogLevel
    
    /// Label prefix for log messages
    private let label: String
    
    /// Date formatter for log timestamps
    private let dateFormatter = DateFormatter()

    /// Initializes a new logger
    /// - Parameters:
    ///   - label: The label to prefix log messages with
    ///   - level: The minimum log level to display (default: .info)
    public init(label: String, level: LogLevel = .info) {
        self.label = label
        self.level = level
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
    }

    /// Logs a message at debug level
    public func debug(_ message: String)   { log(message, .debug) }
    
    /// Logs a message at info level
    public func info(_ message: String)    { log(message, .info) }
    
    /// Logs a message at warning level
    public func warning(_ message: String) { log(message, .warning) }
    
    /// Logs a message at error level
    public func error(_ message: String)   { log(message, .error) }

    /// Internal method to log a message if the level is enabled
    private func log(_ message: String, _ logLevel: LogLevel) {
        guard logLevel.rawValue <= level.rawValue else { return }
        let timestamp = dateFormatter.string(from: Date())
        print("[\(timestamp)] [\(label)] [\(logLevel)] \(message)")
    }
}
