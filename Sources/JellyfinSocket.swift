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
/// Uses URLSessionWebSocketTask under the hood.
public final class JellyfinSocket: ObservableObject {
    // MARK: Public Types

    public enum State: Equatable {
        case idle
        case connecting
        case connected
        case reconnecting(attempt: Int)
        case error(String)
        case closed
    }
    
    // MARK: Published Properties
    
    /// Current state of the socket connection
    @Published public private(set) var state: State = .idle
    
    /// Latest session information
    @Published public private(set) var sessions: SessionsMessage?
    
    /// Latest activity log entries
    @Published public private(set) var activityLog: ActivityLogEntryMessage?
    
    /// Latest user data changes
    @Published public private(set) var userDataChanges: UserDataChangedMessage?
    
    /// Latest playstate messages
    @Published public private(set) var playstate: PlaystateMessage?
    
    /// Latest library changes
    @Published public private(set) var libraryChanges: LibraryChangedMessage?
    
    /// Latest scheduled task information
    @Published public private(set) var scheduledTasks: ScheduledTasksInfoMessage?
    
    /// Connection heartbeat pulse - increments whenever a keepAlive is received
    @Published public private(set) var heartbeatCount: Int = 0
    
    /// All received messages, for custom handling
    public var messages: AnyPublisher<OutboundWebSocketMessage, Never> {
        outboundSubject.eraseToAnyPublisher()
    }

    // MARK: Private Properties

    private let client: JellyfinClient
    private let socketPath = "/socket"
    private let maxReconnectAttempts = 5
    private let pingInterval: TimeInterval = 15
    private let validationTimeout: TimeInterval = 5

    private var task: URLSessionWebSocketTask?
    private var reconnectAttempts = 0
    private var hasReceivedFirstMessage = false

    private var pingWorkItem: DispatchWorkItem?
    private var validationWorkItem: DispatchWorkItem?
    private var reconnectWorkItem: DispatchWorkItem?

    private let session = URLSession(configuration: .default)
    private let outboundSubject = PassthroughSubject<OutboundWebSocketMessage, Never>()
    private var cancellables = Set<AnyCancellable>()
    
    private var activeSubscriptions: Set<SessionMessageType> = []

    // MARK: Init

    public init(client: JellyfinClient) {
        self.client = client
    }
    
    deinit {
        stopInternal()
    }

    // MARK: Public API
    
    /// Start the WebSocket connection with specified subscriptions
    /// - Parameter types: Optional specific event types to subscribe to. If nil, subscribes to standard events.
    @MainActor
    public func start(with types: [SessionMessageType]? = nil) {
        guard state == .idle || state == .error("") || state == .closed else { return }
        
        // Default subscriptions if none specified
        let subscriptions = types ?? [.sessions, .activityLogEntry, .scheduledTasksInfo, .playstate, .userDataChanged, .libraryChanged]
        
        // Reset state and start connection
        reconnectAttempts = 0
        state = .connecting
        
        // Open socket and subscribe to events
        openSocket(subscribeTo: subscriptions)
    }
    
    /// Stop the WebSocket connection
    private func stopInternal() {
        if case .connected = state {
            stopAllSubscriptions()
        }
        
        pingWorkItem?.cancel()
        validationWorkItem?.cancel()
        reconnectWorkItem?.cancel()
        cancellables.removeAll()
        
        task?.cancel(with: .goingAway, reason: nil)
        task = nil
        
        // Update state on main thread since it's a published property
        DispatchQueue.main.async {
            self.state = .closed
        }
    }

    @MainActor
    public func stop() {
        stopInternal()
    }
    
    /// Send a specific inbound message to the server
    /// - Parameter message: The InboundWebSocketMessage to send
    /// - Returns: True if the message was sent successfully
    @discardableResult
    public func send(_ message: InboundWebSocketMessage) -> Bool {
        guard case .connected = state, let task = task else {
            print("[WebSocket] Not connected; cannot send.")
            return false
        }
        do {
            let data = try JSONEncoder().encode(message)
            guard let text = String(data: data, encoding: .utf8) else {
                print("[WebSocket] Failed to encode message to string")
                return false
            }
            
            task.send(.string(text)) { error in
                if let e = error { print("[WebSocket] send error: \(e)") }
            }
            return true
        } catch {
            print("[WebSocket] encode error: \(error)")
            return false
        }
    }
    
    /// Subscribe to a specific event stream
    /// - Parameter type: The SessionMessageType to subscribe to
    /// - Returns: True if the subscription was sent successfully
    @discardableResult
    public func subscribe(to type: SessionMessageType) -> Bool {
        guard case .connected = state else {
            print("[WebSocket] Not connected; cannot subscribe.")
            return false
        }
        
        return subscribeToEventType(type)
    }
    
    /// Unsubscribe from a specific event stream
    /// - Parameter type: The SessionMessageType to unsubscribe from
    /// - Returns: True if the unsubscription was sent successfully
    @discardableResult
    public func unsubscribe(from type: SessionMessageType) -> Bool {
        guard case .connected = state else {
            print("[WebSocket] Not connected; cannot unsubscribe.")
            return false
        }
        
        switch type {
        case .sessions, .sessionsStart:
            activeSubscriptions.remove(.sessionsStart)
            return sendSessionsStopMessage()
            
        case .activityLogEntry, .activityLogEntryStart:
            activeSubscriptions.remove(.activityLogEntryStart)
            return sendActivityLogEntryStopMessage()
            
        case .scheduledTasksInfo, .scheduledTasksInfoStart:
            activeSubscriptions.remove(.scheduledTasksInfoStart)
            return sendScheduledTasksInfoStopMessage()
            
        default:
            return false
        }
    }

    // MARK: Internal Methods

    private func openSocket(subscribeTo types: [SessionMessageType]) {
        guard let token = client.accessToken else {
            state = .error("Missing access token")
            return
        }
        
        state = reconnectAttempts == 0 ? .connecting : .reconnecting(attempt: reconnectAttempts)
        hasReceivedFirstMessage = false
        activeSubscriptions.removeAll()

        var comps = URLComponents(url: client.configuration.url, resolvingAgainstBaseURL: false)!
        comps.scheme = (comps.scheme == "https" ? "wss" : "ws")
        comps.path = socketPath
        
        // Add important query parameters for better device identification
        var queryItems = [URLQueryItem]()

        queryItems.append(URLQueryItem(name: "deviceId", value: client.configuration.deviceID))

        if let apiKey = client.accessToken {
            queryItems.append(URLQueryItem(name: "api_key", value: apiKey))
        }
        if !queryItems.isEmpty {
            comps.queryItems = queryItems
        }

        var req = URLRequest(url: comps.url!)
        req.setValue("MediaBrowser Token=\(token)", forHTTPHeaderField: "Authorization")
        task = session.webSocketTask(with: req)
        task?.resume()

        setupMessageHandler()
        scheduleValidationTimeout()
        
        // Setup state observation for subscriptions
        $state
            .filter { $0 == .connected }
            .first()
            .sink { [weak self] _ in
                guard let self = self else { return }
                for type in types {
                    _ = self.subscribeToEventType(type)
                }
            }
            .store(in: &cancellables)
    }
    
    private func setupMessageHandler() {
        listenLoop()
    }

    private func listenLoop() {
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
                    }
                @unknown default:
                    break
                }
                self.listenLoop()

            case .failure(let err):
                self.handleError(err.localizedDescription)
            }
        }
    }

    private func handle(_ text: String) {
        if !hasReceivedFirstMessage {
            hasReceivedFirstMessage = true
            validationWorkItem?.cancel()
            state = .connected
            reconnectAttempts = 0
            schedulePings()
        }
        
        guard let data = text.data(using: .utf8) else {
            print("[WebSocket] cannot convert text to data: \(text)")
            return
        }
        
        // Create the decoder
        let decoder = JSONDecoder()
        
        // Configure date handling
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        decoder.dateDecodingStrategy = .custom { decoder in
            let container = try decoder.singleValueContainer()
            let string = try container.decode(String.self)
            if let date = isoDateFormatter.date(from: string) {
                return date
            }
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid date format")
        }
        
        do {
            let msg = try decoder.decode(OutboundWebSocketMessage.self, from: data)
            
            // Handle different message types
            switch msg {
            case .forceKeepAliveMessage:
                _ = sendKeepAliveResponse()
                return
                
            case .outboundKeepAliveMessage:
                heartbeatCount += 1
                return
                
            case .sessionsMessage(let sessionsMsg):
                self.sessions = sessionsMsg
                
            case .activityLogEntryMessage(let activityMsg):
                self.activityLog = activityMsg
                
            case .userDataChangedMessage(let userDataMsg):
                self.userDataChanges = userDataMsg
                
            case .playstateMessage(let playstateMsg):
                self.playstate = playstateMsg
                
            case .libraryChangedMessage(let libraryMsg):
                self.libraryChanges = libraryMsg
                
            case .scheduledTasksInfoMessage(let tasksMsg):
                self.scheduledTasks = tasksMsg
                
            default:
                break
            }
            
            // Forward all messages to the subject
            outboundSubject.send(msg)
            
        } catch {
            print("[WebSocket] decode failure: \(error) for: \(text)")
        }
    }

    private func handleError(_ description: String) {
        print("[WebSocket] Error: \(description)")
        state = .error(description)
        scheduleReconnect()
    }

    private func scheduleValidationTimeout() {
        validationWorkItem?.cancel()
        let w = DispatchWorkItem { [weak self] in
            guard let s = self, !s.hasReceivedFirstMessage else { return }
            s.handleError("Connection timed out")
        }
        validationWorkItem = w
        DispatchQueue.global().asyncAfter(deadline: .now() + validationTimeout, execute: w)
    }

    private func schedulePings() {
        pingWorkItem?.cancel()
        let w = DispatchWorkItem { [weak self] in
            guard let s = self, case .connected = s.state else { return }
            s.task?.sendPing { err in
                if let e = err { s.handleError("Ping failed: \(e)") }
            }
            _ = self?.sendKeepAlive()
            self?.schedulePings()
        }
        pingWorkItem = w
        DispatchQueue.global().asyncAfter(deadline: .now() + pingInterval, execute: w)
    }

    private func scheduleReconnect() {
        guard reconnectAttempts < maxReconnectAttempts else {
            state = .error("Max reconnect attempts reached")
            return
        }
        reconnectAttempts += 1
        let delay = pow(2.0, Double(reconnectAttempts))
        reconnectWorkItem?.cancel()
        let w = DispatchWorkItem { [weak self] in
            guard let self = self else { return }
            let lastSubscriptions = Array(self.activeSubscriptions)
            self.openSocket(subscribeTo: lastSubscriptions)
        }
        reconnectWorkItem = w
        DispatchQueue.global().asyncAfter(deadline: .now() + delay, execute: w)
    }
    
    /// Stop all active subscriptions
    private func stopAllSubscriptions() {
        // Send stop messages for all active subscriptions
        if activeSubscriptions.contains(.sessionsStart) || activeSubscriptions.contains(.sessions) {
            sendSessionsStopMessage()
        }
        
        if activeSubscriptions.contains(.activityLogEntryStart) || activeSubscriptions.contains(.activityLogEntry) {
            sendActivityLogEntryStopMessage()
        }
        
        if activeSubscriptions.contains(.scheduledTasksInfoStart) || activeSubscriptions.contains(.scheduledTasksInfo) {
            sendScheduledTasksInfoStopMessage()
        }
        
        // Clear active subscriptions
        activeSubscriptions.removeAll()
    }

    /// Subscribe to a specific event type
    @discardableResult
    private func subscribeToEventType(_ eventType: SessionMessageType) -> Bool {
        // Determine if this is a "start" event type or a regular event type
        // that requires a corresponding start message
        switch eventType {
        case .sessionsStart, .sessions:
            activeSubscriptions.insert(.sessionsStart)
            return sendSessionsStartMessage()
            
        case .activityLogEntryStart, .activityLogEntry:
            activeSubscriptions.insert(.activityLogEntryStart)
            return sendActivityLogEntryStartMessage()
            
        case .scheduledTasksInfoStart, .scheduledTasksInfo:
            activeSubscriptions.insert(.scheduledTasksInfoStart)
            return sendScheduledTasksInfoStartMessage()
            
        case .keepAlive:
            return sendKeepAlive()
            
        // For other event types, no specific subscription required
        // as they are included in the streams we subscribe to above
        default:
            return true
        }
    }
    
    // MARK: Session Start/Stop Messages
    
    @discardableResult
    private func sendSessionsStartMessage() -> Bool {
        let msg = SessionsStartMessage(messageType: .sessionsStart)
        return send(.sessionsStartMessage(msg))
    }
    
    @discardableResult
    private func sendSessionsStopMessage() -> Bool {
        let msg = SessionsStopMessage(messageType: .sessionsStop)
        return send(.sessionsStopMessage(msg))
    }
    
    @discardableResult
    private func sendActivityLogEntryStartMessage() -> Bool {
        let msg = ActivityLogEntryStartMessage(messageType: .activityLogEntryStart)
        return send(.activityLogEntryStartMessage(msg))
    }
    
    @discardableResult
    private func sendActivityLogEntryStopMessage() -> Bool {
        let msg = ActivityLogEntryStopMessage(messageType: .activityLogEntryStop)
        return send(.activityLogEntryStopMessage(msg))
    }
    
    @discardableResult
    private func sendScheduledTasksInfoStartMessage() -> Bool {
        let msg = ScheduledTasksInfoStartMessage(messageType: .scheduledTasksInfoStart)
        return send(.scheduledTasksInfoStartMessage(msg))
    }
    
    @discardableResult
    private func sendScheduledTasksInfoStopMessage() -> Bool {
        let msg = ScheduledTasksInfoStopMessage(messageType: .scheduledTasksInfoStop)
        return send(.scheduledTasksInfoStopMessage(msg))
    }

    // MARK: Keep-Alive Helpers

    @discardableResult
    private func sendKeepAliveResponse() -> Bool {
        let msg = InboundKeepAliveMessage(messageType: .keepAlive)
        return send(.inboundKeepAliveMessage(msg))
    }

    @discardableResult
    private func sendKeepAlive() -> Bool {
        let msg = InboundKeepAliveMessage(messageType: .keepAlive)
        return send(.inboundKeepAliveMessage(msg))
    }
}
