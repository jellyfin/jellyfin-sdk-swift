//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Combine
import Foundation
import NIO
import NIOCore
import NIOPosix
import NIOConcurrencyHelpers
import NIOHTTP1
import NIOWebSocket
import NIOSSL
import NIOFoundationCompat
import NIOExtras
import NIOTransportServices

/// A WebSocket manager for receiving real-time Jellyfin server events.
/// Uses Swift NIO for WebSocket communication.
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

    private var channel: Channel?
    private var eventLoopGroup: EventLoopGroup?
    private var reconnectAttempts = 0
    private var hasReceivedFirstMessage = false

    private var pingTask: Scheduled<Void>?
    private var validationTask: Scheduled<Void>?
    private var reconnectTask: Scheduled<Void>?

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
        
        pingTask?.cancel()
        validationTask?.cancel()
        reconnectTask?.cancel()
        
        let closePromise = channel?.close()
        closePromise?.whenComplete { _ in
            self.channel = nil
        }
        
        eventLoopGroup?.shutdownGracefully { _ in
            self.eventLoopGroup = nil
        }
        
        // Update state on main thread since it's a published property
        DispatchQueue.main.async {
            self.state = .closed
        }
        
        cancellables.removeAll()
    }
    
    /// Send a specific inbound message to the server.
    /// If not connected, the message will be queued and sent once connected.
    /// - Parameter message: The InboundWebSocketMessage to send
    /// - Returns: True if sent successfully, false if error while sending (but still queued if not connected)
    @discardableResult
    public func send(_ message: InboundWebSocketMessage) -> Bool {
        // If not connected, queue the message
        guard case .connected = state, channel?.isActive == true else {
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
        guard case .connected = state, let channel = channel, channel.isActive else {
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
            
            let buffer = ByteBuffer(string: text)
            let webSocketFrame = WebSocketFrame(fin: true, opcode: .text, data: buffer)
            
            channel.writeAndFlush(webSocketFrame).whenFailure { error in
                print("[WebSocket] send error: \(error)")
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
        let isSecure = comps.scheme == "https"
        comps.scheme = isSecure ? "wss" : "ws"
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
        
        guard let url = comps.url, let host = url.host else {
            state = .error("Invalid URL")
            return
        }
        
        // Initialize NIO EventLoopGroup if needed
        if eventLoopGroup == nil {
            eventLoopGroup = MultiThreadedEventLoopGroup(numberOfThreads: 1)
        }
        
        guard let eventLoopGroup = eventLoopGroup else {
            state = .error("Failed to create event loop group")
            return
        }
        
        // Simple approach using WebSocketClient from swift-nio-extras
        // But we'll implement manually using the standard NIO components
        let port = url.port ?? (isSecure ? 443 : 80)
        
        // Create WebSocket connection
        do {
            // Create the WebSocket handler
            let webSocketHandler = WebSocketHandler(socket: self)
            
            // Create a random WebSocket key
            let webSocketKey = generateWebSocketKey()
            
            // Create request headers
            var headers = HTTPHeaders()
            headers.add(name: "Host", value: host)
            headers.add(name: "Authorization", value: "MediaBrowser Token=\(token)")
            headers.add(name: "Connection", value: "Upgrade")
            headers.add(name: "Upgrade", value: "websocket")
            headers.add(name: "Sec-WebSocket-Version", value: "13")
            headers.add(name: "Sec-WebSocket-Key", value: webSocketKey)
            
            // Path and query
            let path = url.path + (url.query.map { "?\($0)" } ?? "")
            
            // Create bootstrap
            let bootstrap = ClientBootstrap(group: eventLoopGroup)
                .channelOption(ChannelOptions.socket(SocketOptionLevel(SOL_SOCKET), SO_REUSEADDR), value: 1)
            
            // Configure the channel pipeline
            if isSecure {
                let tlsConfig = TLSConfiguration.makeClientConfiguration()
                let sslContext = try NIOSSLContext(configuration: tlsConfig)
                
                let channelFuture = bootstrap
                    .channelInitializer { channel in
                        let sslHandler = try! NIOSSLClientHandler(context: sslContext, serverHostname: host)
                        
                        return channel.pipeline.addHandler(sslHandler)
                            .flatMap {
                                return channel.pipeline.addHandler(HTTPRequestEncoder())
                            }.flatMap {
                                return channel.pipeline.addHandler(ByteToMessageHandler(HTTPResponseDecoder()))
                            }.flatMap {
                                return channel.pipeline.addHandler(WebSocketUpgradeHandler(webSocketKey: webSocketKey, headers: headers, path: path))
                            }.flatMap {
                                return channel.pipeline.addHandler(webSocketHandler)
                            }
                    }
                    .connect(host: host, port: port)
                
                channelFuture.whenSuccess { channel in
                    self.channel = channel
                    self.scheduleValidationTimeout()
                }
                
                channelFuture.whenFailure { error in
                    self.handleError("Connection error: \(error)")
                }
            } else {
                let channelFuture = bootstrap
                    .channelInitializer { channel in
                        return channel.pipeline.addHandler(HTTPRequestEncoder())
                            .flatMap {
                                return channel.pipeline.addHandler(ByteToMessageHandler(HTTPResponseDecoder()))
                            }.flatMap {
                                return channel.pipeline.addHandler(WebSocketUpgradeHandler(webSocketKey: webSocketKey, headers: headers, path: path))
                            }.flatMap {
                                return channel.pipeline.addHandler(webSocketHandler)
                            }
                    }
                    .connect(host: host, port: port)
                
                channelFuture.whenSuccess { channel in
                    self.channel = channel
                    self.scheduleValidationTimeout()
                }
                
                channelFuture.whenFailure { error in
                    self.handleError("Connection error: \(error)")
                }
            }
        } catch {
            handleError("Failed to setup connection: \(error)")
        }
    }

    private func handleError(_ description: String) {
        print("[WebSocket] Error: \(description)")
        DispatchQueue.main.async {
            self.state = .error(description)
        }
        scheduleReconnect()
    }

    private func scheduleValidationTimeout() {
        validationTask?.cancel()
        
        guard let eventLoop = channel?.eventLoop else { return }
        
        validationTask = eventLoop.scheduleTask(in: .seconds(Int64(validationTimeout))) { [weak self] in
            guard let self = self, !self.hasReceivedFirstMessage else { return }
            self.handleError("Connection timed out")
        }
    }

    private func schedulePings() {
        pingTask?.cancel()
        
        guard let eventLoop = channel?.eventLoop else { return }
        
        pingTask = eventLoop.scheduleTask(in: .seconds(Int64(pingInterval))) { [weak self] in
            guard let self = self, case .connected = self.state else { return }
            
            let pingFrame = WebSocketFrame(fin: true, opcode: .ping, data: ByteBuffer())
            self.channel?.writeAndFlush(pingFrame).whenFailure { error in
                self.handleError("Ping failed: \(error)")
            }
            
            _ = self.sendKeepAlive()
            self.schedulePings()
        }
    }

    private func scheduleReconnect() {
        guard reconnectAttempts < maxReconnectAttempts else {
            DispatchQueue.main.async {
                self.state = .error("Max reconnect attempts reached")
            }
            return
        }
        
        reconnectAttempts += 1
        let delay = pow(2.0, Double(reconnectAttempts))
        reconnectTask?.cancel()
        
        guard let eventLoop = eventLoopGroup?.next() else { return }
        
        reconnectTask = eventLoop.scheduleTask(in: .seconds(Int64(delay))) { [weak self] in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.openSocket()
            }
        }
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
    
    private func updateLastCheckIn() {
        DispatchQueue.main.async {
            self.lastCheckIn = Date()
        }
    }
    
    private func connectionEstablished() {
        hasReceivedFirstMessage = true
        validationTask?.cancel()
        
        DispatchQueue.main.async {
            self.state = .connected
        }
        
        reconnectAttempts = 0
        schedulePings()
    }
    
    private func generateWebSocketKey() -> String {
        let bytes = (0..<16).map { _ in UInt8.random(in: 0...255) }
        return Data(bytes).base64EncodedString()
    }
    
    private func handle(_ text: String) {
        if !hasReceivedFirstMessage {
            connectionEstablished()
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
    
    // MARK: - Helper Classes
    
    // WebSocket Handler
    private class WebSocketHandler: ChannelInboundHandler {
        typealias InboundIn = WebSocketFrame
        typealias OutboundOut = WebSocketFrame
        
        private weak var socket: JellyfinSocket?
        
        init(socket: JellyfinSocket) {
            self.socket = socket
        }
        
        func channelRead(context: ChannelHandlerContext, data: NIOAny) {
            let frame = unwrapInboundIn(data)
            
            switch frame.opcode {
            case .text:
                var data = frame.data
                if let text = data.readString(length: data.readableBytes) {
                    socket?.handle(text)
                }
                
            case .binary:
                var data = frame.data
                if let bytes = data.readBytes(length: data.readableBytes),
                   let text = String(bytes: bytes, encoding: .utf8) {
                    socket?.handle(text)
                }
                
            case .ping:
                let pong = WebSocketFrame(fin: true, opcode: .pong, data: frame.data)
                context.channel.writeAndFlush(pong, promise: nil)
                
            case .connectionClose:
                context.close(promise: nil)
                socket?.handleError("Connection closed by server")
                
            default:
                break
            }
        }
        
        func channelActive(context: ChannelHandlerContext) {
            print("[WebSocket] Connection established")
            socket?.connectionEstablished()
        }
        
        func channelInactive(context: ChannelHandlerContext) {
            print("[WebSocket] Connection closed")
            socket?.handleError("Connection closed")
        }
        
        func errorCaught(context: ChannelHandlerContext, error: Error) {
            print("[WebSocket] Error: \(error)")
            socket?.handleError("WebSocket error: \(error)")
            context.close(promise: nil)
        }
    }
    
    // WebSocket Upgrade Handler
    private class WebSocketUpgradeHandler: ChannelInboundHandler, RemovableChannelHandler {
        typealias InboundIn = HTTPClientResponsePart
        typealias OutboundOut = HTTPClientRequestPart
        
        private let webSocketKey: String
        private let headers: HTTPHeaders
        private let path: String
        private var upgradeComplete = false
        
        init(webSocketKey: String, headers: HTTPHeaders, path: String) {
            self.webSocketKey = webSocketKey
            self.headers = headers
            self.path = path
        }
        
        func channelActive(context: ChannelHandlerContext) {
            // Send the HTTP request to initiate the WebSocket upgrade
            let requestHead = HTTPRequestHead(
                version: .http1_1,
                method: .GET,
                uri: path,
                headers: headers
            )
            
            context.write(self.wrapOutboundOut(.head(requestHead)), promise: nil)
            context.write(self.wrapOutboundOut(.end(nil)), promise: nil)
            context.flush()
        }
        
        func channelRead(context: ChannelHandlerContext, data: NIOAny) {
            if upgradeComplete {
                // Pass through after upgrade
                context.fireChannelRead(data)
                return
            }
            
            let responsePart = self.unwrapInboundIn(data)
            
            switch responsePart {
            case .head(let responseHead):
                if responseHead.status == .switchingProtocols {
                    // Check for the required WebSocket headers
                    let upgradeHeader = responseHead.headers["Upgrade"].first
                    let connectionHeader = responseHead.headers["Connection"].first
                    let acceptHeader = responseHead.headers["Sec-WebSocket-Accept"].first
                    
                    // Validate headers
                    guard let upgradeHeader = upgradeHeader, upgradeHeader.lowercased() == "websocket",
                          let connectionHeader = connectionHeader, connectionHeader.lowercased().contains("upgrade"),
                          acceptHeader != nil else {
                        context.close(promise: nil)
                        return
                    }
                    
                    // Switch to WebSocket protocol
                    upgradeComplete = true
                    
                    // Remove ourselves from the pipeline since our job is done
                    context.pipeline.removeHandler(self, promise: nil)
                    
                    // Add the WebSocket frame encoder/decoder
                    let webSocketFrameEncoder = WebSocketFrameEncoder()
                    let webSocketFrameDecoder = ByteToMessageHandler(WebSocketFrameDecoder())
                    
                    // Add the WebSocket handlers
                    context.pipeline.addHandler(webSocketFrameDecoder, position: .first)
                    context.pipeline.addHandler(webSocketFrameEncoder, position: .after(webSocketFrameDecoder))
                } else {
                    // Upgrade failed
                    context.close(promise: nil)
                }
                
            default:
                break
            }
        }
    }
}

// MARK: - HTTP Client Error

enum HTTPClientError: Error {
    case responseStatusCode(UInt)
    case upgradeError(String)
}
