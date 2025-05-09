//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// A WebSocket manager for receiving real-time Jellyfin server events.
///
/// `JellyfinSocket` manages the lifecycle of a WebSocket connection to the Jellyfin
/// `/socket` endpoint.  It provides state updates and automatic reconnection behavior.
/// Call `subscribe(only:)` to start listening.
public final class JellyfinSocket: ObservableObject {

    /// Connection state.
    ///
    /// Represents the various states the WebSocket connection can be in during its lifecycle.
    public enum State: Equatable {
        /// Socket is unused
        case idle
        
        /// Opening handshake in progress
        case connecting
        
        /// Connection is live
        case connected
        
        /// Attempting to reconnect
        case reconnecting(attempt: Int)
        
        /// Fatal error occurred
        case error(String)
        
        /// User-requested close
        case closed
    }

    /// Published connection state.
    @Published
    public private(set) var state: State = .idle

    /// The path to connect to the WebSocket endpoint
    private let socketPath = "/socket"

    /// Maximum number of reconnection attempts before giving up
    private let maxReconnectAttempts = 5

    /// URL session for WebSocket communication
    private let session = URLSession(configuration: .default)

    /// The authenticated Jellyfin client
    private let client: JellyfinClient

    /// Current WebSocket task
    private var task: URLSessionWebSocketTask?

    /// Count of attempts to reconnect
    private var reconnectAttempts = 0

    /// Dispatch work item for scheduled reconnection
    private var reconnectWorkItem: DispatchWorkItem?

    /// Collection of message handler closures
    private var handlers: [(InboundWebSocketMessage) -> Void] = []

    /// Create a WebSocket manager bound to a `JellyfinClient`.
    ///
    /// - Parameter client: The authenticated HTTP client.
    public init(client: JellyfinClient) {
        self.client = client
    }

    /// Start (or restart) the WebSocket and deliver messages to the supplied handlers.
    ///
    /// - Parameter handlers: 0-n closures that handle each decoded
    ///                       `InboundWebSocketMessage`.  If `nil`, messages are ignored.
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

    /// Close the socket and stop all retries.
    @MainActor
    public func disconnect() {
        reconnectWorkItem?.cancel()
        task?.cancel(with: .goingAway, reason: nil)
        state = .closed
    }

    // MARK: Internal

    /// Opens a WebSocket connection to the Jellyfin server.
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

        task = session.webSocketTask(with: request)
        task?.resume()

        listen()

        // handshake considered connected immediately
        state = .connected
        reconnectAttempts = 0
    }

    /// Listen forever for `.string` messages; reconnect on failure.
    private func listen() {
        task?.receive { [weak self] result in
            guard let self else { return }

            switch result {
            case .success(.string(let text)):
                self.process(text)

                // continue loop
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

    /// Decode JSON → `InboundWebSocketMessage` and fan-out.
    private func process(_ text: String) {
        guard let data = text.data(using: .utf8) else { return }
        if let wrapper = try? JSONDecoder().decode(WebSocketMessage.self, from: data),
           case let .inboundWebSocketMessage(msg) = wrapper {
            handlers.forEach { $0(msg) }
        }
    }

    /// Retry with exponential back-off.
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

    /// Build `ws://` or `wss://` socket URL.
    ///
    /// - Parameter baseURL: The base URL of the Jellyfin server.
    /// - Returns: A properly formatted WebSocket URL.
    private func makeWebSocketURL(from baseURL: URL) -> URL {
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)!
        urlComponents.scheme = urlComponents.scheme == "https" ? "wss" : "ws"
        urlComponents.path = socketPath
        return urlComponents.url!
    }
}
