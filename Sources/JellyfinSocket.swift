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

    @Published public private(set) var state: State = .idle
    public var messages: AnyPublisher<OutboundWebSocketMessage, Never> {
        outboundSubject.eraseToAnyPublisher()
    }

    // MARK: Private

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
    private var handlers: [(OutboundWebSocketMessage) -> Void] = []
    private let outboundSubject = PassthroughSubject<OutboundWebSocketMessage, Never>()
    private var stateCancellable: AnyCancellable?

    // MARK: Init

    public init(client: JellyfinClient) {
        self.client = client
    }

    // MARK: Public API

    /// Subscribe to all messages (or install custom handlers).
    /// First call triggers `openSocket()`. Subsequent calls only replace handlers.
    @MainActor
    public func subscribe(only handlers: [(OutboundWebSocketMessage) -> Void]? = nil) {
        if let h = handlers { self.handlers = h }
        guard state == .idle || state == .error("") else { return }

        // When connected, send our initial subscriptions
        stateCancellable?.cancel()
        stateCancellable = $state
            .filter { $0 == .connected }
            .first()
            .sink { [weak self] _ in self?.sendInitialSubscriptions() }

        openSocket()
    }

    /// Filtered Combine publisher.
    @MainActor
    public func subscribe(_ cases: OutboundWebSocketMessage...)
        -> AnyPublisher<OutboundWebSocketMessage, Never>
    {
        subscribe(only: nil)
        guard !cases.isEmpty else { return messages }
        return messages.filter { cases.contains($0) }.eraseToAnyPublisher()
    }

    /// Send an inbound message.
    @discardableResult
    public func send(_ message: InboundWebSocketMessage) -> Bool {
        guard case .connected = state, let task = task else {
            print("[WebSocket] Not connected; cannot send.")
            return false
        }
        do {
            let data = try JSONEncoder().encode(message)
            task.send(.string(String(data: data, encoding: .utf8)!)) { error in
                if let e = error { print("[WebSocket] send error: \(e)") }
            }
            return true
        } catch {
            print("[WebSocket] encode error: \(error)")
            return false
        }
    }

    /// Gracefully close.
    @MainActor
    public func disconnect() {
        stateCancellable?.cancel()
        pingWorkItem?.cancel()
        validationWorkItem?.cancel()
        reconnectWorkItem?.cancel()
        task?.cancel(with: .goingAway, reason: nil)
        state = .closed
    }

    // MARK: Internal

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

        var req = URLRequest(url: comps.url!)
        req.setValue("MediaBrowser Token=\(token)", forHTTPHeaderField: "Authorization")
        task = session.webSocketTask(with: req)
        task?.resume()

        listenLoop()
        scheduleValidationTimeout()
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

        if text.contains("ForceKeepAlive") {
            _ = sendKeepAliveResponse()
        }
        
        guard let data = text.data(using: .utf8) else {
            print("[WebSocket] cannot convert text to data: \(text)")
            return
        }
        
        // Create a properly configured decoder like the one in JellyfinClient
        let decoder = JSONDecoder()
        
        // Set key decoding strategy to convert from server's convention to Swift's
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        // If your API uses ISO dates, add a proper date formatter
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
            // Use the configured decoder instead of default one
            let msg = try decoder.decode(OutboundWebSocketMessage.self, from: data)
            
            handlers.forEach { $0(msg) }
            outboundSubject.send(msg)
        } catch {
            print("[WebSocket] decode failure: \(error) for: \(text)")
            
            // Add detailed error logging
            if let decodingError = error as? DecodingError {
                switch decodingError {
                case .dataCorrupted(let context):
                    print("[WebSocket] Data corrupted: \(context.debugDescription)")
                    print("[WebSocket] Coding path: \(context.codingPath)")
                case .keyNotFound(let key, let context):
                    print("[WebSocket] Key not found: \(key.stringValue) in \(context.debugDescription)")
                    print("[WebSocket] Coding path: \(context.codingPath)")
                case .typeMismatch(let type, let context):
                    print("[WebSocket] Type mismatch: expected \(type) in \(context.debugDescription)")
                    print("[WebSocket] Coding path: \(context.codingPath)")
                case .valueNotFound(let type, let context):
                    print("[WebSocket] Value not found: expected \(type) in \(context.debugDescription)")
                    print("[WebSocket] Coding path: \(context.codingPath)")
                @unknown default:
                    print("[WebSocket] Unknown decoding error: \(decodingError)")
                }
            }
            
            // Try to print what we received to help debugging
            if let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []),
               let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted]),
               let jsonString = String(data: jsonData, encoding: .utf8) {
                print("[WebSocket] Received JSON: \(jsonString)")
            }
        }
    }

    private func handleError(_ description: String) {
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
        let w = DispatchWorkItem { [weak self] in self?.openSocket() }
        reconnectWorkItem = w
        DispatchQueue.global().asyncAfter(deadline: .now() + delay, execute: w)
    }

    /// Sends the correct JSON for each event subscription
    private func sendInitialSubscriptions() {
        let types = SessionMessageType.allCases.filter { $0.rawValue.hasSuffix("Start") }
        for type in types {
            subscribeToEventType(type.rawValue)
        }
    }

    /// Build and send:
    /// { "MessageType":"GeneralCommand", "Data":"<EventName>" }
    private func subscribeToEventType(_ eventType: String) {
        let payload: [String: Any] = [
            "MessageType": "GeneralCommand",
            "Data":        eventType
        ]
        guard let data = try? JSONSerialization.data(withJSONObject: payload),
              let text = String(data: data, encoding: .utf8)
        else {
            print("[WebSocket] Failed to serialize subscribe payload")
            return
        }
        task?.send(.string(text)) { error in
            if let e = error {
                print("[WebSocket] subscribe error: \(e)")
            }
        }
    }

    // MARK: Keep-Alive Helpers

    @discardableResult
    private func sendKeepAliveResponse() -> Bool {
        let msg = InboundKeepAliveMessage(
            messageType: .keepAlive
        )
        return send(.inboundKeepAliveMessage(msg))
    }

    @discardableResult
    private func sendKeepAlive() -> Bool {
        let msg = InboundKeepAliveMessage(
            messageType: .keepAlive
        )
        return send(.inboundKeepAliveMessage(msg))
    }
}
