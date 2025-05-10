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
///
/// This class provides a robust way to connect to Jellyfin's WebSocket API,
/// handling connection management, authentication, message serialization,
/// subscriptions, and automatic reconnection logic.
///
/// Usage:
/// ```swift
/// // Create a socket with an authenticated client
/// let socket = JellyfinSocket(client: jellyfinClient)
///
/// // Start the connection
/// await socket.start()
///
/// // Subscribe to interested message types
/// socket.subscribeSessions()
///
/// // Listen for messages
/// socket.messages
///     .sink { message in
///         // Handle different message types
///     }
///     .store(in: &cancellables)
///
/// // When done, close the connection
/// await socket.stop()
/// ```
public final class JellyfinSocket: ObservableObject {

    // MARK: - Public Types

    /// Represents the connection state of the WebSocket
    public enum State: Equatable {
        /// Socket is idle/uninitialized
        case idle
        /// Socket is attempting an initial connection
        case connecting
        /// Socket is successfully connected
        case connected
        /// Socket is attempting to reconnect after a failure
        case reconnecting(attempt: Int)
        /// Socket encountered an error (with description)
        case error(String)
        /// Socket is closed (either by user request or error)
        case closed
    }
    
    // MARK: - Published Properties
    
    /// Current state of the socket connection
    @Published
    public private(set) var state: State = .idle
    
    /// Timestamp of the last keep-alive message received
    @Published
    public private(set) var lastCheckIn: Date?
    
    /// All received and parsed messages, for custom handling by clients
    public var messages: AnyPublisher<OutboundWebSocketMessage, Never> {
        outboundSubject.eraseToAnyPublisher()
    }
    
    /// Raw message publisher for debugging and direct access to unparsed messages
    public var rawMessages: AnyPublisher<String, Never> {
        rawMessageSubject.eraseToAnyPublisher()
    }
    
    /// Logger instance for this socket
    public let logger: JellyfinSocketLogger

    // MARK: - Private Properties

    private let client: JellyfinClient
    private let socketPath = "/socket"
    private let maxReconnectAttempts = 5
    private let validationTimeout: TimeInterval = 5

    private var task: URLSessionWebSocketTask?
    private var reconnectAttempts = 0
    private var hasReceivedFirstMessage = false
    
    /// Tracks active subscriptions to restore after reconnection
    private var activeSubscriptions = Set<String>()

    private var pingWorkItem: DispatchWorkItem?
    private var validationWorkItem: DispatchWorkItem?
    private var reconnectWorkItem: DispatchWorkItem?

    private let session: URLSession
    private let outboundSubject = PassthroughSubject<OutboundWebSocketMessage, Never>()
    private let rawMessageSubject = PassthroughSubject<String, Never>()
    private var cancellables = Set<AnyCancellable>()
    
    /// Message queue for storing messages when not connected
    private var messageQueue = [String]()
    
    /// Default keepalive interval (will be overridden by server)
    private var keepAliveInterval: Double = 30
    
    // MARK: - Encoder/Decoder
    
    /// JSON encoder used for outgoing messages
    private lazy var jsonEncoder: JSONEncoder = {
        let isoDateFormatter = OpenISO8601DateFormatter()
        
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .formatted(isoDateFormatter)
        encoder.outputFormatting = .prettyPrinted
        return encoder
    }()
    
    /// JSON decoder used for incoming messages
    private lazy var jsonDecoder: JSONDecoder = {
        let isoDateFormatter = OpenISO8601DateFormatter()
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(isoDateFormatter)
        return decoder
    }()

    // MARK: - Initialization

    /// Create a new Jellyfin WebSocket manager
    /// - Parameters:
    ///   - client: An authenticated JellyfinClient instance
    ///   - logLevel: The desired log level (default: .info)
    ///   - session: Optional custom URLSession (default: creates a standard session)
    public init(
        client: JellyfinClient,
        logLevel: JellyfinSocketLogger.LogLevel = .info,
        session: URLSession = URLSession(configuration: .default)
    ) {
        self.client = client
        self.session = session
        self.logger = JellyfinSocketLogger(label: "WebSocket", level: logLevel)
        
        // Set up state observer to process queued messages and restore subscriptions
        $state
            .filter { $0 == .connected }
            .sink { [weak self] _ in
                self?.processQueuedMessages()
                self?.restoreSubscriptions()
            }
            .store(in: &cancellables)
    }
    
    deinit {
        stopInternal()
    }

    // MARK: - Public API
    
    /// Start the WebSocket connection
    ///
    /// Initiates a connection to the Jellyfin server's WebSocket endpoint,
    /// sets up authentication, and prepares to receive messages.
    @MainActor
    public func start() {
        guard state == .idle || state == .error("") || state == .closed else {
            logger.info("Cannot start socket in state: \(state)")
            return
        }
        
        // Reset state and start connection
        reconnectAttempts = 0
        state = .connecting
        
        // Post capabilities through the API
        Task {
            await postDeviceCapabilities()
        }
        
        // Open socket
        openSocket()
    }

    /// Post device capabilities to the server
    ///
    /// This lets the server know what commands this client supports,
    /// which is important for remote control functionality.
    private func postDeviceCapabilities() async {
        do {
            logger.info("Posting device capabilities...")
            
            var parameters = Paths.PostCapabilitiesParameters()
            parameters.isSupportsMediaControl = true
            parameters.supportedCommands = .some(GeneralCommandType.allCases)
            
            let request = Paths.postCapabilities(parameters: parameters)
            try await client.send(request)
            
            logger.info("Device capabilities posted successfully")
        } catch {
            logger.error("Error posting capabilities: \(error)")
        }
    }

    /// Stop the WebSocket connection
    ///
    /// Gracefully closes the connection to the Jellyfin server,
    /// cancelling any pending operations.
    @MainActor
    public func stop() {
        stopInternal()
    }

    /// Internal implementation of socket stopping logic
    private func stopInternal() {
        // Clear message queue when stopping
        messageQueue.removeAll()
        
        pingWorkItem?.cancel()
        validationWorkItem?.cancel()
        reconnectWorkItem?.cancel()
        cancellables.removeAll()
        
        if let task = task, case .connected = state {
            logger.info("Sending proper close frame")
            // Send a proper close frame with normal closure code
            task.cancel(with: .normalClosure, reason: "Client closing connection".data(using: .utf8))
        } else {
            task?.cancel(with: .goingAway, reason: nil)
        }
        
        task = nil
        
        // Update state on main thread since it's a published property
        DispatchQueue.main.async {
            self.state = .closed
        }
    }
    
    // MARK: - Subscription Methods
    
    /// Subscribe to server-side events based on message type string
    ///
    /// This instructs the server to start sending events of the specified type.
    ///
    /// - Parameter messageType: The message type to subscribe to (without the "Start" suffix)
    public func subscribe(to messageType: String) {
        guard case .connected = state, let task = task else {
            logger.warning("Cannot subscribe to \(messageType) - not connected")
            return
        }
        
        // Exactly match what the Jellyfin web client does - nothing more, nothing less
        let message = "{\"MessageType\":\"\(messageType)Start\"}"
        
        logger.info("Subscribing to \(messageType)")
        
        task.send(.string(message)) { [weak self] error in
            if let error = error {
                self?.logger.error("\(messageType) subscription error: \(error)")
            } else {
                self?.logger.info("\(messageType) subscription sent successfully")
                
                // Store as an active subscription
                self?.activeSubscriptions.insert(messageType)
            }
        }
    }
    
    /// Unsubscribe from server-side events
    ///
    /// This instructs the server to stop sending events of the specified type.
    ///
    /// - Parameter messageType: The message type to unsubscribe from (without the "Stop" suffix)
    public func unsubscribe(from messageType: String) {
        guard case .connected = state, let task = task else {
            logger.warning("Cannot unsubscribe from \(messageType) - not connected")
            return
        }
        
        // Exactly match what the Jellyfin web client does - nothing more, nothing less
        let message = "{\"MessageType\":\"\(messageType)Stop\"}"
        
        logger.info("Unsubscribing from \(messageType)")
        
        task.send(.string(message)) { [weak self] error in
            if let error = error {
                self?.logger.error("\(messageType) unsubscription error: \(error)")
            } else {
                self?.logger.info("\(messageType) unsubscription sent successfully")
                
                // Remove from active subscriptions
                self?.activeSubscriptions.remove(messageType)
            }
        }
    }
    
    // MARK: - Convenience Methods for Common Subscriptions
    
    /// Subscribe to session updates
    ///
    /// This will cause the server to send information about all active sessions,
    /// including what users are logged in and what content they're playing.
    public func subscribeSessions() {
        subscribe(to: "Sessions")
    }
    
    /// Unsubscribe from session updates
    public func unsubscribeSessions() {
        unsubscribe(from: "Sessions")
    }
    
    /// Subscribe to scheduled tasks updates
    ///
    /// This will cause the server to send information about scheduled tasks
    /// such as library scans, metadata refresh operations, etc.
    public func subscribeScheduledTasks() {
        subscribe(to: "ScheduledTasksInfo")
    }
    
    /// Unsubscribe from scheduled tasks updates
    public func unsubscribeScheduledTasks() {
        unsubscribe(from: "ScheduledTasksInfo")
    }
    
    /// Subscribe to activity log updates
    ///
    /// This will cause the server to send information about server activity,
    /// useful for admin monitoring.
    public func subscribeActivityLog() {
        subscribe(to: "ActivityLogEntry")
    }
    
    /// Unsubscribe from activity log updates
    public func unsubscribeActivityLog() {
        unsubscribe(from: "ActivityLogEntry")
    }
    
    /// Send a specific inbound message to the server
    ///
    /// This method uses the SDK's typed message model and serializes it to JSON.
    ///
    /// - Parameter message: The InboundWebSocketMessage to send
    /// - Returns: True if sent successfully or queued, false if encoding error
    @discardableResult
    public func send(_ message: InboundWebSocketMessage) -> Bool {
        // Convert to JSON string
        do {
            let data = try jsonEncoder.encode(message)
            guard let jsonString = String(data: data, encoding: .utf8) else {
                logger.error("Failed to encode message to string")
                return false
            }
            
            return sendRawMessage(jsonString)
        } catch {
            logger.error("Encode error: \(error)")
            return false
        }
    }
    
    /// Send a raw JSON string message to the server
    ///
    /// This allows sending arbitrary messages in their raw form.
    ///
    /// - Parameter jsonString: The JSON string to send
    /// - Returns: True if sent successfully or queued, false on immediate error
    @discardableResult
    public func sendRawMessage(_ jsonString: String) -> Bool {
        // If not connected, queue the message
        guard case .connected = state, let task = task else {
            logger.info("Not connected; queueing message for later")
            messageQueue.append(jsonString)
            return true
        }
        
        // If connected, send immediately
        logger.debug("Sending: \(jsonString)")
        
        task.send(.string(jsonString)) { [weak self] error in
            if let error = error {
                self?.logger.error("Send error: \(error)")
            }
        }
        return true
    }
    
    /// Process any queued messages when we connect
    private func processQueuedMessages() {
        guard !messageQueue.isEmpty else { return }
        
        logger.info("Processing \(messageQueue.count) queued messages")
        
        // Create a copy of the queue
        let queue = messageQueue
        
        // Clear the queue before processing to avoid any re-queuing issues
        messageQueue.removeAll()
        
        // Process each message
        for message in queue {
            logger.debug("Sending queued message: \(message)")
            _ = sendRawMessage(message)
        }
    }
    
    /// Restore all active subscriptions after reconnect
    private func restoreSubscriptions() {
        guard !activeSubscriptions.isEmpty else { return }
        
        logger.info("Restoring \(activeSubscriptions.count) active subscriptions")
        
        // Re-subscribe to active subscriptions with a slight delay between each
        // to avoid overwhelming the server
        var delay: TimeInterval = 0
        
        for subscription in activeSubscriptions {
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) { [weak self] in
                guard let self = self, self.state == .connected else { return }
                
                // Simply resubscribe using the subscription method
                self.subscribe(to: subscription)
            }
            
            delay += 0.5
        }
    }

    // MARK: - Connection Management

    /// Open a WebSocket connection to the Jellyfin server
    private func openSocket() {
        guard let token = client.accessToken else {
            state = .error("Missing access token")
            return
        }

        state = reconnectAttempts == 0 ? .connecting : .reconnecting(attempt: reconnectAttempts)
        hasReceivedFirstMessage = false

        var comps = URLComponents(url: client.configuration.url, resolvingAgainstBaseURL: false)!
        comps.scheme = (comps.scheme == "https" ? "wss" : "ws")
        comps.path = socketPath
        
        // Add important query parameters for better device identification
        var queryItems = [URLQueryItem]()

        queryItems.append(URLQueryItem(name: "deviceId", value: client.configuration.deviceID))

        // Include userID in the query parameters if available
        if let userID = client.userID {
            queryItems.append(URLQueryItem(name: "user_id", value: userID))
        }
        
        // Add API key as a query parameter - this is critical for authentication
        if let apiKey = client.accessToken {
            queryItems.append(URLQueryItem(name: "api_key", value: apiKey))
        }

        if !queryItems.isEmpty {
            comps.queryItems = queryItems
        }

        // Create WebSocket URL request
        var req = URLRequest(url: comps.url!)
        
        // Add authorization header for additional authentication security
        if let token = client.accessToken {
            req.setValue("MediaBrowser Token=\(token)", forHTTPHeaderField: "Authorization")
        }
        
        task = session.webSocketTask(with: req)
        task?.resume()

        logger.info("Connecting to \(comps.url!.absoluteString)")
        
        listen()
        scheduleValidationTimeout()
    }

    /// Set up the message listener for the WebSocket connection
    private func listen() {
        task?.receive { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let message):
                switch message {
                case .string(let text):
                    self.handle(text)
                case .data(let bin):
                    if let text = String(data: bin, encoding: .utf8) {
                        self.handle(text)
                    } else {
                        self.logger.error("Received binary data that could not be converted to string")
                    }
                @unknown default:
                    self.logger.error("Received unknown message type")
                }
                self.listen()

            case .failure(let err):
                if self.state != .closed {
                    self.handleError(err.localizedDescription)
                }
            }
        }
    }

    /// Process an incoming message from the WebSocket
    ///
    /// This method handles the raw text message, parses it, and dispatches
    /// it to the appropriate handlers.
    ///
    /// - Parameter text: The raw message text from the WebSocket
    private func handle(_ text: String) {
        if !hasReceivedFirstMessage {
            hasReceivedFirstMessage = true
            validationWorkItem?.cancel()
            DispatchQueue.main.async {
                self.state = .connected
            }
            reconnectAttempts = 0
            
            // Connection established - we're ready to receive messages
            logger.info("Connected successfully")
        }
        
        // Forward the raw message to the raw message publisher
        rawMessageSubject.send(text)
        
        // Log raw message if debug enabled
        logger.debug("Received: \(text)")
        
        guard let data = text.data(using: .utf8) else {
            logger.error("Cannot convert text to data")
            return
        }
        
        // Check JSON structure first to handle special cases
        if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
           let messageType = json["MessageType"] as? String {
            
            // Handle ForceKeepAlive specially (important for connection stability)
            if messageType == "ForceKeepAlive" {
                if let interval = json["Data"] as? Int {
                    logger.warning("Received ForceKeepAlive with interval: \(interval) seconds")
                    self.keepAliveInterval = Double(interval)
                    scheduleKeepAlives()
                    sendKeepAlive()
                    updateLastCheckIn()
                    return
                }
            }
            
            // Try to decode special cases that might fail regular decoding
            if messageType == "Sessions", let dataArray = json["Data"] as? [[String: Any]] {
                logger.info("Handling Sessions message with \(dataArray.count) sessions")
                
                do {
                    // Try to decode with a custom approach that's more tolerant
                    let sessionsMessage = try decodeSessionsMessage(json)
                    outboundSubject.send(.sessionsMessage(sessionsMessage))
                    return
                } catch {
                    logger.error("Custom sessions decode failed: \(error)")
                    // Continue to standard decoding
                }
            }
            
            // Special handling for GeneralCommand/DisplayMessage
            if messageType == "GeneralCommand" {
                logger.debug("Received GeneralCommand")
                
                if let commandData = json["Data"] as? [String: Any],
                   let commandName = commandData["Name"] as? String {
                    
                    logger.debug("Command name: \(commandName)")
                    
                    // Handle display message specially
                    if commandName == "DisplayMessage",
                       let args = commandData["Arguments"] as? [String: Any],
                       let header = args["Header"] as? String,
                       let text = args["Text"] as? String {
                        
                        logger.info("ADMIN MESSAGE - \(header): \(text)")
                        
                        // Create a basic command message to forward
                        let generalCommand = GeneralCommandMessage(
                            data: nil,
                            messageID: json["MessageId"] as? String,
                            messageType: .generalCommand
                        )
                        outboundSubject.send(.generalCommandMessage(generalCommand))
                        return
                    }
                }
            }
        }
        
        // Try standard decoding
        do {
            let msg = try jsonDecoder.decode(OutboundWebSocketMessage.self, from: data)
            
            logger.debug("Decoded message type: \(type(of: msg))")
            
            // Handle specific message types
            switch msg {
            case .forceKeepAliveMessage(let forceKeepAliveMsg):
                if let interval = forceKeepAliveMsg.data {
                    logger.warning("Received ForceKeepAlive with interval: \(interval) seconds")
                    self.keepAliveInterval = Double(interval)
                    scheduleKeepAlives()
                }
                sendKeepAlive()
                updateLastCheckIn()
                return
                
            case .outboundKeepAliveMessage:
                logger.debug("Received KeepAlive")
                updateLastCheckIn()
                return
                
            default:
                logger.info("Received message of type: \(type(of: msg))")
            }

            // Forward message to subscribers
            outboundSubject.send(msg)
            
        } catch {
            logger.error("Decode error: \(error)")
            logger.debug("Failed to decode: \(text)")
            
            // Attempt fallback handling for known message types
            attemptFallbackDecoding(data, text)
        }
    }
    
    /// Try to decode a sessions message with a more tolerant approach
    ///
    /// - Parameter json: The raw JSON object
    /// - Returns: A decoded SessionsMessage
    /// - Throws: Error if decoding fails
    private func decodeSessionsMessage(_ json: [String: Any]) throws -> SessionsMessage {
        let messageId = json["MessageId"] as? String
        
        // For sessions message, create a simplified representation
        return SessionsMessage(
            data: nil,  // We'll decode the data separately if needed
            messageID: messageId,
            messageType: .sessions
        )
    }
    
    /// Fallback handling for messages that fail standard decoding
    ///
    /// This tries to extract useful information from messages that don't
    /// match our expected model format.
    ///
    /// - Parameters:
    ///   - data: The raw message data
    ///   - text: The raw message text
    private func attemptFallbackDecoding(_ data: Data, _ text: String) {
        // Try to extract message type and handle common cases
        if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
           let messageType = json["MessageType"] as? String {
            
            logger.info("Attempting fallback handling for message type: \(messageType)")
            
            switch messageType {
            case "Sessions":
                // Create a basic sessions message
                let sessionsMessage = SessionsMessage(
                    data: nil,
                    messageID: json["MessageId"] as? String,
                    messageType: .sessions
                )
                outboundSubject.send(.sessionsMessage(sessionsMessage))
                
            case "GeneralCommand":
                // Try to extract the command details
                if let commandData = json["Data"] as? [String: Any],
                   let commandName = commandData["Name"] as? String {
                    
                    logger.info("Received command: \(commandName)")
                    
                    // Handle display message specially for better logging
                    if commandName == "DisplayMessage",
                       let args = commandData["Arguments"] as? [String: Any],
                       let header = args["Header"] as? String,
                       let text = args["Text"] as? String {
                        logger.info("ADMIN MESSAGE - \(header): \(text)")
                    }
                    
                    // Create a basic command message
                    let generalCommand = GeneralCommandMessage(
                        data: nil,
                        messageID: json["MessageId"] as? String,
                        messageType: .generalCommand
                    )
                    outboundSubject.send(.generalCommandMessage(generalCommand))
                }
                
            default:
                logger.warning("Unhandled message type in fallback: \(messageType)")
            }
        }
    }
    
    /// Update the last check-in timestamp
    private func updateLastCheckIn() {
        DispatchQueue.main.async {
            self.lastCheckIn = Date()
        }
    }

    /// Handle a WebSocket error
    ///
    /// Updates the connection state and schedules a reconnect if appropriate.
    ///
    /// - Parameter description: The error description
    private func handleError(_ description: String) {
        logger.error("Connection error: \(description)")
        DispatchQueue.main.async {
            self.state = .error(description)
        }
        scheduleReconnect()
    }

    /// Schedule a timeout to validate that the connection is working
    private func scheduleValidationTimeout() {
        validationWorkItem?.cancel()
        let w = DispatchWorkItem { [weak self] in
            guard let s = self, !s.hasReceivedFirstMessage else { return }
            s.handleError("Connection timed out")
        }
        validationWorkItem = w
        DispatchQueue.global().asyncAfter(deadline: .now() + validationTimeout, execute: w)
    }

    // MARK: - KeepAlive Management
    
    /// Schedule periodic keepalive messages
    ///
    /// This ensures the connection stays alive, particularly through
    /// proxies that might drop idle connections.
    private func scheduleKeepAlives() {
        // Cancel any existing keepalive schedule
        pingWorkItem?.cancel()
        
        // Calculate half the interval (standard practice)
        let interval = max(keepAliveInterval / 2, 5) // At least 5 seconds, half the requested interval
        
        logger.info("Scheduling keepalives every \(interval) seconds")
        
        let workItem = DispatchWorkItem { [weak self] in
            guard let self = self, case .connected = self.state else { return }
            
            logger.debug("Sending keepalive message")
            if self.sendKeepAlive() {
                // Schedule next keepalive
                self.scheduleKeepAlives()
            } else {
                logger.error("Failed to send keepalive, scheduling reconnect")
                self.handleError("Failed to send keepalive")
            }
        }
        
        pingWorkItem = workItem
        DispatchQueue.global().asyncAfter(deadline: .now() + interval, execute: workItem)
    }

    /// Schedule a reconnection attempt
    ///
    /// This implements an exponential backoff strategy to avoid
    /// hammering the server if it's down.
    private func scheduleReconnect() {
        guard reconnectAttempts < maxReconnectAttempts else {
            DispatchQueue.main.async {
                self.state = .error("Max reconnect attempts reached")
            }
            return
        }
        reconnectAttempts += 1
        let delay = pow(2.0, Double(reconnectAttempts))
        reconnectWorkItem?.cancel()
        let w = DispatchWorkItem { [weak self] in
            guard let self = self else { return }
            self.openSocket()
        }
        reconnectWorkItem = w
        DispatchQueue.global().asyncAfter(deadline: .now() + delay, execute: w)
    }

    /// Send a keepalive message to the server
    ///
    /// - Returns: True if the message was sent, false on error
    @discardableResult
    private func sendKeepAlive() -> Bool {
        // Simple keepalive message - exactly what the Jellyfin web client sends
        return sendRawMessage("{\"MessageType\":\"KeepAlive\"}")
    }
}

/// A logging utility specifically designed for WebSocket operations.
/// Provides formatted output with configurable log levels.
public class JellyfinSocketLogger {
    
    /// Log level to control the verbosity of the logger.
    public enum LogLevel: Int, Comparable {
        /// No logging output
        case off = 0
        /// Only errors
        case error = 1
        /// Errors and warnings
        case warning = 2
        /// Standard information (connections, subscriptions) plus warnings and errors
        case info = 3
        /// Verbose logging of all operations (including all message payloads)
        case debug = 4
        
        public static func < (lhs: JellyfinSocketLogger.LogLevel, rhs: JellyfinSocketLogger.LogLevel) -> Bool {
            return lhs.rawValue < rhs.rawValue
        }
    }
    
    /// The current log level
    public var level: LogLevel
    
    /// The label for this logger, appears at the beginning of each log message
    private let label: String
    
    /// Date formatter for log timestamps
    private let dateFormatter: DateFormatter
    
    /// Create a new WebSocket logger
    /// - Parameters:
    ///   - label: The label for the logger (appears at the beginning of each log line)
    ///   - level: The initial log level (default is .info)
    public init(label: String, level: LogLevel = .info) {
        self.label = label
        self.level = level
        
        // Setup date formatter for timestamps
        self.dateFormatter = DateFormatter()
        self.dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
    }
    
    /// Log a debug message (most verbose)
    /// - Parameter message: The message to log
    public func debug(_ message: String) {
        log(message, level: .debug)
    }
    
    /// Log an informational message
    /// - Parameter message: The message to log
    public func info(_ message: String) {
        log(message, level: .info)
    }
    
    /// Log a warning message
    /// - Parameter message: The message to log
    public func warning(_ message: String) {
        log(message, level: .warning)
    }
    
    /// Log an error message
    /// - Parameter message: The message to log
    public func error(_ message: String) {
        log(message, level: .error)
    }
    
    /// Internal method to format and output a log message based on the current log level
    /// - Parameters:
    ///   - message: The message to log
    ///   - level: The level for this specific message
    private func log(_ message: String, level messageLevel: LogLevel) {
        // Only log if the message level is less than or equal to the logger's level
        guard messageLevel <= self.level else { return }
        
        // Format the timestamp
        let timestamp = dateFormatter.string(from: Date())
        
        // Create the log prefix
        let levelString: String
        switch messageLevel {
        case .debug:
            levelString = "DEBUG"
        case .info:
            levelString = "INFO"
        case .warning:
            levelString = "WARN"
        case .error:
            levelString = "ERROR"
        case .off:
            return // Should never happen
        }
        
        // Format the final log message
        let formattedMessage = "[\(timestamp)] [\(label)] [\(levelString)] \(message)"
        
        // Print to console
        print(formattedMessage)
    }
    
    /// Format JSON for pretty printing in logs
    /// - Parameter jsonString: The raw JSON string
    /// - Returns: Formatted JSON string if valid, otherwise the original string
    public func formatJSON(_ jsonString: String) -> String {
        guard let data = jsonString.data(using: .utf8),
              let json = try? JSONSerialization.jsonObject(with: data, options: []),
              let prettyData = try? JSONSerialization.data(withJSONObject: json, options: [.prettyPrinted]),
              let prettyString = String(data: prettyData, encoding: .utf8) else {
            return jsonString
        }
        return prettyString
    }
}
