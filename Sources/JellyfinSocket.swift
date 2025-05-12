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
public final class JellyfinSocket: ObservableObject {

    // MARK: - Published Variables

    /// Current state of the socket connection
    @Published
    public private(set) var state: SocketState = .idle
    /// Timestamp of the most recent activity from the server
    @Published
    public private(set) var lastServerActivity: Date?

    /// Publisher for parsed server messages
    public let serverMessagePublisher = PassthroughSubject<OutboundWebSocketMessage, Never>()

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
    private var urlSession: URLSession!
    /// Current WebSocket task
    private var webSocketTask: URLSessionWebSocketTask?

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

    // MARK: - WebSocket Messages & Subscriptions

    /// Queue for messages waiting to be sent after reconnection
    private var messageQueue: [Data] = []
    /// Set of active server subscriptions to maintain across disconnections
    private var activeServerSubscriptions = Set<SocketSubscription>()

    // MARK: - JSON En/Decoders

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

        let queue = OperationQueue()
        queue.name = "com.jellyfin.sdk.websocket.queue"
        queue.maxConcurrentOperationCount = 1

        self.urlSession = URLSession(
            configuration: .default,
            delegate: nil,
            delegateQueue: queue
        )
        
        $state.sink { [weak self] newState in
            DispatchQueue.main.async {
                self?.logger.info("State changed to: \(String(describing: newState))")
            }
        }.store(in: &cancellables)
    }

    // MARK: - Deinitializer

    /// Cleans up resources when the object is deallocated
    deinit {
        logger.info("JellyfinSocket deinit - shutting down.")
        // Use a method that ensures no further reconnect attempts
        shutdownSocket(reason: "Deinitialization")
        // Launch detached task that doesn't depend on self
        Task.detached {
            do {
                await self.updateDeviceCapabilities(enable: false)
            }
        }
    }

    // MARK: - Connect to WebSocket

    /// Initiates a connection to the Jellyfin WebSocket
    public func connect() {
        DispatchQueue.main.async {
            self.userExplicitlyDisconnected = false
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
        
        DispatchQueue.main.async {
            // Only transition to disconnecting if not already disconnecting or closed by user.
            if self.state != .disconnecting && self.state != .closed(error: SocketError.explicitDisconnect) {
                 self.state = .disconnecting
            }
        }

        webSocketTask?.cancel(with: .goingAway, reason: "Client initiated disconnect".data(using: .utf8))
        webSocketTask = nil
        
        invalidateTimers()
        messageQueue.removeAll()
        
        DispatchQueue.main.async {
            self.state = .closed(error: effectiveError)
        }
    }

    // MARK: - Shutdown WebSocket

    /// Internal method to shut down the socket (used by deinit)
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
            DispatchQueue.main.async {
                if let error = error {
                    self?.logger.error("Send error for \(description): \(error)")
                    self?.handleDisconnection(error: error, wasGraceful: false)
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
        activeServerSubscriptions.insert(subscriptionType)
        
        let messageToSend: InboundWebSocketMessage
        
        switch subscriptionType {
        case .sessions:
            var messageStruct = SessionsStartMessage()
            messageStruct.data = subscriptionType.data
            messageToSend = .sessionsStartMessage(messageStruct)
        case .scheduledTasks:
            var messageStruct = ScheduledTasksInfoStartMessage()
            messageStruct.data = subscriptionType.data
            messageToSend = .scheduledTasksInfoStartMessage(messageStruct)
        case .activityLog:
            var messageStruct = ActivityLogEntryStartMessage()
            messageStruct.data = subscriptionType.data
            messageToSend = .activityLogEntryStartMessage(messageStruct)
        }
        send(messageToSend)
    }

    // MARK: - Deactivate Subscription from High Volume Endpoint(s)

    /// Deactivates a server subscription to stop receiving updates
    /// - Parameter subscriptionType: The type of subscription to deactivate
    public func deactivateSubscription(_ subscriptionType: SocketSubscription) {
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

    // MARK: - Connect to the Jellyfin WebSocket Located at /socket

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
                self.logger.info(
                    "Connection attempt aborted as user explicitly disconnected during URLSession operation scheduling."
                )
                return
            }
            self.webSocketTask = self.urlSession.webSocketTask(with: request)
            self.webSocketTask?.resume()
            self.startListening()
        }
    }

    // MARK: - Start Listening for WebSocket Messages

    /// Begins listening for messages from the WebSocket
    private func startListening() {
        // This is called from urlSession's delegate queue.
        guard let task = webSocketTask else {
            logger.warning("Attempted to start listening without a WebSocket task.")
            DispatchQueue.main.async {
                if self.state.isConnected || self.state == .connecting {
                    self.handleDisconnection(error: SocketError.underlyingError("WebSocketTask became nil unexpectedly before listening."), wasGraceful: false)
                }
            }
            return
        }
        
        guard !userExplicitlyDisconnected else {
            logger.info("Listening attempt aborted as user explicitly disconnected.")
            DispatchQueue.main.async { self.performDisconnect(error: SocketError.explicitDisconnect, initiatedByClient: true) }
            return
        }

        task.receive { [weak self] result in
            guard let self = self else { return }
            guard !self.userExplicitlyDisconnected else {
                self.logger.info(
                    "Received message/error but user explicitly disconnected. Ignoring."
                )
                return
            }

            DispatchQueue.main.async {
                guard !self.userExplicitlyDisconnected else {
                    self.logger.info(
                        "Processing received message/error but user explicitly disconnected (main thread check). Ignoring."
                    )
                    return
                }
                switch result {
                case .success(let wsMessage):
                    self.initialConnectionTimeoutTimer?.invalidate()
                    self.handleReceivedWebSocketMessage(wsMessage)

                    if self.webSocketTask != nil && !self.userExplicitlyDisconnected {
                         self.urlSession.delegateQueue.addOperation {
                            self.startListening()
                         }
                    }
                case .failure(let error):
                    if case .closed(let err) = self.state, (err as? SocketError) == .explicitDisconnect {
                        self.logger.info(
                            "Receive loop ended due to explicit disconnect (already processed)."
                        )
                        return
                    }
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
        // This method is guaranteed to be called on the main thread due to DispatchQueue.main.async in startListening.
        let wasPreviouslyConnected = state.isConnected
        if !wasPreviouslyConnected, case .connecting = state {
            logger.info("WebSocket connection established.")
            if let url = webSocketTask?.currentRequest?.url { state = .connected(url: url) }
            else { state = .connected(url: URL(string: "ws://unknown")!) }
            currentReconnectAttempts = 0
            
            Task.detached {
                await self.updateDeviceCapabilities(enable: true)
            }

            resubscribeToServerFeeds()
            processMessageQueue()
            startKeepAliveTimers()
        }
        
        // Reset timer because we got activity
        serverResponseTimeoutTimer?.invalidate()
        lastServerActivity = Date()
        scheduleServerResponseTimeout()

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
                    startKeepAliveTimers()

                    // Send KeepAlive Message to Server
                    send(
                        .inboundKeepAliveMessage(
                            InboundKeepAliveMessage(messageType: .keepAlive)
                        )
                    )

                } else {
                    logger.warning("ForceKeepAliveMessage received without data for interval.")
                }
            case .outboundKeepAliveMessage:
                logger.debug("Received server KeepAlive (Pong). Last server activity updated.")
            default:
                break
            }

        } catch {
            let decodingError = error as? DecodingError
            let errorContext = decodingError != nil ? "\(decodingError!)" : error.localizedDescription
            logger.error("Failed to decode server message: \(errorContext). Raw: \(messageStringPreview)")
        }
    }

    // MARK: - Handle WebSocket Disconnection

    /// Handles disconnection events and manages reconnection attempts
    /// - Parameters:
    ///   - error: The error that caused the disconnection, if any
    ///   - wasGraceful: Whether the disconnection was graceful
    private func handleDisconnection(error: Error?, wasGraceful: Bool) {
        guard Thread.isMainThread else {
            DispatchQueue.main.async { self.handleDisconnection(error: error, wasGraceful: wasGraceful) }
            return
        }

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
            logger.info("WebSocket connection closed gracefully or was cancelled. Error: \(actualError.localizedDescription)")
            if state != .closed(error: nil) {
                state = .closed(error: nil)
            }
            return
        }

        logger.warning("WebSocket disconnected unexpectedly. Error: \(actualError.localizedDescription)")
        if state != .closed(error: actualError) { state = .closed(error: actualError) }
        
        if currentReconnectAttempts < maxReconnectAttempts {
            currentReconnectAttempts += 1
            let delay = pow(reconnectDelayBase, Double(currentReconnectAttempts))
            logger.info("Attempting to reconnect in \(delay) seconds... (Attempt \(currentReconnectAttempts)/\(maxReconnectAttempts))")
            
            if state != .connecting {
                state = .connecting
            }

            Task {
                try? await Task.sleep(nanoseconds: UInt64(delay * 1_000_000_000))
                
                guard !self.userExplicitlyDisconnected else {
                    self.logger.info("Reconnect attempt aborted post-delay as user explicitly disconnected.")
                    DispatchQueue.main.async {
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

    // MARK: - Turn of all Timers for WebSocket Events

    /// Invalidates all active timers
    private func invalidateTimers() {
        // Ensure timers are invalidated on the main thread as they were scheduled there.
        guard Thread.isMainThread else {
            DispatchQueue.main.async {
                self.invalidateTimers()
            }
            return
        }
        keepAlivePingTimer?.invalidate(); keepAlivePingTimer = nil
        initialConnectionTimeoutTimer?.invalidate(); initialConnectionTimeoutTimer = nil
        serverResponseTimeoutTimer?.invalidate(); serverResponseTimeoutTimer = nil
    }

    // MARK: - Process Queued Messages into InboundWebSocketMessages

    /// Processes any queued messages that were waiting for connection
    private func processMessageQueue() {
        guard !messageQueue.isEmpty else { return }
        logger.info("Processing \(messageQueue.count) queued messages...")
        let queued = messageQueue; messageQueue.removeAll()
        for dataItem in queued { sendRawData(dataItem, description: "queued message") }
    }

    // MARK: - Reconnect to Subscriptions after a Reconnections

    /// Resubscribes to any active server feeds after reconnection
    private func resubscribeToServerFeeds() {
        guard !activeServerSubscriptions.isEmpty else { return }
        logger.info("Resubscribing to \(activeServerSubscriptions.count) server feeds...")
        let subscriptionsToReactivate = activeServerSubscriptions
        for subscriptionType in subscriptionsToReactivate {
            activateSubscription(subscriptionType)
        }
    }
    
    // MARK: - Start a Timer for KeepAlive Messages to Avoid Disconnection

    /// Starts the timers for keep-alive pings and server response timeout
    private func startKeepAliveTimers() {
        guard Thread.isMainThread else {
            DispatchQueue.main.async { self.startKeepAliveTimers() }
            return
        }
        stopKeepAliveTimers()
        logger.info(
            "Starting KeepAlive timers. Ping interval: \(keepAlivePingInterval)s, Server response timeout: \(serverResponseTimeout)s"
        )

        // Send KeepAlive Message to Server
        send(
            .inboundKeepAliveMessage(
                InboundKeepAliveMessage(messageType: .keepAlive)
            )
        )

        scheduleServerResponseTimeout()

        keepAlivePingTimer = Timer.scheduledTimer(withTimeInterval: keepAlivePingInterval, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            guard self.state.isConnected else { self.stopKeepAliveTimers(); return }
            guard !self.userExplicitlyDisconnected else { self.stopKeepAliveTimers(); return }

            // Send KeepAlive Message to Server
            send(
                .inboundKeepAliveMessage(
                    InboundKeepAliveMessage(messageType: .keepAlive)
                )
            )

            self.scheduleServerResponseTimeout()
        }
    }

    // MARK: - Stop a Timer for KeepAlive Messages After Sending

    /// Stops the keep-alive and server response timeout timers
    private func stopKeepAliveTimers() {
        guard Thread.isMainThread else {
            DispatchQueue.main.async { self.stopKeepAliveTimers() }
            return
        }
        logger.info("Stopping KeepAlive timers.")
        keepAlivePingTimer?.invalidate(); keepAlivePingTimer = nil
        serverResponseTimeoutTimer?.invalidate(); serverResponseTimeoutTimer = nil
    }

    // MARK: - Stop a Timer for KeepAlive Messages After Sending
    
    /// Schedules a timeout timer to detect server unresponsiveness
    private func scheduleServerResponseTimeout() {
        guard Thread.isMainThread else {
            DispatchQueue.main.async { self.scheduleServerResponseTimeout() }
            return
        }
        serverResponseTimeoutTimer?.invalidate()
        serverResponseTimeoutTimer = Timer.scheduledTimer(withTimeInterval: serverResponseTimeout, repeats: false) { [weak self] _ in
            guard let self = self else { return }
            guard self.state.isConnected else { return }
            guard !self.userExplicitlyDisconnected else { return }

            let now = Date()
            if let lastActivity = self.lastServerActivity, now.timeIntervalSince(lastActivity) >= self.serverResponseTimeout {
                self.logger.warning("No server activity for \(self.serverResponseTimeout)s. Assuming connection lost.")
                self.handleDisconnection(error: SocketError.connectionTimeout, wasGraceful: false)
            } else if self.lastServerActivity == nil {
                self.logger.warning("No server activity recorded (lastServerActivity is nil), but timeout triggered. Assuming connection lost.")
            } else {
                self.scheduleServerResponseTimeout()
            }
        }
    }

    // MARK: - Tell the Jellyfin Server what Events the Client Supports

    /// Posts device capabilities to the server after connection
    private func updateDeviceCapabilities(enable: Bool) async {
        do {
            var parameters = Paths.PostCapabilitiesParameters()
            
            // Set capabilities based on enable flag
            if enable {
                parameters.isSupportsMediaControl = isSupportsMediaControl
                parameters.supportedCommands = supportedCommands
            } else {
                parameters.isSupportsMediaControl = false
                parameters.supportedCommands = nil
            }
            
            let request = Paths.postCapabilities(parameters: parameters)
            try await client.send(request)
            logger.info("Device capabilities successfully \(enable ? "enabled" : "disabled")")
        } catch {
            logger.error("Failed to \(enable ? "enable" : "disable") device capabilities: \(error.localizedDescription)")
        }
    }
}

// MARK: - JellyfinSocketLogger

/// Logger class for JellyfinSocket that provides different logging levels and formatting
public class JellyfinSocketLogger {
    /// Defines the available logging levels for the socket logger
    public enum LogLevel: Int, Comparable {
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
