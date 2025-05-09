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
import NIOHTTP1
import NIOWebSocket
import NIOSSL

public final class JellyfinSocket: ObservableObject {

    // MARK: Connection state

    public enum State: Equatable {
        case idle, connecting, connected, reconnecting(attempt: Int), error(String), closed
    }

    @Published public private(set) var state: State = .idle

    /// Inbound-only messages (start/stop) with receipt timestamp.
    public let inboundPublisher = PassthroughSubject<(InboundWebSocketMessage, Date), Never>()
    /// Outbound-type messages from server (e.g. sessionsMessage) with timestamp.
    public let outboundPublisher = PassthroughSubject<(OutboundWebSocketMessage, Date), Never>()

    // MARK: Internals

    private let client: JellyfinClient
    private let group = MultiThreadedEventLoopGroup(numberOfThreads: 1)
    private var channel: Channel?
    private var reconnectAttempts = 0
    private let maxReconnectAttempts = 5
    private var keepAliveTask: Task<Void, Never>?
    var handlers: [(InboundWebSocketMessage) -> Void] = []

    public init(client: JellyfinClient) {
        self.client = client
    }

    // MARK: Public API

    @MainActor
    public func subscribe(only newHandlers: [(InboundWebSocketMessage) -> Void]? = nil) {
        if let h = newHandlers { handlers = h }
        switch state {
        case .idle, .error, .closed:
            connect()
        default:
            break
        }
    }

    @MainActor
    public func disconnect() {
        keepAliveTask?.cancel()
        channel?.close(promise: nil)
        channel = nil
        state = .closed
    }

    public func send(_ msg: OutboundWebSocketMessage) async throws {
        guard let ch = channel else { throw URLError(.notConnectedToInternet) }
        let bytes = try JSONEncoder().encode(msg)
        try await ch.writeAndFlush(
            WebSocketFrame(fin: true, opcode: .text, data: .init(bytes: bytes))
        )
    }

    // MARK: Connect / Reconnect

    private func connect() {
        state = reconnectAttempts == 0 ? .connecting : .reconnecting(attempt: reconnectAttempts)
        let wsURL = websocketURL(from: client.configuration.url)
        let host = wsURL.host ?? "localhost"
        let port = wsURL.port ?? (wsURL.scheme == "wss" ? 443 : 80)
        let useTLS = wsURL.scheme == "wss"

        let upgradePromise = group.next().makePromise(of: Void.self)
        let upgrader = NIOWebSocketClientUpgrader(
            requestKey: randomWebSocketKey(),
            upgradePipelineHandler: { channel, _ in channel.eventLoop.makeSucceededVoidFuture() }
        )
        let upgradeConfig = NIOHTTPClientUpgradeConfiguration(
            upgraders: [upgrader],
            completionHandler: { _ in upgradePromise.succeed(()) }
        )

        func addHTTP(to ch: Channel) -> EventLoopFuture<Void> {
            ch.pipeline.addHTTPClientHandlers(withClientUpgrade: upgradeConfig)
        }

        let bootstrap: ClientBootstrap = {
            if useTLS {
                let ctx = try! NIOSSLContext(configuration: .makeClientConfiguration())
                let handler = try! NIOSSLClientHandler(context: ctx, serverHostname: host)
                return ClientBootstrap(group: group).channelInitializer { ch in
                    ch.pipeline.addHandler(handler).flatMap { addHTTP(to: ch) }
                }
            } else {
                return ClientBootstrap(group: group).channelInitializer(addHTTP)
            }
        }()

        bootstrap.connect(host: host, port: port)
            .flatMap { ch -> EventLoopFuture<Channel> in
                var head = HTTPRequestHead(version: .http1_1, method: .GET, uri: wsURL.path.isEmpty ? "/" : wsURL.path)
                head.headers.add(name: "Host", value: host)
                head.headers.add(name: "Upgrade", value: "websocket")
                head.headers.add(name: "Connection", value: "Upgrade")
                head.headers.add(name: "Sec-WebSocket-Version", value: "13")
                head.headers.add(name: "Sec-WebSocket-Key", value: self.randomWebSocketKey())
                if let token = self.client.accessToken {
                    head.headers.add(name: "Authorization", value: "MediaBrowser Token=\(token)")
                }
                return ch.writeAndFlush(HTTPClientRequestPart.head(head))
                    .flatMap { upgradePromise.futureResult.map { ch } }
            }
            .whenComplete { [weak self] (res: Result<Channel, Error>) in
                guard let self = self else { return }
                switch res {
                case .failure(let err):
                    self.handleError(err.localizedDescription)
                case .success(let ch):
                    self.channel = ch
                    self.state = .connected
                    self.reconnectAttempts = 0
                    self.startReceiving(on: ch)
                }
            }
    }

    fileprivate func handleError(_ reason: String) {
        state = .error(reason)
        guard reconnectAttempts < maxReconnectAttempts else { return }
        reconnectAttempts += 1
        let delay = pow(2.0, Double(reconnectAttempts))
        DispatchQueue.global().asyncAfter(deadline: .now() + delay) { [weak self] in
            self?.connect()
        }
    }

    // MARK: Receiving Loop

    private func startReceiving(on ch: Channel) {
        _ = ch.pipeline.addHandler(ByteToMessageHandler(WebSocketFrameDecoder(maxFrameSize: 1 << 20)))
            .flatMap { _ in ch.pipeline.addHandler(WebSocketFrameEncoder()) }
            .flatMap { _ in ch.pipeline.addHandler(WebSocketInbound(parent: self)) }
            .whenComplete { _ in }

        keepAliveTask?.cancel()
        keepAliveTask = Task.detached { [weak self] in
            while !Task.isCancelled {
                try? await Task.sleep(nanoseconds: 30 * NSEC_PER_SEC)
                try? await self?.send(.outboundKeepAliveMessage(.init()))
            }
        }
    }

    // MARK: Helpers

    private func websocketURL(from base: URL) -> URL {
        var c = URLComponents(url: base, resolvingAgainstBaseURL: false)!
        c.scheme = (c.scheme == "https") ? "wss" : "ws"
        c.path = "/socket"
        return c.url!
    }

    private func randomWebSocketKey() -> String {
        let bytes = (0..<16).map { _ in UInt8.random(in: UInt8.min...UInt8.max) }
        return Data(bytes).base64EncodedString()
    }
}

private final class WebSocketInbound: ChannelInboundHandler {
    typealias InboundIn = WebSocketFrame
    private unowned let parent: JellyfinSocket

    init(parent: JellyfinSocket) { self.parent = parent }

    func channelRead(context: ChannelHandlerContext, data: NIOAny) {
        let frame = unwrapInboundIn(data)
        guard case .text = frame.opcode,
              let text = frame.unmaskedData.getString(at: 0, length: frame.unmaskedData.readableBytes)
        else { return }

        if let wrapper = try? JSONDecoder().decode(WebSocketMessage.self, from: Data(text.utf8)) {
            let now = Date()
            switch wrapper {
            case .inboundWebSocketMessage(let inbound):
                parent.inboundPublisher.send((inbound, now))
                parent.handlers.forEach { $0(inbound) }
            case .outboundWebSocketMessage(let outbound):
                parent.outboundPublisher.send((outbound, now))
            }
        }
    }

    func channelInactive(context: ChannelHandlerContext) {
        parent.handleError("Socket closed")
    }
}
