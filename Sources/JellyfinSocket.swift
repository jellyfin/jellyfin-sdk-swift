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
        if let newHandlers = handlers { self.handlers = newHandlers }
        if state == .connected || state == .connecting { return }
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
            print("Cannot send message - socket not connected")
            return false
        }
        
        do {
            let data = try JSONEncoder().encode(message)
            if let text = String(data: data, encoding: .utf8) {
                task.send(.string(text)) { error in
                    if let error = error {
                        print("Failed to send message: \(error)")
                    }
                }
                return true
            }
        } catch {
            print("Failed to encode message: \(error)")
        }
        
        return false
    }
    
    /// Send a raw JSON message to the Jellyfin server.
    ///
    /// This is useful for simple messages like responses that don't need full encoding.
    ///
    /// - Parameter json: The JSON string to send.
    /// - Returns: A boolean indicating whether the message was sent successfully.
    @discardableResult
    public func sendRaw(_ json: String) -> Bool {
        guard state == .connected, let task = task else {
            print("Cannot send message - socket not connected")
            return false
        }
        
        task.send(.string(json)) { error in
            if let error = error {
                print("Failed to send message: \(error)")
            }
        }
        
        return true
    }

    /// Close the socket and stop all retries.
    ///
    /// Cancels any pending reconnection attempts and closes the connection.
    @MainActor
    public func disconnect() {
        reconnectWorkItem?.cancel()
        pingWorkItem?.cancel()
        task?.cancel(with: .goingAway, reason: nil)
        state = .closed
    }

    // MARK: Internal

    /// Opens a WebSocket connection to the Jellyfin server.
    ///
    /// Validates the access token, creates a properly formatted request with authorization,
    /// and initiates the WebSocket connection.
    ///
    /// - Note: This method updates the connection state and resets reconnection attempts on success.
    @MainActor
    private func openSocket() {
        guard let token = client.accessToken else {
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

        // handshake considered connected immediately
        state = .connected
        reconnectAttempts = 0
        
        // Send initial Keep-Alive message
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.sendRaw("""
            {"MessageType":"KeepAlive"}
            """)
        }
    }

    /// Establishes a continuous message receiving loop for the WebSocket.
    ///
    /// Recursively calls itself to maintain an unbroken chain of message handlers,
    /// and initiates reconnection procedures on connection failures.
    private func listen() {
        // Schedule periodic pings to keep the connection alive
        schedulePings()
        
        task?.receive { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(.string(let text)):
                self.process(text)
                self.listen()
            case .success:
                // Ignore .data / pongs
                self.listen()
            case .failure(let error):
                Task { @MainActor in
                    self.state = .error(error.localizedDescription)
                    self.scheduleReconnect()
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
            guard let self = self, self.state == .connected else { return }
            
            print("Sending WebSocket ping")
            
            // Send both a WebSocket ping AND a keep-alive message
            self.task?.sendPing { error in
                if let error = error {
                    print("Ping error: \(error)")
                }
            }
            
            // Also send a Keep-Alive message to ensure the server doesn't time out
            let keepAliveJson = """
            {"MessageType":"KeepAlive"}
            """
            self.sendRaw(keepAliveJson)
            
            // Schedule the next ping
            self.schedulePings()
        }
        
        // Store the work item and schedule it
        pingWorkItem = work
        DispatchQueue.global().asyncAfter(deadline: .now() + 15, execute: work) // Ping every 15 seconds
    }

    /// Processes received WebSocket messages and distributes them to handlers.
    ///
    /// This method handles special message types like ForceKeepAlive and regular KeepAlive messages
    /// and decodes all other messages using the InboundWebSocketMessage enum.
    ///
    /// - Parameter text: The raw string message received from the WebSocket
    private func process(_ text: String) {
        print("WebSocket received: \(text)")
        
        // This handles cases where JSON parsing might fail
        if text.contains("ForceKeepAlive") || text.contains("KeepAlive") {
            let responseJson = """
            {"MessageType":"KeepAliveResponse"}
            """
            print("⚡ Immediate response to keep-alive message")
            sendRaw(responseJson)
        }
        
        guard let data = text.data(using: .utf8) else { return }
        
        // Try to parse the JSON to extract the message type
        if let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
           let messageTypeStr = json["MessageType"] as? String,
           let messageType = SessionMessageType(rawValue: messageTypeStr) {
            
            // Handle ForceKeepAlive specially
            if messageType == .forceKeepAlive {
                // Convert ForceKeepAlive to KeepAlive for processing
                var modifiedJson = json
                modifiedJson["MessageType"] = SessionMessageType.keepAlive.rawValue
                
                if let modifiedData = try? JSONSerialization.data(withJSONObject: modifiedJson),
                   let message = try? JSONDecoder().decode(InboundWebSocketMessage.self, from: modifiedData) {
                    
                    // Process the modified message
                    handlers.forEach { $0(message) }
                    inboundSubject.send(message)
                    return
                }
            }
        }
        
        // Standard decoding path for all other messages
        do {
            let message = try JSONDecoder().decode(InboundWebSocketMessage.self, from: data)
            handlers.forEach { $0(message) }
            inboundSubject.send(message)
        } catch {
            print("Failed to decode WebSocket message: \(error)")
            print("Message content: \(text)")
        }
    }

    /// Schedules a reconnection attempt with exponential backoff.
    ///
    /// - Note: The delay between attempts doubles with each try, following the formula 2^(attemptNumber).
    @MainActor
    private func scheduleReconnect() {
        guard reconnectAttempts < maxReconnectAttempts else {
            state = .error("Max reconnect attempts hit")
            return
        }

        reconnectAttempts += 1
        let delay = Double(pow(2.0, Double(reconnectAttempts)))

        reconnectWorkItem?.cancel()
        let work = DispatchWorkItem { [weak self] in
            self?.openSocket()
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
}
