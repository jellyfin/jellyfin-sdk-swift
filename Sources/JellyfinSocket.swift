//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Combine
import Foundation

// MARK: - JellyfinSocketLogger
/// Logger class for JellyfinSocket that provides different logging levels and formatting
public class JellyfinSocketLogger {
    /// Defines the available logging levels for the socket logger
    public enum LogLevel: Int, Comparable {
        case off, error, warning, info, debug
        public static func < (lhs: LogLevel, rhs: LogLevel) -> Bool { lhs.rawValue < rhs.rawValue }
    }

    /// Current logging level that determines which messages will be displayed
    public var level: LogLevel
    /// Identifier label for the logger to distinguish log sources
    private let label: String
    /// Formatter used to generate timestamps for log messages
    private let dateFormatter = DateFormatter()

    /// Creates a new JellyfinSocketLogger instance
    /// - Parameters:
    ///   - label: Identifier for the log source
    ///   - level: Initial logging level (defaults to .info)
    public init(label: String, level: LogLevel = .info) {
        self.label = label
        self.level = level
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
    }

    /// Internal method to process and print log messages based on level
    /// - Parameters:
    ///   - message: The message to log (lazily evaluated)
    ///   - type: The type of log message (debug, info, etc.)
    ///   - level: The level at which the message should be logged
    private func log(_ message: @autoclosure () -> String, type: String, at level: LogLevel) {
        guard level.rawValue <= self.level.rawValue else { return }
        let timestamp = dateFormatter.string(from: Date())
        print("[\(timestamp)] [\(label)] [\(type.uppercased())] \(message())")
    }

    /// Logs a debug message if debug level is enabled
    /// - Parameter message: The debug message to log
    public func debug(_ message: @autoclosure () -> String) { log(message(), type: "debug", at: .debug) }
    
    /// Logs an info message if info level or higher is enabled
    /// - Parameter message: The info message to log
    public func info(_ message: @autoclosure () -> String) { log(message(), type: "info", at: .info) }
    
    /// Logs a warning message if warning level or higher is enabled
    /// - Parameter message: The warning message to log
    public func warning(_ message: @autoclosure () -> String) { log(message(), type: "warning", at: .warning) }
    
    /// Logs an error message if error level or higher is enabled
    /// - Parameter message: The error message to log
    public func error(_ message: @autoclosure () -> String) { log(message(), type: "error", at: .error) }
}

// MARK: - JellyfinSocket Implementation
/// WebSocket client implementation for Jellyfin server communication
public final class JellyfinSocket: ObservableObject {

    /// Represents the possible states of the WebSocket connection
    public enum State {
        case idle
        case connecting
        case connected(url: URL)
        case disconnecting
        case closed(error: Error?)
        case error(Error)

        /// Indicates whether the socket is currently in connected state
        var isConnected: Bool {
            if case .connected = self { return true }
            return false
        }
    }

    /// Types of subscriptions supported by the Jellyfin WebSocket
    public enum SubscriptionType: Hashable {
        case sessions(initialDelayMs: Int = 0, intervalMs: Int = 10000)
        case scheduledTasks(initialDelayMs: Int = 0, intervalMs: Int = 60000)
        case activityLog(initialDelayMs: Int = 0, intervalMs: Int = 5000)

        /// Formats the subscription parameters as a string for the server
        var dataString: String? {
            let parameters: (Int, Int)
            switch self {
            case .sessions(let delay, let interval):
                parameters = (delay, interval)
            case .scheduledTasks(let delay, let interval):
                parameters = (delay, interval)
            case .activityLog(let delay, let interval):
                parameters = (delay, interval)
            }
            return "\(parameters.0),\(parameters.1)"
        }
    }
    
    /// Error types specific to the JellyfinSocket
    public enum SocketError: Error, LocalizedError, Equatable {
        case notConnected
        case missingAccessTokenOrConfig
        case invalidURL
        case encodingFailed(String)
        case maxReconnectAttemptsReached
        case explicitDisconnect
        case connectionTimeout
        case serverMessageError(String)
        case underlyingError(String)
        case decodingError(String)

        /// Human-readable error descriptions
        public var errorDescription: String? {
            switch self {
            case .notConnected: return "WebSocket is not connected."
            case .missingAccessTokenOrConfig: return "Missing access token, device ID, or server URL for WebSocket connection."
            case .invalidURL: return "Invalid WebSocket URL."
            case .encodingFailed(let reason): return "Failed to encode message: \(reason)"
            case .maxReconnectAttemptsReached: return "Maximum reconnection attempts reached."
            case .explicitDisconnect: return "Disconnected by client."
            case .connectionTimeout: return "Connection attempt timed out or server unresponsive."
            case .serverMessageError(let message): return "Server returned an error message: \(message)"
            case .underlyingError(let message): return "An underlying error occurred: \(message)"
            case .decodingError(let message): return "Failed to decode server message: \(message)"
            }
        }
        
        /// Equality comparison for SocketError types
        public static func == (lhs: SocketError, rhs: SocketError) -> Bool {
            lhs.localizedDescription == rhs.localizedDescription
        }
    }

    /// Current state of the socket connection
    @Published
    public private(set) var state: State = .idle

    /// Timestamp of the most recent activity from the server
    @Published
    public private(set) var lastServerActivity: Date?

    /// Publisher for raw string messages received from the WebSocket
    public let rawMessagePublisher = PassthroughSubject<String, Never>()
    /// Publisher for parsed server messages
    public let serverMessagePublisher = PassthroughSubject<OutboundWebSocketMessage, Never>()

    /// Reference to the Jellyfin client for authentication and configuration
    private let client: JellyfinClient
    /// User ID for authentication, if applicable
    private let userID: String?
    /// Reported media control support to Server
    private let isSupportsMediaControl: Bool
    /// Reported supported commands to Server
    private let supportedCommands: [GeneralCommandType]
    /// Logger instance for this socket
    private let logger: JellyfinSocketLogger

    /// URLSession for WebSocket communication
    private var urlSession: URLSession!
    /// Current WebSocket task
    private var webSocketTask: URLSessionWebSocketTask?

    /// Counter for reconnection attempts
    private var currentReconnectAttempts: Int = 0
    /// Maximum number of reconnection attempts before giving up
    private let maxReconnectAttempts: Int = 5
    /// Base delay for exponential backoff during reconnection
    private var reconnectDelayBase: TimeInterval = 2.0

    /// Interval between keep-alive pings (in seconds)
    private var keepAlivePingInterval: TimeInterval = 30.0
    /// Timeout duration for server responses (in seconds)
    private let serverResponseTimeout: TimeInterval = 90.0
    
    /// Timer for sending keep-alive pings
    private var keepAlivePingTimer: Timer?
    /// Timer for initial connection timeout
    private var initialConnectionTimeoutTimer: Timer?
    /// Timer for detecting server response timeouts
    private var serverResponseTimeoutTimer: Timer?

    /// Queue for messages waiting to be sent after reconnection
    private var messageQueue: [Data] = []
    /// Set of active server subscriptions to maintain across disconnections
    private var activeServerSubscriptions = Set<SubscriptionType>()
    
    /// Flag indicating user explicitly disconnected the socket
    private var userExplicitlyDisconnected: Bool = false

    /// JSON encoder for outbound messages
    private lazy var jsonEncoder: JSONEncoder = {
        let encoder = JSONEncoder()
        return encoder
    }()
    
    /// JSON decoder for inbound messages
    private lazy var jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(OpenISO8601DateFormatter())
        return decoder
    }()
    
    /// Storage for Combine cancellables
    private var cancellables = Set<AnyCancellable>()

    /// Creates a new JellyfinSocket instance
    /// - Parameters:
    ///   - client: The JellyfinClient to use for authentication and configuration
    ///   - userID: Optional user ID for authentication
    ///   - isSupportsMediaControl: Inform Jellyfin that you are accepting Media Controls (defaults to false)
    ///   - supportedCommands: Inform Jellyfin of all of the commands supported  by this device  (defaults to server messages only)
    ///   - logLevel: The logging level to use (defaults to .info)
    public init(
        client: JellyfinClient,
        userID: String? = nil,
        isSupportsMediaControl: Bool = false,
        supportedCommands: [GeneralCommandType] = [.displayMessage],
        logLevel: JellyfinSocketLogger.LogLevel = .info
    ) {
        self.client = client
        self.userID = userID
        self.isSupportsMediaControl = isSupportsMediaControl
        self.supportedCommands = supportedCommands
        self.logger = JellyfinSocketLogger(label: "JellyfinSocket", level: logLevel)
        let queue = OperationQueue()
        queue.name = "com.jellyfin.sdk.websocket.queue"
        queue.maxConcurrentOperationCount = 1
        self.urlSession = URLSession(configuration: .default, delegate: nil, delegateQueue: queue)
        
        $state.sink { [weak self] newState in
            DispatchQueue.main.async {
                self?.logger.info("State changed to: \(String(describing: newState))")
            }
        }.store(in: &cancellables)
    }

    /// Cleans up resources when the object is deallocated
    deinit {
        logger.info("JellyfinSocket deinit - shutting down.")
        // Use a method that ensures no further reconnect attempts
        shutdownSocket(reason: "Deinitialization")
    }

    /// Initiates a connection to the Jellyfin WebSocket
    public func connect() {
        DispatchQueue.main.async {
            self.userExplicitlyDisconnected = false // Reset flag on explicit connect
            guard !self.state.isConnected, self.webSocketTask == nil else {
                self.logger.warning("Already connected or connecting. Current state: \(String(describing: self.state))")
                return
            }
            self.logger.info("Attempting to connect...")
            self.state = .connecting
            self.currentReconnectAttempts = 0
            self.initialConnectionTimeoutTimer?.invalidate()
            self.initialConnectionTimeoutTimer = Timer.scheduledTimer(withTimeInterval: 10.0, repeats: false) { [weak self] _ in
                guard let self = self else { return }
                DispatchQueue.main.async {
                    guard self.state == .connecting else { return } // Check state again inside async block
                    self.logger.error("Connection attempt timed out.")
                    self.handleDisconnection(error: SocketError.connectionTimeout, wasGraceful: false)
                }
            }
            Task.detached { await self.establishConnection() }
        }
    }

    /// Explicitly disconnects from the WebSocket
    public func disconnect() {
        logger.info("User explicitly called disconnect.")
        self.userExplicitlyDisconnected = true
        performDisconnect(error: SocketError.explicitDisconnect, initiatedByClient: true)
    }

    /// Internal method to shut down the socket (used by deinit)
    /// - Parameter reason: The reason for the shutdown
    private func shutdownSocket(reason: String) {
        self.userExplicitlyDisconnected = true // Ensure no reconnections
        performDisconnect(error: SocketError.underlyingError("Socket shutdown: \(reason)"), initiatedByClient: false)
    }
    
    /// Performs the actual disconnection logic
    /// - Parameters:
    ///   - error: The error that caused the disconnection, if any
    ///   - initiatedByClient: Whether the disconnection was initiated by the client
    private func performDisconnect(error: Error?, initiatedByClient: Bool) {
        let effectiveError = error ?? (initiatedByClient ? SocketError.explicitDisconnect : nil)
        logger.info("Performing disconnect... Error: \(effectiveError?.localizedDescription ?? "None"), Initiated by client: \(initiatedByClient)")
        
        DispatchQueue.main.async {
            // Only transition to disconnecting if not already disconnecting or closed by user.
            if self.state != .disconnecting && self.state != .closed(error: SocketError.explicitDisconnect) {
                 self.state = .disconnecting
            }
        }

        webSocketTask?.cancel(with: .goingAway, reason: "Client initiated disconnect".data(using: .utf8))
        webSocketTask = nil
        
        invalidateTimers() // Invalidate timers before clearing message queue
        messageQueue.removeAll() // Clear message queue after timers are stopped
        
        DispatchQueue.main.async {
            // Ensure final state reflects the disconnect reason
            self.state = .closed(error: effectiveError)
        }
    }
    
    /// Sends a typed WebSocket message to the server
    /// - Parameter message: The message to send
    /// - Returns: Whether the message was sent or queued successfully
    @discardableResult
    public func send(_ message: InboundWebSocketMessage) -> Bool {
        guard !userExplicitlyDisconnected else {
            logger.warning("Attempted to send message while socket is explicitly disconnected. Message not sent: \(message.sessionMessageType?.rawValue ?? "UnknownInboundType")")
            return false
        }
        do {
            let data = try jsonEncoder.encode(message)
            let messageTypeForLog = message.sessionMessageType?.rawValue ?? "UnknownInboundType"
            logger.debug("Preparing to send \(messageTypeForLog)")
            return sendRawData(data, description: messageTypeForLog)
        } catch {
            logger.error("Failed to encode \(message.sessionMessageType?.rawValue ?? String(describing: type(of: message))): \(error)")
            return false
        }
    }

    /// Sends raw data over the WebSocket
    /// - Parameters:
    ///   - data: The data to send
    ///   - description: Description of the data for logging
    /// - Returns: Whether the data was sent or queued successfully
    @discardableResult
    private func sendRawData(_ data: Data, description: String = "raw data") -> Bool {
        guard webSocketTask != nil, state.isConnected else {
            if !userExplicitlyDisconnected { // Only queue if not explicitly stopped
                logger.info("Socket not connected. Queuing message: \(description) (\(data.count) bytes)")
                messageQueue.append(data)
            } else {
                logger.warning("Socket explicitly disconnected. Message not queued: \(description)")
                return false
            }
            return true
        }
        guard let task = webSocketTask else {
             logger.warning("Send attempt with nil webSocketTask while supposedly connected. Queuing.")
             if !userExplicitlyDisconnected { messageQueue.append(data) }
             return true
        }
        logger.debug("Sending \(description): \(String(data: data, encoding: .utf8)?.prefix(200) ?? "\(data.count) bytes")")
        task.send(.data(data)) { [weak self] error in
            DispatchQueue.main.async { // Perform error handling on main queue
                if let error = error {
                    self?.logger.error("Send error for \(description): \(error)")
                    self?.handleDisconnection(error: error, wasGraceful: false)
                }
            }
        }
        return true
    }
    
    /// Activates a server subscription to receive updates
    /// - Parameter subscriptionType: The type of subscription to activate
    public func activateSubscription(_ subscriptionType: SubscriptionType) {
        logger.info("Activating server subscription: \(subscriptionType)")
        activeServerSubscriptions.insert(subscriptionType)
        
        let messageToSend: InboundWebSocketMessage
        let dataValue: String? = subscriptionType.dataString
        
        switch subscriptionType {
        case .sessions:
            var messageStruct = SessionsStartMessage()
            messageStruct.data = dataValue
            messageToSend = .sessionsStartMessage(messageStruct)
        case .scheduledTasks:
            var messageStruct = ScheduledTasksInfoStartMessage()
            messageStruct.data = dataValue
            messageToSend = .scheduledTasksInfoStartMessage(messageStruct)
        case .activityLog:
            var messageStruct = ActivityLogEntryStartMessage()
            messageStruct.data = dataValue
            messageToSend = .activityLogEntryStartMessage(messageStruct)
        }
        send(messageToSend)
    }

    /// Deactivates a server subscription to stop receiving updates
    /// - Parameter subscriptionType: The type of subscription to deactivate
    public func deactivateSubscription(_ subscriptionType: SubscriptionType) {
        logger.info("Deactivating server subscription: \(subscriptionType)")
        activeServerSubscriptions.remove(subscriptionType)
        let messageToSend: InboundWebSocketMessage
        switch subscriptionType {
        case .sessions: messageToSend = .sessionsStopMessage(SessionsStopMessage())
        case .scheduledTasks: messageToSend = .scheduledTasksInfoStopMessage(ScheduledTasksInfoStopMessage())
        case .activityLog: messageToSend = .activityLogEntryStopMessage(ActivityLogEntryStopMessage())
        }
        send(messageToSend)
    }

    /// Establishes a WebSocket connection with the Jellyfin server
    private func establishConnection() async {
        // This method is called on a background task.
        // Ensure any state changes or calls to main actor methods are dispatched.
        guard !userExplicitlyDisconnected else {
            logger.info("Establish connection called, but user has explicitly disconnected. Aborting.")
            DispatchQueue.main.async {
                if self.state != .closed(error: SocketError.explicitDisconnect) { // Check current state before overwriting
                    self.state = .closed(error: SocketError.explicitDisconnect)
                }
            }
            return
        }

        guard let token = client.accessToken else {
            logger.error("Missing access token, device ID, or server URL.")
            // Call handleDisconnection on the main queue as it modifies @Published state
            DispatchQueue.main.async {
                self.handleDisconnection(error: SocketError.missingAccessTokenOrConfig, wasGraceful: true)
            }
            return
        }
        guard var urlComponents = URLComponents(url: client.configuration.url, resolvingAgainstBaseURL: false) else {
            logger.error("Invalid base URL for WebSocket.")
            DispatchQueue.main.async {
                self.handleDisconnection(error: SocketError.invalidURL, wasGraceful: true)
            }
            return
        }
        urlComponents.scheme = (urlComponents.scheme == "https" ? "wss" : "ws")
        urlComponents.path = "/socket"
        var queryItems = [
            URLQueryItem(name: "api_key", value: token),
            URLQueryItem(name: "deviceId", value: client.configuration.deviceID)
        ]
        if let userID = self.userID { queryItems.append(URLQueryItem(name: "user_id", value: userID)) }
        urlComponents.queryItems = queryItems

        guard let url = urlComponents.url else {
            logger.error("Failed to construct WebSocket URL.")
            DispatchQueue.main.async {
                self.handleDisconnection(error: SocketError.invalidURL, wasGraceful: true)
            }
            return
        }
        
        logger.info("Connecting to WebSocket URL: \(url.absoluteString.replacingOccurrences(of: token, with: "***REDACTED_TOKEN***"))")
        let request = URLRequest(url: url)
        
        // Access urlSession and assign webSocketTask on its delegate queue (which is our custom background queue)
        self.urlSession.delegateQueue.addOperation {
            guard !self.userExplicitlyDisconnected else {
                self.logger.info("Connection attempt aborted as user explicitly disconnected during URLSession operation scheduling.")
                // Ensure state is correctly set if needed, already handled by `establishConnection` start check.
                return
            }
            self.webSocketTask = self.urlSession.webSocketTask(with: request)
            self.webSocketTask?.resume()
            self.startListening() // This will then dispatch to main for message handling
        }
    }

    /// Begins listening for messages from the WebSocket
    private func startListening() {
        // This is called from urlSession's delegate queue.
        guard let task = webSocketTask else {
            logger.warning("Attempted to start listening without a WebSocket task.")
            DispatchQueue.main.async { // Ensure state check/update is on main
                if self.state.isConnected || self.state == .connecting { // only if we thought we should be listening
                    self.handleDisconnection(error: SocketError.underlyingError("WebSocketTask became nil unexpectedly before listening."), wasGraceful: false)
                }
            }
            return
        }
        
        guard !userExplicitlyDisconnected else {
            logger.info("Listening attempt aborted as user explicitly disconnected.")
            // If task exists, ensure it's cancelled. performDisconnect should handle this.
            DispatchQueue.main.async { self.performDisconnect(error: SocketError.explicitDisconnect, initiatedByClient: true) }
            return
        }

        task.receive { [weak self] result in
            guard let self = self else { return }
            // Check for explicit disconnect before dispatching to main queue
            guard !self.userExplicitlyDisconnected else {
                self.logger.info("Received message/error but user explicitly disconnected. Ignoring.")
                // Consider if task needs explicit cancellation here if not already handled
                return
            }

            DispatchQueue.main.async { // Switch to main thread for state updates and Combine publishers
                guard !self.userExplicitlyDisconnected else { // Double check on main thread
                    self.logger.info("Processing received message/error but user explicitly disconnected (main thread check). Ignoring.")
                    return
                }
                switch result {
                case .success(let wsMessage):
                    self.initialConnectionTimeoutTimer?.invalidate()
                    self.handleReceivedWebSocketMessage(wsMessage)
                    // Only continue listening if the task is still valid and we're not disconnected
                    if self.webSocketTask != nil && !self.userExplicitlyDisconnected {
                         self.urlSession.delegateQueue.addOperation { // Schedule next receive on the session's queue
                            self.startListening()
                         }
                    }
                case .failure(let error):
                    if case .closed(let err) = self.state, (err as? SocketError) == .explicitDisconnect {
                        self.logger.info("Receive loop ended due to explicit disconnect (already processed).")
                        return
                    }
                    let nsError = error as NSError
                    if nsError.domain == NSURLErrorDomain && nsError.code == NSURLErrorCancelled {
                        self.logger.info("WebSocket task cancelled.")
                        // If not explicitly disconnected by user, treat as an error or graceful close
                        if !self.userExplicitlyDisconnected && self.state != .closed(error: nil) && self.state != .disconnecting {
                             self.handleDisconnection(error: error, wasGraceful: true) // Or false depending on context
                        }
                        return
                    }
                    self.logger.error("Receive error: \(error.localizedDescription)")
                    self.handleDisconnection(error: error, wasGraceful: false)
                }
            }
        }
    }
    
    /// Handles messages received from the WebSocket
    /// - Parameter wsMessage: The received WebSocket message
    private func handleReceivedWebSocketMessage(_ wsMessage: URLSessionWebSocketTask.Message) {
        // This method is guaranteed to be called on the main thread due to DispatchQueue.main.async in startListening.
        let wasPreviouslyConnected = state.isConnected
        if !wasPreviouslyConnected, case .connecting = state {
            logger.info("WebSocket connection established.")
            if let url = webSocketTask?.currentRequest?.url { state = .connected(url: url) }
            else { state = .connected(url: URL(string: "ws://unknown")!) }
            currentReconnectAttempts = 0 // Reset on successful connection
            
            Task.detached {
                await self.postDeviceCapabilities()
            }
            
            // These can be called directly as they manage their own potential dispatches or are safe
            resubscribeToServerFeeds()
            processMessageQueue()
            startKeepAliveTimers()
        }
        
        lastServerActivity = Date()
        serverResponseTimeoutTimer?.invalidate() // Reset timer because we got activity
        scheduleServerResponseTimeout()     // Reschedule it

        let messageData: Data
        let messageStringPreview: String

        switch wsMessage {
        case .string(let text):
            logger.debug("Received String: \(text.prefix(500))")
            rawMessagePublisher.send(text)
            guard let data = text.data(using: .utf8) else {
                logger.error("Failed to convert received text to Data.")
                return
            }
            messageData = data
            messageStringPreview = text.prefix(200).description
        case .data(let data):
            logger.debug("Received Data: \(data.count) bytes")
            if let textPreview = String(data: data, encoding: .utf8)?.prefix(500) {
                 rawMessagePublisher.send(String(textPreview))
                 messageStringPreview = String(textPreview).prefix(200).description
            } else {
                 rawMessagePublisher.send("\(data.count) non-UTF8 bytes")
                 messageStringPreview = "\(data.count) non-UTF8 bytes"
            }
            messageData = data
        @unknown default:
            logger.warning("Received unknown message type from URLSessionWebSocketTask.")
            return
        }

        do {
            let decodedServerMessage = try jsonDecoder.decode(OutboundWebSocketMessage.self, from: messageData)
            logger.info("Successfully decoded server message of type: \(decodedServerMessage.sessionMessageType?.rawValue ?? "UnknownOutbound")")
            serverMessagePublisher.send(decodedServerMessage)

            switch decodedServerMessage {
            case .forceKeepAliveMessage(let fkaMsg):
                if let interval = fkaMsg.data {
                    self.keepAlivePingInterval = Double(interval) / 2
                    logger.info("Server forced KeepAlive ping interval to: \(self.keepAlivePingInterval)s")
                    stopKeepAliveTimers()
                    startKeepAliveTimers()
                    sendClientPing()
                } else {
                    logger.warning("ForceKeepAliveMessage received without data for interval.")
                }
            case .outboundKeepAliveMessage:
                logger.debug("Received server KeepAlive (Pong). Last server activity updated.")
            default:
                break // Other messages are just published
            }

        } catch {
            let decodingError = error as? DecodingError
            let errorContext = decodingError != nil ? "\(decodingError!)" : error.localizedDescription
            logger.error("Failed to decode server message: \(errorContext). Raw: \(messageStringPreview)")
        }
    }
    
    /// Handles disconnection events and manages reconnection attempts
    /// - Parameters:
    ///   - error: The error that caused the disconnection, if any
    ///   - wasGraceful: Whether the disconnection was graceful
    private func handleDisconnection(error: Error?, wasGraceful: Bool) {
        // This method must be called on the main thread as it modifies @Published state
        // and interacts with timers that expect main thread invalidation.
        guard Thread.isMainThread else {
            DispatchQueue.main.async { self.handleDisconnection(error: error, wasGraceful: wasGraceful) }
            return
        }

        invalidateTimers() // Stop all timers first
        
        // Only fully close the task if it wasn't already nilled by performDisconnect
        if webSocketTask != nil {
            webSocketTask?.cancel(with: .normalClosure, reason: nil) // Use a neutral reason if not specified
            webSocketTask = nil
        }

        let actualError = error ?? SocketError.underlyingError("Unknown disconnection reason")
        
        let nsError = error as NSError?
        let isCancelledError = nsError?.domain == NSURLErrorDomain && nsError?.code == NSURLErrorCancelled

        if userExplicitlyDisconnected {
            logger.info("Handling disconnection, but user explicitly disconnected. Final state: Closed.")
            if state != .closed(error: SocketError.explicitDisconnect) { // Avoid redundant logging from state sink
                state = .closed(error: SocketError.explicitDisconnect)
            }
            return
        }
        
        if wasGraceful || isCancelledError {
            logger.info("WebSocket connection closed gracefully or was cancelled. Error: \(actualError.localizedDescription)")
            if state != .closed(error: nil) { state = .closed(error: nil) } // No error for graceful/cancelled if not explicit
            return
        }

        logger.warning("WebSocket disconnected unexpectedly. Error: \(actualError.localizedDescription)")
        if state != .closed(error: actualError) { state = .closed(error: actualError) }
        
        if currentReconnectAttempts < maxReconnectAttempts {
            currentReconnectAttempts += 1
            let delay = pow(reconnectDelayBase, Double(currentReconnectAttempts))
            logger.info("Attempting to reconnect in \(delay) seconds... (Attempt \(currentReconnectAttempts)/\(maxReconnectAttempts))")
            
            if state != .connecting { state = .connecting } // Transition to connecting

            Task { // Schedules the delay and subsequent connection attempt
                try? await Task.sleep(nanoseconds: UInt64(delay * 1_000_000_000))
                // Re-check userExplicitlyDisconnected before attempting to establish
                guard !self.userExplicitlyDisconnected else {
                    self.logger.info("Reconnect attempt aborted post-delay as user explicitly disconnected.")
                    DispatchQueue.main.async { // Ensure state is correctly set on main
                         if self.state != .closed(error: SocketError.explicitDisconnect) {
                            self.state = .closed(error: SocketError.explicitDisconnect)
                         }
                    }
                    return
                }
                // Check current state on main thread before proceeding
                DispatchQueue.main.async {
                    guard self.state == .connecting || (self.state.isClosedError(actualError) && self.webSocketTask == nil) else {
                        self.logger.info("Reconnect cancelled due to state change or manual disconnect (main thread check).")
                        return
                    }
                    // Offload the actual connection attempt to a background task
                    Task.detached { await self.establishConnection() }
                }
            }
        } else {
            logger.error("Max reconnect attempts reached. Giving up.")
            if state != .error(SocketError.maxReconnectAttemptsReached) {
                state = .error(SocketError.maxReconnectAttemptsReached)
            }
        }
    }

    /// Invalidates all active timers
    private func invalidateTimers() {
        // Ensure timers are invalidated on the main thread as they were scheduled there.
        guard Thread.isMainThread else {
            DispatchQueue.main.async { self.invalidateTimers() }
            return
        }
        keepAlivePingTimer?.invalidate(); keepAlivePingTimer = nil
        initialConnectionTimeoutTimer?.invalidate(); initialConnectionTimeoutTimer = nil
        serverResponseTimeoutTimer?.invalidate(); serverResponseTimeoutTimer = nil
    }
    
    /// Processes any queued messages that were waiting for connection
    private func processMessageQueue() {
        // Assumed to be called on main thread or where state access is safe
        guard !messageQueue.isEmpty else { return }
        logger.info("Processing \(messageQueue.count) queued messages...")
        let queued = messageQueue; messageQueue.removeAll()
        for dataItem in queued { sendRawData(dataItem, description: "queued message") }
    }

    /// Resubscribes to any active server feeds after reconnection
    private func resubscribeToServerFeeds() {
        // Assumed to be called on main thread
        guard !activeServerSubscriptions.isEmpty else { return }
        logger.info("Resubscribing to \(activeServerSubscriptions.count) server feeds...")
        let subscriptionsToReactivate = activeServerSubscriptions
        for subscriptionType in subscriptionsToReactivate { activateSubscription(subscriptionType) } // This calls send()
    }
    
    /// Starts the timers for keep-alive pings and server response timeout
    private func startKeepAliveTimers() {
        // Ensure this is called on the main thread as it schedules timers.
        guard Thread.isMainThread else {
            DispatchQueue.main.async { self.startKeepAliveTimers() }
            return
        }
        stopKeepAliveTimers() // Stops current timers (also ensures it's on main)
        logger.info("Starting KeepAlive timers. Ping interval: \(keepAlivePingInterval)s, Server response timeout: \(serverResponseTimeout)s")
        sendClientPing() // This calls send() which handles its own threading for actual send.
        scheduleServerResponseTimeout() // Schedules a new timer on main

        keepAlivePingTimer = Timer.scheduledTimer(withTimeInterval: keepAlivePingInterval, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            // The timer block itself executes on the main thread.
            guard self.state.isConnected else { self.stopKeepAliveTimers(); return } // stopKeepAliveTimers handles main thread
            guard !self.userExplicitlyDisconnected else { self.stopKeepAliveTimers(); return } // Stop if user disconnected
            self.sendClientPing()
            self.scheduleServerResponseTimeout()
        }
    }

    /// Stops the keep-alive and server response timeout timers
    private func stopKeepAliveTimers() {
        // Ensure this is called on the main thread.
        guard Thread.isMainThread else {
            DispatchQueue.main.async { self.stopKeepAliveTimers() }
            return
        }
        logger.info("Stopping KeepAlive timers.")
        keepAlivePingTimer?.invalidate(); keepAlivePingTimer = nil
        serverResponseTimeoutTimer?.invalidate(); serverResponseTimeoutTimer = nil // Also a main-thread scheduled timer
    }

    /// Sends a keep-alive ping to the server
    private func sendClientPing() {
        // This can be called from any thread as `send()` handles its logic.
        logger.debug("Sending Client KeepAlive Ping.")
        let pingMessage = InboundKeepAliveMessage(messageType: .keepAlive)
        send(.inboundKeepAliveMessage(pingMessage))
    }
    
    /// Schedules a timeout timer to detect server unresponsiveness
    private func scheduleServerResponseTimeout() {
        // Ensure this is called on the main thread.
        guard Thread.isMainThread else {
            DispatchQueue.main.async { self.scheduleServerResponseTimeout() }
            return
        }
        serverResponseTimeoutTimer?.invalidate()
        serverResponseTimeoutTimer = Timer.scheduledTimer(withTimeInterval: serverResponseTimeout, repeats: false) { [weak self] _ in
            guard let self = self else { return }
            // Timer block executes on main thread.
            guard self.state.isConnected else { return }
            guard !self.userExplicitlyDisconnected else { return }

            let now = Date()
            if let lastActivity = self.lastServerActivity, now.timeIntervalSince(lastActivity) >= self.serverResponseTimeout {
                self.logger.warning("No server activity for \(self.serverResponseTimeout)s. Assuming connection lost.")
                self.handleDisconnection(error: SocketError.connectionTimeout, wasGraceful: false) // handleDisconnection expects main
            } else if self.lastServerActivity == nil { // Should not happen if connected, but defensive.
                self.logger.warning("No server activity recorded (lastServerActivity is nil), but timeout triggered. Assuming connection lost.")
            } else {
                self.scheduleServerResponseTimeout()
            }
        }
    }
    
    /// Posts device capabilities to the server after connection
    private func postDeviceCapabilities() async {
        do {
            var parameters = Paths.PostCapabilitiesParameters()
            
            parameters.isSupportsMediaControl = isSupportsMediaControl
            parameters.supportedCommands = supportedCommands
            
            let request = Paths.postCapabilities(parameters: parameters)
            try await client.send(request)
            logger.info("Device capabilities successfully posted")
        } catch {
            logger.error("Failed to post device capabilities: \(error.localizedDescription)")
        }
    }
}

extension JellyfinSocket.State: Equatable {
    /// Equality comparison for JellyfinSocket.State
    public static func == (lhs: JellyfinSocket.State, rhs: JellyfinSocket.State) -> Bool {
        switch (lhs, rhs) {
        case (.idle, .idle): return true
        case (.connecting, .connecting): return true
        case let (.connected(url1), .connected(url2)): return url1 == url2
        case (.disconnecting, .disconnecting): return true
        case let (.closed(err1), .closed(err2)):
            if err1 == nil && err2 == nil { return true }
            if let e1 = err1 as? JellyfinSocket.SocketError, let e2 = err2 as? JellyfinSocket.SocketError { return e1 == e2 }
            return err1?.localizedDescription == err2?.localizedDescription
        case let (.error(err1), .error(err2)):
            if let e1 = err1 as? JellyfinSocket.SocketError, let e2 = err2 as? JellyfinSocket.SocketError { return e1 == e2 }
            return err1.localizedDescription == err2.localizedDescription
        default: return false
        }
    }

    /// Checks if the state is a closed error with the specified error
    /// - Parameter error: The error to compare against
    /// - Returns: Whether the state is a closed error with the specified error
    func isClosedError(_ error: Error) -> Bool {
        if case .closed(let e) = self {
            if let socketErr = e as? JellyfinSocket.SocketError, let comparableErr = error as? JellyfinSocket.SocketError { return socketErr == comparableErr }
            return e?.localizedDescription == error.localizedDescription
        }
        return false
    }
}

extension InboundWebSocketMessage {
    /// Returns the message type for the inbound message
    var sessionMessageType: SessionMessageType? {
        switch self {
        case .activityLogEntryStartMessage(let message):
            return message.messageType
        case .activityLogEntryStopMessage(let message):
            return message.messageType
        case .inboundKeepAliveMessage(let message):
            return message.messageType
        case .scheduledTasksInfoStartMessage(let message):
            return message.messageType
        case .scheduledTasksInfoStopMessage(let message):
            return message.messageType
        case .sessionsStartMessage(let message):
            return message.messageType
        case .sessionsStopMessage(let message):
            return message.messageType
        }
    }
}

extension OutboundWebSocketMessage {
    /// Returns the message type for the outbound message
    var sessionMessageType: SessionMessageType? {
        switch self {
        case .activityLogEntryMessage(let message):
            return message.messageType
        case .forceKeepAliveMessage(let message):
            return message.messageType
        case .generalCommandMessage(let message):
            return message.messageType
        case .libraryChangedMessage(let message):
            return message.messageType
        case .outboundKeepAliveMessage(let message):
            return message.messageType
        case .playMessage(let message):
            return message.messageType
        case .playstateMessage(let message):
            return message.messageType
        case .pluginInstallationCancelledMessage(let message):
            return message.messageType
        case .pluginInstallationCompletedMessage(let message):
            return message.messageType
        case .pluginInstallationFailedMessage(let message):
            return message.messageType
        case .pluginInstallingMessage(let message):
            return message.messageType
        case .pluginUninstalledMessage(let message):
            return message.messageType
        case .refreshProgressMessage(let message):
            return message.messageType
        case .restartRequiredMessage(let message):
            return message.messageType
        case .scheduledTaskEndedMessage(let message):
            return message.messageType
        case .scheduledTasksInfoMessage(let message):
            return message.messageType
        case .seriesTimerCancelledMessage(let message):
            return message.messageType
        case .seriesTimerCreatedMessage(let message):
            return message.messageType
        case .serverRestartingMessage(let message):
            return message.messageType
        case .serverShuttingDownMessage(let message):
            return message.messageType
        case .sessionsMessage(let message):
            return message.messageType
        case .syncPlayCommandMessage(let message):
            return message.messageType
        case .syncPlayGroupUpdateCommandMessage(let message):
            return message.messageType
        case .timerCancelledMessage(let message):
            return message.messageType
        case .timerCreatedMessage(let message):
            return message.messageType
        case .userDataChangedMessage(let message):
            return message.messageType
        case .userDeletedMessage(let message):
            return message.messageType
        case .userUpdatedMessage(let message):
            return message.messageType
        }
    }
}
