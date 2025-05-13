//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Combine
import Foundation

/// WebSocket client implementation for Jellyfin server communication
public final class JellyfinSocket: ObservableObject, @unchecked Sendable {

    // MARK: - Published Messages from Server

    /// Publisher for parsed server messages
    @MainActor
    public let messages = PassthroughSubject<OutboundWebSocketMessage, Never>()

    // MARK: - Published Settings

    /// Current state of the socket connection
    @Published
    public private(set) var state: SocketState = .idle

    /// Timestamp of the most recent activity from the server
    @Published
    public private(set) var lastServerActivity: Date?

    /// Set of active server subscriptions to maintain across disconnections
    @Published
    public private(set) var subscriptions = Set<SocketSubscription>()

    // MARK: - Configured Variables

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

    // MARK: - WebSocket Components

    /// URLSession for WebSocket communication
    // Marked unsafe because these properties need to be accessed across actor boundaries
    nonisolated(unsafe) private var urlSession: URLSession!

    /// Current WebSocket task
    // Marked unsafe to allow cross-actor access while maintaining appropriate synchronization
    nonisolated(unsafe) private var webSocketTask: URLSessionWebSocketTask?
    
    /// Safe accessor for WebSocket task that avoids actor isolation issues
    // Provides thread-safe access to the webSocketTask from non-actor contexts
    nonisolated func getWebSocketTask() -> URLSessionWebSocketTask? {
        webSocketTask
    }
    
    /// Safe accessor for URLSession that avoids actor isolation issues
    // Ensures thread-safe access to the URLSession when called from background tasks
    nonisolated func getURLSession() -> URLSession {
        urlSession
    }

    // MARK: - Connection Variables

    /// Counter for reconnection attempts
    private var currentReconnectAttempts: Int = 0

    /// Maximum number of reconnection attempts before giving up
    private let maxReconnectAttempts: Int = 5

    /// Base delay for exponential backoff during reconnection
    private var reconnectDelayBase: TimeInterval = 2.0

    /// Interval between keep-alive pings (in seconds)
    private var keepAlivePingInterval: TimeInterval = 20.0

    /// Timeout duration for server responses (in seconds)
    private let serverResponseTimeout: TimeInterval = 90.0
    
    // MARK: - WebSocket Event Timers

    /// Timer for sending keep-alive pings
    private var keepAlivePingTimer: Timer?

    /// Timer for initial connection timeout
    private var initialConnectionTimeoutTimer: Timer?

    /// Timer for detecting server response timeouts
    private var serverResponseTimeoutTimer: Timer?

    // MARK: - WebSocket Messages Queue

    /// Queue for messages waiting to be sent after reconnection
    private var messageQueue: [Data] = []

    // MARK: - JSON En/Decoders

    /// JSON encoder for outbound messages
    private lazy var jsonEncoder: JSONEncoder = {
        return JSONEncoder()
    }()
    
    /// JSON decoder for inbound messages
    private lazy var jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(OpenISO8601DateFormatter())
        return decoder
    }()

    // MARK: - WebSocket Disconnect Tracker

    /// Flag indicating user explicitly disconnected the socket
    private var userExplicitlyDisconnected: Bool = false

    /// Storage for Combine cancellables
    private var cancellables = Set<AnyCancellable>()

    // MARK: - Initializer

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

        // Create a dedicated operation queue for WebSocket operations to avoid blocking the main thread
        let queue = OperationQueue()
        queue.name = "com.jellyfin.sdk.websocket.queue"
        queue.maxConcurrentOperationCount = 1

        self.urlSession = URLSession(
            configuration: .default,
            delegate: nil,
            delegateQueue: queue
        )
        
        // Log state changes for debugging and monitoring
        $state.sink { [weak self] newState in
            Task { @MainActor [weak self] in
                self?.logger.info("State: \(String(describing: newState))")
            }
        }
        .store(in: &cancellables)
    }

    // MARK: - Deinitializer

    /// Cleans up resources when the object is deallocated
    deinit {
        logger.warning("Shutting down")

        // Mark as explicitly disconnected to prevent reconnect attempts
        self.userExplicitlyDisconnected = true
        
        // Cancel the WebSocket task directly (safe to do in deinit)
        webSocketTask?.cancel(with: .goingAway, reason: "Deinitialization".data(using: .utf8))
        webSocketTask = nil
        
        // Clear any timers that might be holding references
        keepAlivePingTimer?.invalidate()
        initialConnectionTimeoutTimer?.invalidate()
        serverResponseTimeoutTimer?.invalidate()

        // Launch detached task that doesn't depend on self
        // This is safe to do in deinit because it captures only the client reference
        Task.detached { [client = self.client] in
            await updateDeviceCapabilities(client: client, enable: false)
        }
    }

    // MARK: - Connect to WebSocket

    /// Initiates a connection to the Jellyfin WebSocket
    public func connect() {
        self.userExplicitlyDisconnected = false

        guard !self.state.isConnected, self.webSocketTask == nil else {
            self.logger.warning("Already connected or connecting. Current state: \(String(describing: self.state))")
            return
        }

        self.logger.info("Attempting to connect...")

        self.state = .connecting
        self.currentReconnectAttempts = 0
        self.initialConnectionTimeoutTimer?.invalidate()

        // Store current state to avoid race conditions in the timer callback
        let isConnecting = self.state == .connecting
        
        // Set a timeout to detect stalled connection attempts
        self.initialConnectionTimeoutTimer = Timer.scheduledTimer(withTimeInterval: 10.0, repeats: false) { [weak self] _ in
            Task { @MainActor [weak self] in
                guard let self = self else {
                    return
                }
                
                // Ensure the state is still connecting before timing out
                guard isConnecting && self.state == .connecting else {
                    return
                }

                self.logger.error("Connection attempt timed out.")
                self.handleDisconnection(error: SocketError.connectionTimeout, wasGraceful: false)
            }
        }

        // Establish connection in a background task to avoid blocking the main thread
        Task.detached { [weak self] in
            guard let self = self else {
                return
            }
            await self.establishConnection()
        }
    }

    // MARK: - Disconnect from WebSocket

    /// Explicitly disconnects from the WebSocket
    public func disconnect() {
        logger.info("User explicitly called disconnect.")

        self.userExplicitlyDisconnected = true

        performDisconnect(error: SocketError.explicitDisconnect, initiatedByClient: true)
    }

    /// Performs the actual disconnection logic
    /// - Parameters:
    ///   - error: The error that caused the disconnection, if any
    ///   - initiatedByClient: Whether the disconnection was initiated by the client
    private func performDisconnect(error: Error?, initiatedByClient: Bool) {
        let effectiveError = error ?? (initiatedByClient ? SocketError.explicitDisconnect : nil)

        logger.info("Performing disconnect... Error: \(effectiveError?.localizedDescription ?? "None"), Initiated by client: \(initiatedByClient)")
        
        // Only transition to disconnecting if not already disconnecting or closed by user
        if self.state != .disconnecting && self.state != .closed(error: SocketError.explicitDisconnect) {
             self.state = .disconnecting
        }

        webSocketTask?.cancel(with: .goingAway, reason: "Client initiated disconnect".data(using: .utf8))
        webSocketTask = nil
        
        invalidateTimers()
        messageQueue.removeAll()
        
        self.state = .closed(error: effectiveError)
    }

    // MARK: - Shutdown WebSocket

    /// Performs a complete socket shutdown
    /// - Parameter reason: The reason for the shutdown
    private func shutdownSocket(reason: String) {
        self.userExplicitlyDisconnected = true // Ensure no reconnections
        performDisconnect(error: SocketError.underlyingError("Socket shutdown: \(reason)"), initiatedByClient: false)
    }

    // MARK: - Send Inbound Websocket Message to the Server

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

    // MARK: - Sends Raw JSON to the Server

    /// Sends raw data over the WebSocket
    /// - Parameters:
    ///   - data: The data to send
    ///   - description: Description of the data for logging
    /// - Returns: Whether the data was sent or queued successfully
    @discardableResult
    private func sendRawData(_ data: Data, description: String = "raw data") -> Bool {
        guard webSocketTask != nil, state.isConnected else {
            if !userExplicitlyDisconnected {
                // Queue messages if not connected but attempting to connect
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
            if !userExplicitlyDisconnected {
                messageQueue.append(data)
            }
            return true
        }
        logger.debug("Sending \(description): \(String(data: data, encoding: .utf8)?.prefix(200) ?? "\(data.count) bytes")")
        task.send(.data(data)) { [weak self] error in
            if let error = error {
                // Handle send errors by transitioning to the main actor for state updates
                Task { @MainActor [weak self] in
                    guard let self = self else { return }
                    self.logger.error("Send error for \(description): \(error)")
                    self.handleDisconnection(error: error, wasGraceful: false)
                }
            }
        }
        return true
    }

    // MARK: - Activate Subscription to High Volume Endpoint(s)

    /// Activates a server subscription to receive updates
    /// - Parameter subscriptionType: The type of subscription to activate
    public func activateSubscription(_ subscriptionType: SocketSubscription) {
        logger.info("Activating server subscription: \(subscriptionType)")

        subscriptions.insert(subscriptionType)
        
        let messageToSend: InboundWebSocketMessage
        
        switch subscriptionType {
        case .sessions:
            messageToSend = .sessionsStartMessage(
                SessionsStartMessage(data: subscriptionType.data, messageType: .sessionsStart)
            )
        case .scheduledTasks:
            messageToSend = .scheduledTasksInfoStartMessage(
                ScheduledTasksInfoStartMessage(data: subscriptionType.data, messageType: .scheduledTasksInfoStart)
            )
        case .activityLog:
            messageToSend = .activityLogEntryStartMessage(
                ActivityLogEntryStartMessage(data: subscriptionType.data, messageType: .activityLogEntryStart)
            )
        }
        send(messageToSend)
    }

    // MARK: - Deactivate Subscription from High Volume Endpoint(s)

    /// Deactivates a server subscription to stop receiving updates
    /// - Parameter subscriptionType: The type of subscription to deactivate
    public func deactivateSubscription(_ subscriptionType: SocketSubscription) {
        logger.info("Deactivating server subscription: \(subscriptionType)")

        subscriptions.remove(subscriptionType)

        let messageToSend: InboundWebSocketMessage

        switch subscriptionType {
        case .sessions:
            messageToSend = .sessionsStopMessage(
                SessionsStopMessage(messageType: .sessionsStop)
            )
        case .scheduledTasks:
            messageToSend = .scheduledTasksInfoStopMessage(
                ScheduledTasksInfoStopMessage(messageType: .scheduledTasksInfoStop)
            )
        case .activityLog:
            messageToSend = .activityLogEntryStopMessage(
                ActivityLogEntryStopMessage(messageType: .activityLogEntryStop)
            )
        }
        send(messageToSend)
    }

    // MARK: - Connect to the Jellyfin WebSocket Located at /socket

    /// Establishes a WebSocket connection with the Jellyfin server
    private func establishConnection() async {
        // This method is called on a background task
        // Safely access actor-isolated state by hopping to the main actor
        let isUserExplicitlyDisconnected = await MainActor.run { self.userExplicitlyDisconnected }
        
        guard !isUserExplicitlyDisconnected else {
            logger.info("Establish connection called, but user has explicitly disconnected. Aborting.")
            await MainActor.run {
                if self.state != .closed(error: SocketError.explicitDisconnect) {
                    self.state = .closed(error: SocketError.explicitDisconnect)
                }
            }
            return
        }

        guard let token = client.accessToken else {
            logger.error("Missing access token, device ID, or server URL.")
            await MainActor.run {
                self.handleDisconnection(error: SocketError.missingAccessTokenOrConfig, wasGraceful: true)
            }
            return
        }
        guard var urlComponents = URLComponents(url: client.configuration.url, resolvingAgainstBaseURL: false) else {
            logger.error("Invalid base URL for WebSocket.")
            await MainActor.run {
                self.handleDisconnection(error: SocketError.invalidURL, wasGraceful: true)
            }
            return
        }
        
        // Convert HTTP/HTTPS to WS/WSS for WebSocket protocol
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
            await MainActor.run {
                self.handleDisconnection(error: SocketError.invalidURL, wasGraceful: true)
            }
            return
        }
        
        // Redact token from logs for security
        logger.info("Connecting to WebSocket URL: \(url.absoluteString.replacingOccurrences(of: token, with: "***REDACTED_TOKEN***"))")
        let request = URLRequest(url: url)
        let session = getURLSession()
        
        // Create the WebSocket task on the URLSession's delegate queue to ensure proper threading
        await MainActor.run {
            session.delegateQueue.addOperation { [weak self] in
                guard let self = self else { return }
                
                // Check disconnection state again inside the operation
                Task { @MainActor [weak self] in
                    guard let self = self else { return }
                    
                    guard !self.userExplicitlyDisconnected else {
                        self.logger.info(
                            "Connection attempt aborted as user explicitly disconnected during URLSession operation scheduling."
                        )
                        return
                    }
                    
                    self.webSocketTask = self.urlSession.webSocketTask(with: request)
                    self.webSocketTask?.resume()
                    
                    // Since startListening is MainActor-isolated but we're in a background queue,
                    // we need to create a detached task that will handle the listening
                    await self.startListeningWrapper()
                }
            }
        }
    }
    
    /// Wrapper to safely start the WebSocket listening process
    private func startListeningWrapper() async {
        if let task = webSocketTask {
            let isUserExplicitlyDisconnected = self.userExplicitlyDisconnected
            
            if !isUserExplicitlyDisconnected {
                startListening(task: task)
            } else {
                logger.info("Listening attempt aborted as user explicitly disconnected.")
                performDisconnect(error: SocketError.explicitDisconnect, initiatedByClient: true)
            }
        } else {
            logger.warning("Attempted to start listening without a WebSocket task.")
            if self.state.isConnected || self.state == .connecting {
                handleDisconnection(error: SocketError.underlyingError("WebSocketTask became nil unexpectedly before listening."), wasGraceful: false)
            }
        }
    }

    // MARK: - Start Listening for WebSocket Messages

    /// Begins listening for messages from the WebSocket
    private func startListening(task: URLSessionWebSocketTask) {
        // Using a specific task parameter to avoid actor isolation issues with the property
        task.receive { [weak self] result in
            guard let self = self else { return }
            
            // All WebSocket callbacks must transition to the main actor for state updates
            Task { @MainActor [weak self] in
                guard let self = self else { return }
                
                let isExplicitlyDisconnected = self.userExplicitlyDisconnected
                guard !isExplicitlyDisconnected else {
                    self.logger.info("Received message/error but user explicitly disconnected. Ignoring.")
                    return
                }

                switch result {
                case .success(let wsMessage):
                    self.initialConnectionTimeoutTimer?.invalidate()
                    self.handleReceivedWebSocketMessage(wsMessage)

                    // Continue listening for more messages if still connected
                    if !self.userExplicitlyDisconnected {
                        // Use the URLSession's queue to avoid blocking the main thread
                        self.getURLSession().delegateQueue.addOperation { [weak self] in
                            guard let self = self else {
                                return
                            }
                            Task { @MainActor [weak self] in
                                guard let self = self else { return }
                                await self.startListeningWrapper()
                            }
                        }
                    }
                case .failure(let error):
                    // Check if the error is due to an explicit disconnect we already handled
                    if case .closed(let err) = self.state, (err as? SocketError) == .explicitDisconnect {
                        self.logger.info("Receive loop ended due to explicit disconnect (already processed).")
                        return
                    }
                    
                    // Handle URLSession cancellation errors differently
                    let nsError = error as NSError
                    if nsError.domain == NSURLErrorDomain && nsError.code == NSURLErrorCancelled {
                        self.logger.info("WebSocket task cancelled.")
                        if !self.userExplicitlyDisconnected && self.state != .closed(error: nil) && self.state != .disconnecting {
                             self.handleDisconnection(error: error, wasGraceful: true)
                        }
                        return
                    }
                    self.logger.error("Receive error: \(error.localizedDescription)")
                    self.handleDisconnection(error: error, wasGraceful: false)
                }
            }
        }
    }

    // MARK: - Process JSON into OutboundWebSocketMessage

    /// Handles messages received from the WebSocket
    /// - Parameter wsMessage: The received WebSocket message
    private func handleReceivedWebSocketMessage(_ wsMessage: URLSessionWebSocketTask.Message) {
        // This method is guaranteed to be called on the main thread due to @MainActor isolation
        let wasPreviouslyConnected = state.isConnected
        if !wasPreviouslyConnected, case .connecting = state {
            // First message received - we're officially connected
            logger.info("WebSocket connection established.")
            if let url = webSocketTask?.currentRequest?.url { state = .connected(url: url) }
            else { state = .connected(url: URL(string: "ws://unknown")!) }
            currentReconnectAttempts = 0
            
            // Update device capabilities in background to avoid blocking main thread
            Task.detached { [weak self, client = self.client] in
                guard self != nil else { return }
                await updateDeviceCapabilities(client: client, enable: true)
            }

            // Set up connection-related processes
            resubscribeToServerFeeds()
            processMessageQueue()
            startKeepAliveTimers()
        }
        
        // Reset activity timers - we got a response from the server
        serverResponseTimeoutTimer?.invalidate()
        lastServerActivity = Date()
        scheduleServerResponseTimeout()

        // Extract the message data based on the WebSocket message type
        let messageData: Data
        let messageStringPreview: String

        switch wsMessage {
        case .string(let text):
            logger.debug("Received String: \(text.prefix(500))")
            guard let data = text.data(using: .utf8) else {
                logger.error("Failed to convert received text to Data.")
                return
            }
            messageData = data
            messageStringPreview = text.prefix(200).description
        case .data(let data):
            logger.debug("Received Data: \(data.count) bytes")
            if let textPreview = String(data: data, encoding: .utf8)?.prefix(500) {
                 messageStringPreview = String(textPreview).prefix(200).description
            } else {
                 messageStringPreview = "\(data.count) non-UTF8 bytes"
            }
            messageData = data
        @unknown default:
            // Handle future WebSocket message types
            logger.warning("Received unknown message type from URLSessionWebSocketTask.")
            return
        }

        // Decode and process the message
        do {
            let decodedServerMessage = try jsonDecoder.decode(OutboundWebSocketMessage.self, from: messageData)
            logger.info("Successfully decoded server message of type: \(decodedServerMessage.sessionMessageType?.rawValue ?? "UnknownOutbound")")

            publish(decodedServerMessage)

            // Handle special message types
            switch decodedServerMessage {
            case .forceKeepAliveMessage(let fkaMsg):
                if let interval = fkaMsg.data {
                    // Server requested a specific keep-alive interval
                    self.keepAlivePingInterval = Double(interval) / 2
                    logger.info("Server forced KeepAlive ping interval to: \(self.keepAlivePingInterval)s")
                    startKeepAliveTimers()

                    send(.inboundKeepAliveMessage(InboundKeepAliveMessage(messageType: .keepAlive)))

                } else {
                    logger.warning("ForceKeepAliveMessage received without data for interval.")
                }
            case .outboundKeepAliveMessage:
                logger.debug("Received server KeepAlive (Pong). Last server activity updated.")
            default:
                break
            }

        } catch {
            // Provide detailed error info for debugging decoding issues
            let decodingError = error as? DecodingError
            let errorContext = decodingError != nil ? "\(decodingError!)" : error.localizedDescription
            logger.error("Failed to decode server message: \(errorContext). Raw: \(messageStringPreview)")
        }
    }

    // MARK: - Safely Publish the `OutboundWebSocketMessage` to `Messages`

    @Sendable private func publish(_ message: OutboundWebSocketMessage) {
        Task { @MainActor in
            self.messages.send(message)
        }
    }

    // MARK: - Handle WebSocket Disconnection

    /// Handles disconnection events and manages reconnection attempts
    /// - Parameters:
    ///   - error: The error that caused the disconnection, if any
    ///   - wasGraceful: Whether the disconnection was graceful
    private func handleDisconnection(error: Error?, wasGraceful: Bool) {
        invalidateTimers()
        
        // Only fully close the task if it wasn't already nilled by performDisconnect
        if webSocketTask != nil {
            webSocketTask?.cancel(with: .normalClosure, reason: nil)
            webSocketTask = nil
        }

        let actualError = error ?? SocketError.underlyingError("Unknown disconnection reason")
        
        let nsError = error as NSError?
        let isCancelledError = nsError?.domain == NSURLErrorDomain && nsError?.code == NSURLErrorCancelled

        if userExplicitlyDisconnected {
            logger.info("Handling disconnection, but user explicitly disconnected. Final state: Closed.")
            if state != .closed(error: SocketError.explicitDisconnect) {
                state = .closed(error: SocketError.explicitDisconnect)
            }
            return
        }
        
        if wasGraceful || isCancelledError {
            // Graceful disconnections don't need reconnection
            logger.info("WebSocket connection closed gracefully or was cancelled. Error: \(actualError.localizedDescription)")
            if state != .closed(error: nil) {
                state = .closed(error: nil)
            }
            return
        }

        logger.warning("WebSocket disconnected unexpectedly. Error: \(actualError.localizedDescription)")
        if state != .closed(error: actualError) { state = .closed(error: actualError) }
        
        // Implement exponential backoff for reconnection attempts
        if currentReconnectAttempts < maxReconnectAttempts {
            currentReconnectAttempts += 1
            let delay = pow(reconnectDelayBase, Double(currentReconnectAttempts))
            logger.info("Attempting to reconnect in \(delay) seconds... (Attempt \(currentReconnectAttempts)/\(maxReconnectAttempts))")
            
            if state != .connecting {
                state = .connecting
            }

            // Schedule reconnect after delay
            Task {
                try? await Task.sleep(nanoseconds: UInt64(delay * 1_000_000_000))
                
                guard !self.userExplicitlyDisconnected else {
                    self.logger.info("Reconnect attempt aborted post-delay as user explicitly disconnected.")
                    await MainActor.run {
                         if self.state != .closed(error: SocketError.explicitDisconnect) {
                            self.state = .closed(error: SocketError.explicitDisconnect)
                         }
                    }
                    return
                }

                // Check current state on main thread before proceeding to avoid race conditions
                await MainActor.run {
                    guard self.state == .connecting || (self.state.isClosedError(actualError) && self.webSocketTask == nil) else {
                        self.logger.info("Reconnect cancelled due to state change or manual disconnect (main thread check).")
                        return
                    }
                    Task.detached { [weak self] in
                        guard let self = self else { return }
                        await self.establishConnection()
                    }
                }
            }
        } else {
            // Too many reconnection attempts - give up
            logger.error("Max reconnect attempts reached. Giving up.")
            if state != .error(SocketError.maxReconnectAttemptsReached) {
                state = .error(SocketError.maxReconnectAttemptsReached)
            }
        }
    }

    // MARK: - Invalidate All Timers for WebSocket Events

    /// Stops and invalidates all active timers
    private func invalidateTimers() {
        keepAlivePingTimer?.invalidate(); keepAlivePingTimer = nil
        initialConnectionTimeoutTimer?.invalidate(); initialConnectionTimeoutTimer = nil
        serverResponseTimeoutTimer?.invalidate(); serverResponseTimeoutTimer = nil
    }

    // MARK: - Process Queued Messages

    /// Sends any messages that were queued while disconnected
    private func processMessageQueue() {
        guard !messageQueue.isEmpty else { return }
        logger.info("Processing \(messageQueue.count) queued messages...")
        let queued = messageQueue; messageQueue.removeAll()
        for dataItem in queued {
            sendRawData(dataItem, description: "queued message")
        }
    }

    // MARK: - Reestablish Subscriptions After Reconnection

    /// Reactivates all active subscriptions after a reconnection
    private func resubscribeToServerFeeds() {
        guard !subscriptions.isEmpty else {
            return
        }

        logger.info("Resubscribing to \(subscriptions.count) server feeds...")

        for subscriptionType in subscriptions {
            activateSubscription(subscriptionType)
        }
    }
    
    // MARK: - Start KeepAlive Timers

    /// Initializes timers to send keep-alive messages and monitor server activity
    private func startKeepAliveTimers() {
        stopKeepAliveTimers()
        logger.info(
            "Starting KeepAlive timers. Ping interval: \(keepAlivePingInterval)s, Server response timeout: \(serverResponseTimeout)s"
        )

        // Send initial keep-alive message
        send(.inboundKeepAliveMessage(InboundKeepAliveMessage(messageType: .keepAlive)))

        scheduleServerResponseTimeout()

        // Capture the current interval to avoid actor-isolation issues in timer
        let interval = self.keepAlivePingInterval
        
        // Schedule periodic keep-alive pings
        keepAlivePingTimer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { [weak self] _ in
            Task { @MainActor [weak self] in
                guard let self = self else { return }
                
                let isConnected = self.state.isConnected
                let isExplicitlyDisconnected = self.userExplicitlyDisconnected
                
                // Don't send pings if disconnected or explicitly disconnected
                guard isConnected else {
                    self.stopKeepAliveTimers()
                    return
                }
                
                guard !isExplicitlyDisconnected else {
                    self.stopKeepAliveTimers()
                    return
                }

                // Send keep-alive ping to server
                self.send(.inboundKeepAliveMessage(InboundKeepAliveMessage(messageType: .keepAlive)))

                self.scheduleServerResponseTimeout()
            }
        }
    }
    
    // MARK: - Stop KeepAlive Timers

    /// Stops all keep-alive related timers
    private func stopKeepAliveTimers() {
        logger.info("Stopping KeepAlive timers.")
        keepAlivePingTimer?.invalidate(); keepAlivePingTimer = nil
        serverResponseTimeoutTimer?.invalidate(); serverResponseTimeoutTimer = nil
    }

    // MARK: - Schedule Server Response Timeout
    
    /// Creates a timer to detect server unresponsiveness
    private func scheduleServerResponseTimeout() {
        serverResponseTimeoutTimer?.invalidate()
        
        // Capture the timeout value to avoid actor isolation issues in timer
        let timeout = self.serverResponseTimeout
        
        // Set up timer to detect if server doesn't respond
        serverResponseTimeoutTimer = Timer.scheduledTimer(withTimeInterval: timeout, repeats: false) { [weak self] _ in
            Task { @MainActor [weak self] in
                guard let self = self else { return }
                
                let isConnected = self.state.isConnected
                let isExplicitlyDisconnected = self.userExplicitlyDisconnected
                
                // Only check timeout if connected and not explicitly disconnected
                guard isConnected, !isExplicitlyDisconnected else {
                    return
                }

                // Compare current time with last activity time to detect timeouts
                let now = Date()
                if let lastActivity = self.lastServerActivity, now.timeIntervalSince(lastActivity) >= timeout {
                    self.logger.warning("No server activity for \(timeout)s. Assuming connection lost.")
                    self.handleDisconnection(error: SocketError.connectionTimeout, wasGraceful: false)
                } else if self.lastServerActivity == nil {
                    self.logger.warning("No server activity recorded (lastServerActivity is nil), but timeout triggered. Assuming connection lost.")
                } else {
                    // We got activity in the meantime, reschedule the timeout
                    self.scheduleServerResponseTimeout()
                }
            }
        }
    }
}

// MARK: - Update Device Capabilities

/// Posts device capabilities to the server after connection
@Sendable
private func updateDeviceCapabilities(client: JellyfinClient, enable: Bool) async {
    do {
        var parameters = Paths.PostCapabilitiesParameters()
        
        // Set capabilities based on enable flag
        if enable {
            parameters.isSupportsMediaControl = true
            parameters.supportedCommands = [.displayMessage]
        } else {
            parameters.isSupportsMediaControl = false
            parameters.supportedCommands = nil
        }
        
        let request = Paths.postCapabilities(parameters: parameters)
        try await client.send(request)
    } catch {
        // Error handling is performed by the caller
    }
}

// MARK: - JellyfinSocketLogger

/// Logger class for JellyfinSocket that provides different logging levels and formatting
public final class JellyfinSocketLogger: Sendable {
    /// Defines the available logging levels for the socket logger
    public enum LogLevel: Int, Comparable, Sendable {
        case off
        case error
        case warning
        case info
        case debug

        public static func < (lhs: LogLevel, rhs: LogLevel) -> Bool {
            lhs.rawValue < rhs.rawValue
        }
    }

    /// Current logging level that determines which messages will be displayed
    public let level: LogLevel
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
        guard level.rawValue <= self.level.rawValue else {
            return
        }
        let timestamp = dateFormatter.string(from: Date())
        print("[\(timestamp)] [\(label)] [\(type.uppercased())] \(message())")
    }

    /// Logs a debug message if debug level is enabled
    /// - Parameter message: The debug message to log
    public func debug(_ message: @autoclosure () -> String) {
        log(message(), type: "debug", at: .debug)
    }
    
    /// Logs an info message if info level or higher is enabled
    /// - Parameter message: The info message to log
    public func info(_ message: @autoclosure () -> String) {
        log(message(), type: "info", at: .info)
    }
    
    /// Logs a warning message if warning level or higher is enabled
    /// - Parameter message: The warning message to log
    public func warning(_ message: @autoclosure () -> String) {
        log(message(), type: "warning", at: .warning)
    }
    
    /// Logs an error message if error level or higher is enabled
    /// - Parameter message: The error message to log
    public func error(_ message: @autoclosure () -> String) {
        log(message(), type: "error", at: .error)
    }
}
