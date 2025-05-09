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
/// `JellyfinSocket` manages the lifecycle of a WebSocket connection to the Jellyfin
/// `/socket` endpoint. It provides state updates and automatic reconnection behavior.
/// Call `subscribe(only:)` to start listening, or `subscribe(_:)` to get a Combine publisher
/// filtered by specific `InboundWebSocketMessage` cases.
public final class JellyfinSocket: ObservableObject {
    // MARK: State

    /// Connection state.
    ///
    /// Represents the various states the WebSocket connection can be in during its lifecycle.
    public enum State: Equatable {
        /// Socket is inactive and not attempting to connect
        case idle
        
        /// Socket is in the process of establishing initial connection
        case connecting
        
        /// Socket has an active connection to the server
        case connected
        
        /// Connection was lost and socket is attempting to reconnect
        case reconnecting(attempt: Int)
        
        /// Socket encountered an error that prevented normal operation
        case error(String)
        
        /// Socket was deliberately closed by user request
        case closed
    }

    /// Published connection state.
    ///
    /// This property is published to allow SwiftUI views to react to connection state changes.
    @Published public private(set) var state: State = .idle

    // MARK: Constants

    /// The endpoint path for WebSocket connections
    private let socketPath = "/socket"
    
    /// Maximum number of reconnection attempts before giving up
    private let maxReconnectAttempts = 5
    
    /// URL session used for WebSocket communication
    private let session = URLSession(configuration: .default)
    
    /// Ping interval in seconds
    private let pingInterval: TimeInterval = 15
    
    /// Connection validation timeout in seconds
    private let connectionValidationTimeout: TimeInterval = 5

    // MARK: Internal storage

    /// The authenticated Jellyfin client instance
    private let client: JellyfinClient
    
    /// Current active WebSocket task
    private var task: URLSessionWebSocketTask?
    
    /// Number of reconnection attempts that have been made
    private var reconnectAttempts = 0
    
    /// Work item for scheduled ping
    private var pingWorkItem: DispatchWorkItem?

    /// Work item for scheduled reconnection attempts
    private var reconnectWorkItem: DispatchWorkItem?
    
    /// Work item for connection validation timeout
    private var validationTimeoutWorkItem: DispatchWorkItem?
    
    /// Flag to track if we've received at least one successful message
    private var hasReceivedMessage = false
    
    /// Collection of message handler closures to be called when messages are received
    private var handlers: [(InboundWebSocketMessage) -> Void] = []

    /// Subject to publish **all** inbound messages for Combine subscribers
    private let inboundSubject = PassthroughSubject<InboundWebSocketMessage, Never>()
    
    /// Public publisher of all inbound messages
    public var messages: AnyPublisher<InboundWebSocketMessage, Never> {
        inboundSubject.eraseToAnyPublisher()
    }

    // MARK: Init

    /// Create a WebSocket manager bound to a `JellyfinClient`.
    ///
    /// - Parameter client: The authenticated HTTP client.
    public init(client: JellyfinClient) {
        self.client = client
    }

    // MARK: Public API

    /// Start (or restart) the WebSocket and deliver messages to the supplied handlers.
    ///
    /// - Parameter handlers: 0-n closures that handle each decoded
    ///                       `InboundWebSocketMessage`. If `nil`, messages are ignored.
    ///
    /// - Important: Subsequent calls while `.connected`/`.connecting`
    ///              simply add/replace handlers; they don't create
    ///              multiple socket connections.
    @MainActor
    public func subscribe(only handlers: [(InboundWebSocketMessage) -> Void]? = nil) {
        if let newHandlers = handlers {
            self.handlers = newHandlers
        }
        
        if state == .connected || state == .connecting {
            return
        }
        
        openSocket()
    }

    /// Subscribe to **only** the given inbound enum cases. If you pass no arguments,
    /// you'll receive all messages.
    ///
    /// - Parameter cases: A variadic list of `InboundWebSocketMessage` cases to filter by.
    ///                    If empty, you get every message.
    @MainActor
    public func subscribe(_ cases: InboundWebSocketMessage...)
        -> AnyPublisher<InboundWebSocketMessage, Never>
    {
        // ensure the socket is running
        subscribe(only: nil)

        // no filters? forward everything
        guard !cases.isEmpty else {
            return messages
        }

        // otherwise only forward matching cases
        return messages
            .filter { cases.contains($0) }
            .eraseToAnyPublisher()
    }
    
    /// Send an outbound message to the Jellyfin server.
    ///
    /// - Parameter message: The `OutboundWebSocketMessage` to send.
    /// - Returns: A boolean indicating whether the message was sent successfully.
    @discardableResult
    public func send(_ message: OutboundWebSocketMessage) -> Bool {
        guard state == .connected, let task = task else {
            print("[WebSocket] Cannot send message - socket not connected (current state: \(state))")
            return false
        }
        
        do {
            let data = try JSONEncoder().encode(message)
            if let text = String(data: data, encoding: .utf8) {
                task.send(.string(text)) { error in
                    if let error = error {
                        print("[WebSocket] Failed to send message: \(error)")
                    }
                }
                
                return true
            }
        } catch {
            print("[WebSocket] Failed to encode message: \(error)")
        }
        
        return false
    }
    
    /// Send a keep-alive response to the server.
    ///
    /// - Returns: A boolean indicating whether the message was sent successfully.
    @discardableResult
    public func sendKeepAliveResponse() -> Bool {
        let message = OutboundKeepAliveMessage(
            messageID: UUID().uuidString.lowercased().replacingOccurrences(of: "-", with: ""),
            messageType: .keepAlive
        )
        
        let outboundMessage = OutboundWebSocketMessage.outboundKeepAliveMessage(message)
        return send(outboundMessage)
    }
    
    /// Send a keep-alive message to the server.
    ///
    /// - Returns: A boolean indicating whether the message was sent successfully.
    @discardableResult
    public func sendKeepAlive() -> Bool {
        let message = OutboundKeepAliveMessage(
            messageID: UUID().uuidString.lowercased().replacingOccurrences(of: "-", with: ""),
            messageType: .keepAlive
        )
        
        let outboundMessage = OutboundWebSocketMessage.outboundKeepAliveMessage(message)
        return send(outboundMessage)
    }

    /// Close the socket and stop all retries.
    ///
    /// Cancels any pending reconnection attempts and closes the connection.
    @MainActor
    public func disconnect() {
        print("[WebSocket] Disconnecting")
        
        reconnectWorkItem?.cancel()
        pingWorkItem?.cancel()
        validationTimeoutWorkItem?.cancel()
        task?.cancel(with: .goingAway, reason: nil)
        hasReceivedMessage = false
        state = .closed
    }

    // MARK: Internal

    /// Opens a WebSocket connection to the Jellyfin server.
    ///
    /// Validates the access token, creates a properly formatted request with authorization,
    /// and initiates the WebSocket connection.
    ///
    /// - Note: This method updates the connection state and sets up connection validation.
    @MainActor
    private func openSocket() {
        print("[WebSocket] Opening connection")
        
        // Cancel any existing connection validation timeout
        validationTimeoutWorkItem?.cancel()
        
        guard let token = client.accessToken else {
            print("[WebSocket] Missing access token")
            state = .error("Missing access token")
            return
        }

        state = reconnectAttempts == 0 ? .connecting : .reconnecting(attempt: reconnectAttempts)

        let webSocketURL = makeWebSocketURL(from: client.configuration.url)
        
        var request = URLRequest(url: webSocketURL)
        request.setValue("MediaBrowser Token=\(token)", forHTTPHeaderField: "Authorization")
        request.setValue("jellyfin-sdk-swift", forHTTPHeaderField: "User-Agent")
        request.setValue("keep-alive, upgrade", forHTTPHeaderField: "Connection")
        request.setValue("websocket", forHTTPHeaderField: "Upgrade")
        request.timeoutInterval = 60

        task = session.webSocketTask(with: request)
        task?.resume()

        listen()
        
        // Set up a timeout for connection validation
        let timeoutWork = DispatchWorkItem { [weak self] in
            guard let self = self else {
                return
            }
            
            Task { @MainActor in
                if self.state == .connecting || (self.state == .reconnecting(attempt: self.reconnectAttempts) && !self.hasReceivedMessage) {
                    print("[WebSocket] Connection validation timeout")
                    self.state = .error("Connection validation timeout")
                    self.scheduleReconnect()
                }
            }
        }
        
        validationTimeoutWorkItem = timeoutWork
        DispatchQueue.global().asyncAfter(deadline: .now() + connectionValidationTimeout, execute: timeoutWork)
    }

    /// Establishes a continuous message receiving loop for the WebSocket.
    ///
    /// Recursively calls itself to maintain an unbroken chain of message handlers,
    /// and initiates reconnection procedures on connection failures.
    private func listen() {
        task?.receive { [weak self] result in
            guard let self = self else {
                return
            }

            switch result {
            case .success(.string(let text)):
                // First successful message confirms the connection
                self.hasReceivedMessage = true
                
                Task { @MainActor in
                    if self.state == .connecting || self.state == .reconnecting(attempt: self.reconnectAttempts) {
                        self.validationTimeoutWorkItem?.cancel()
                        self.state = .connected
                        self.reconnectAttempts = 0
                        
                        print("[WebSocket] Connection established")
                        
                        // Start ping scheduling
                        self.schedulePings()
                    }
                }
                
                self.process(text)
                self.listen() // Continue listening
                
            case .success:
                self.listen() // Continue listening
                
            case .failure(let error):
                print("[WebSocket] Receive error: \(error.localizedDescription)")
                
                Task { @MainActor in
                    if self.state == .connected || self.state == .connecting || self.state == .reconnecting(attempt: self.reconnectAttempts) {
                        self.state = .error(error.localizedDescription)
                        self.scheduleReconnect()
                    }
                }
            }
        }
    }

    /// Schedules periodic pings to keep the connection alive
    private func schedulePings() {
        // Cancel any existing ping timer
        pingWorkItem?.cancel()
        
        // Create a new work item for the ping
        let work = DispatchWorkItem { [weak self] in
            guard let self = self, self.state == .connected else {
                return
            }
            
            // Send both a WebSocket ping AND a keep-alive message
            self.task?.sendPing { [weak self] error in
                if let error = error {
                    print("[WebSocket] Ping error: \(error)")
                    
                    // Handle ping failure as a connection issue
                    Task { @MainActor [weak self] in
                        guard let self = self else {
                            return
                        }
                        
                        if self.state == .connected {
                            print("[WebSocket] Ping failure indicates connection problem")
                            self.state = .error("Ping failed: \(error.localizedDescription)")
                            self.scheduleReconnect()
                        }
                    }
                }
            }
            
            // Also send a Keep-Alive message using the proper type
            let keepAliveSent = self.sendKeepAlive()
            
            // Only schedule the next ping if this one was successful
            if keepAliveSent {
                self.schedulePings()
            }
        }
        
        // Store the work item and schedule it
        pingWorkItem = work
        DispatchQueue.global().asyncAfter(deadline: .now() + pingInterval, execute: work)
    }

    /// Processes received WebSocket messages and distributes them to handlers.
    ///
    /// This method attempts to decode the message using the InboundWebSocketMessage enum
    /// and handles the special case of ForceKeepAlive messages.
    ///
    /// - Parameter text: The raw string message received from the WebSocket
    private func process(_ text: String) {
        guard let data = text.data(using: .utf8) else {
            print("[WebSocket] Failed to convert text to data")
            return
        }
        
        // First, try to determine if this is a ForceKeepAlive message that needs special handling
        if text.contains("ForceKeepAlive") {
            // Send a KeepAliveResponse immediately
            sendKeepAliveResponse()
            
            // Try to extract the message data and convert to a normal KeepAlive message
            if let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any] {
                var modifiedJson = json
                modifiedJson["MessageType"] = "KeepAlive"
                
                if let modifiedData = try? JSONSerialization.data(withJSONObject: modifiedJson) {
                    do {
                        let message = try JSONDecoder().decode(InboundWebSocketMessage.self, from: modifiedData)
                        handlers.forEach { $0(message) }
                        inboundSubject.send(message)
                        return
                    } catch {
                        print("[WebSocket] Failed to decode converted ForceKeepAlive message: \(error)")
                    }
                }
            }
        } else if text.contains("KeepAlive") && !text.contains("KeepAliveResponse") {
            // Handle regular KeepAlive messages
            _ = sendKeepAliveResponse()
        }
        
        // Now try to decode the message normally
        do {
            let message = try JSONDecoder().decode(InboundWebSocketMessage.self, from: data)
            handlers.forEach { $0(message) }
            inboundSubject.send(message)
        } catch {
            print("[WebSocket] Failed to decode message: \(error)")
            print("[WebSocket] Message content: \(text)")
        }
    }

    /// Schedules a reconnection attempt with exponential backoff.
    ///
    /// - Note: The delay between attempts doubles with each try, following the formula 2^(attemptNumber).
    @MainActor
    private func scheduleReconnect() {
        guard reconnectAttempts < maxReconnectAttempts else {
            print("[WebSocket] Max reconnect attempts reached (\(maxReconnectAttempts))")
            state = .error("Max reconnect attempts hit")
            return
        }

        reconnectAttempts += 1
        let delay = Double(pow(2.0, Double(reconnectAttempts)))
        
        print("[WebSocket] Scheduling reconnection attempt \(reconnectAttempts) in \(delay) seconds")

        reconnectWorkItem?.cancel()
        let work = DispatchWorkItem { [weak self] in
            guard let self = self else {
                return
            }
            
            self.openSocket()
        }
        
        reconnectWorkItem = work
        DispatchQueue.global().asyncAfter(deadline: .now() + delay, execute: work)
    }

    /// Builds a WebSocket URL from a base HTTP URL.
    ///
    /// Converts http:// to ws:// and https:// to wss:// while appending the socket path.
    ///
    /// - Parameter baseURL: The base URL of the Jellyfin server
    /// - Returns: A properly formatted WebSocket URL
    private func makeWebSocketURL(from baseURL: URL) -> URL {
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)!
        urlComponents.scheme = urlComponents.scheme == "https" ? "wss" : "ws"
        urlComponents.path = socketPath
        return urlComponents.url!
    }
    
    /// Validates if the connection is still active by sending a test ping.
    ///
    /// - Returns: A publisher that emits a Boolean indicating whether the connection is valid.
    private func validateConnection() -> AnyPublisher<Bool, Never> {
        let subject = PassthroughSubject<Bool, Never>()
        
        guard let task = task, state == .connected else {
            print("[WebSocket] Cannot validate - socket not connected")
            subject.send(false)
            subject.send(completion: .finished)
            return subject.eraseToAnyPublisher()
        }
        
        task.sendPing { error in
            if let error = error {
                print("[WebSocket] Connection validation failed: \(error)")
                subject.send(false)
            } else {
                subject.send(true)
            }
            
            subject.send(completion: .finished)
        }
        
        return subject.eraseToAnyPublisher()
    }
}
