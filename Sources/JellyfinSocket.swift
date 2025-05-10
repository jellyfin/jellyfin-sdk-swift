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
    @Published
    public private(set) var state: State = .idle
    
    /// Timestamp of the last keep-alive message received
    @Published
    public private(set) var lastCheckIn: Date?
    
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
    
    // Message queue for when not connected
    private var messageQueue = [InboundWebSocketMessage]()
    
    // MARK: - Encoder/Decoder
    
    // Use same date formatter as the client
    private lazy var jsonEncoder: JSONEncoder = {
        let isoDateFormatter = OpenISO8601DateFormatter()
        
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .formatted(isoDateFormatter)
        encoder.outputFormatting = .prettyPrinted
        return encoder
    }()
    
    private lazy var jsonDecoder: JSONDecoder = {
        let isoDateFormatter = OpenISO8601DateFormatter()
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(isoDateFormatter)
        return decoder
    }()

    // MARK: Init

    public init(client: JellyfinClient) {
        self.client = client
        
        // Set up state observer to process queued messages
        $state
            .filter { $0 == .connected }
            .sink { [weak self] _ in
                self?.processQueuedMessages()
            }
            .store(in: &cancellables)
    }
    
    deinit {
        stopInternal()
    }

    // MARK: Public API
    
    /// Start the WebSocket connection
    @MainActor
    public func start() {
        guard state == .idle || state == .error("") || state == .closed else { return }
        
        // Reset state and start connection
        reconnectAttempts = 0
        state = .connecting
        
        // Open socket
        openSocket()
    }

    @MainActor
    public func stop() {
        stopInternal()
    }

    /// Stop the WebSocket connection
    private func stopInternal() {
        // Clear message queue when stopping
        messageQueue.removeAll()
        
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
    
    /// Send a specific inbound message to the server.
    /// If not connected, the message will be queued and sent once connected.
    /// - Parameter message: The InboundWebSocketMessage to send
    /// - Returns: True if sent successfully, false if error while sending (but still queued if not connected)
    @discardableResult
    public func send(_ message: InboundWebSocketMessage) -> Bool {

        // If not connected, queue the message
        guard case .connected = state, task != nil else {
            print("[WebSocket] Not connected; queueing message for later")
            messageQueue.append(message)
            return true
        }
        
        // If connected, send immediately
        return sendImmediately(message)
    }
    
    /// Process any queued messages when we connect
    private func processQueuedMessages() {
        guard !messageQueue.isEmpty else { return }
        
        print("[WebSocket] Processing \(messageQueue.count) queued messages")
        
        // Create a copy of the queue
        let queue = messageQueue
        
        // Clear the queue before processing to avoid any re-queuing issues
        messageQueue.removeAll()
        
        // Process each message
        for message in queue {
            print("[WebSocket] Sending queued message: \(message)")
            _ = sendImmediately(message)
        }
    }
    
    /// Send a message immediately without queuing
    @discardableResult
    private func sendImmediately(_ message: InboundWebSocketMessage) -> Bool {
        guard case .connected = state, let task = task else {
            return false
        }
        
        do {
            // Use the client's encoder configuration for consistent formatting
            let data = try jsonEncoder.encode(message)
            guard let text = String(data: data, encoding: .utf8) else {
                print("[WebSocket] Failed to encode message to string")
                return false
            }
            
            print("[WebSocket] Sending: \(text)")
            
            task.send(.string(text)) { error in
                if let e = error { print("[WebSocket] send error: \(e)") }
            }
            return true
        } catch {
            print("[WebSocket] encode error: \(error)")
            return false
        }
    }

    // MARK: Internal Methods

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

        listen()
        scheduleValidationTimeout()
    }

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
                    }
                @unknown default:
                    break
                }
                self.listen()

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
        
        do {
            // Use the consistent jsonDecoder
            let msg = try jsonDecoder.decode(OutboundWebSocketMessage.self, from: data)
            
            // Handle different message types
            switch msg {
            case .forceKeepAliveMessage:
                sendKeepAlive()
                updateLastCheckIn()
                return
                
            case .outboundKeepAliveMessage:
                updateLastCheckIn()
                return
                
            default:
                break
            }

            // Forward all messages to the subject
            outboundSubject.send(msg)
            
        } catch {
            print("[WebSocket] decode failure: \(error) for: \(text)")
        }
    }
    
    private func updateLastCheckIn() {
        DispatchQueue.main.async {
            self.lastCheckIn = Date()
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
            self.openSocket()
        }
        reconnectWorkItem = w
        DispatchQueue.global().asyncAfter(deadline: .now() + delay, execute: w)
    }

    @discardableResult
    private func sendKeepAlive() -> Bool {
        let msg = InboundKeepAliveMessage(messageType: .keepAlive)
        let result = sendImmediately(.inboundKeepAliveMessage(msg))
        if result {
            updateLastCheckIn()
        }
        return result
    }
}
