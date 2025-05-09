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

    // MARK: State

    public enum State: Equatable {
        case idle, connecting, connected, reconnecting(Int), error(String), closed
    }

    @Published
    public private(set) var state: State = .idle

    /// Combine stream of every inbound message.
    public let inboundMessages = PassthroughSubject<InboundWebSocketMessage, Never>()

    // MARK: Internals

    private let client: JellyfinClient
    private let group  = MultiThreadedEventLoopGroup(numberOfThreads: 1)
    private var channel: Channel?
    private var reconnectAttempts = 0
    private let maxReconnect = 5
    private var keepAliveTask: Task<Void, Never>?

    /// Message handlers provided by the caller via `subscribe(only:)`.
    /// Not `private` so the inbound handler can fan-out safely.
    var handlers: [(InboundWebSocketMessage) -> Void] = []

    public init(client: JellyfinClient) { self.client = client }

    // MARK: Public API

    @MainActor
    public func subscribe(only newHandlers: [(InboundWebSocketMessage) -> Void]? = nil) {
        if let newHandlers { handlers = newHandlers }
        if case .idle = state { connect() }
    }

    @MainActor
    public func disconnect() {
        keepAliveTask?.cancel()
        channel?.close(promise: nil)
        channel = nil
        state = .closed
    }

    public func send(_ msg: OutboundWebSocketMessage) async throws {
        guard let channel else { throw URLError(.notConnectedToInternet) }
        let data = try JSONEncoder().encode(msg)
        try await channel.writeAndFlush(
            WebSocketFrame(fin: true, opcode: .text, data: .init(bytes: data))
        )
    }

    // MARK: Bootstrap

    private func connect() {
        state = .connecting

        let wsURL = websocketURL(from: client.configuration.url)
        let host  = wsURL.host ?? "localhost"
        let port  = wsURL.port ?? (wsURL.scheme == "wss" ? 443 : 80)
        let useTLS = wsURL.scheme == "wss"

        let upgradePromise = group.next().makePromise(of: Void.self)
        let upgrader = NIOWebSocketClientUpgrader(
            requestKey: randomWebSocketKey(),
            upgradePipelineHandler: { channel, _ in
                channel.eventLoop.makeSucceededVoidFuture()
            })

        let upgradeConfig = NIOHTTPClientUpgradeConfiguration(
            upgraders: [upgrader],
            completionHandler: { _ in upgradePromise.succeed(()) }
        )

        func addHTTP(to channel: Channel) -> EventLoopFuture<Void> {
            channel.pipeline.addHTTPClientHandlers(withClientUpgrade: upgradeConfig)
        }

        let bootstrap: ClientBootstrap = {
            if useTLS {
                let ssl = try! NIOSSLContext(configuration: .makeClientConfiguration())
                let tls = try! NIOSSLClientHandler(context: ssl, serverHostname: host)
                return ClientBootstrap(group: group).channelInitializer { ch in
                    ch.pipeline.addHandler(tls).flatMap { addHTTP(to: ch) }
                }
            } else {
                return ClientBootstrap(group: group).channelInitializer(addHTTP)
            }
        }()

        bootstrap.connect(host: host, port: port)
            .flatMap { ch -> EventLoopFuture<Channel> in
                var head = HTTPRequestHead(version: .http1_1,
                                           method: .GET,
                                           uri: wsURL.path.isEmpty ? "/" : wsURL.path)
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
            .whenComplete { [weak self] (result: Result<Channel, Error>) in
                guard let self else { return }
                switch result {
                case .failure(let err):
                    self.reportError(err.localizedDescription)
                case .success(let ch):
                    self.channel = ch
                    self.state   = .connected
                    self.reconnectAttempts = 0
                    self.installHandlers(on: ch)
                }
            }
    }

    private func installHandlers(on ch: Channel) {
        ch.pipeline.addHandler(WebSocketFrameDecoder(maxFrameSize: 1 << 20) as! ChannelHandler)
            .flatMap { ch.pipeline.addHandler(WebSocketFrameEncoder()) }
            .flatMap { ch.pipeline.addHandler(WebSocketInbound(parent: self)) }
            .whenComplete { _ in }

        keepAliveTask?.cancel()
        keepAliveTask = Task.detached { [weak self] in
            while !Task.isCancelled {
                try? await Task.sleep(nanoseconds: 30 * NSEC_PER_SEC)
                try? await self?.send(.outboundKeepAliveMessage(.init()))
            }
        }
    }

    // MARK: Error / reconnect

    fileprivate func reportError(_ reason: String) {
        state = .error(reason)
        guard reconnectAttempts < maxReconnect else { return }
        reconnectAttempts += 1
        let delay = pow(2.0, Double(reconnectAttempts))
        DispatchQueue.global().asyncAfter(deadline: .now() + delay) { [weak self] in
            guard let self else { return }
            self.state = .idle
            self.connect()
        }
    }

    // MARK: Helpers

    private func websocketURL(from base: URL) -> URL {
        var comps = URLComponents(url: base, resolvingAgainstBaseURL: false)!
        comps.scheme = comps.scheme == "https" ? "wss" : "ws"
        comps.path   = "/socket"
        return comps.url!
    }

    private func randomWebSocketKey() -> String {
        let bytes = (0..<16).map { _ in UInt8.random(in: .min ... .max) }
        return Data(bytes).base64EncodedString()
    }
}

// MARK: – Inbound frame handler

private final class WebSocketInbound: ChannelInboundHandler {
    typealias InboundIn = WebSocketFrame

    private unowned let parent: JellyfinSocket
    init(parent: JellyfinSocket) { self.parent = parent }

    func channelRead(context: ChannelHandlerContext, data: NIOAny) {
        let frame = unwrapInboundIn(data)
        guard case .text = frame.opcode else { return }

        if let text = frame.unmaskedData.getString(at: 0,
                                                   length: frame.unmaskedData.readableBytes),
           let msg = try? JSONDecoder().decode(InboundWebSocketMessage.self,
                                               from: Data(text.utf8)) {
            Task { @MainActor in
                parent.inboundMessages.send(msg)
                parent.handlers.forEach { $0(msg) }
            }
            if case .inboundKeepAliveMessage = msg {
                Task { try? await parent.send(.outboundKeepAliveMessage(.init())) }
            }
        }
    }

    func channelInactive(context: ChannelHandlerContext) {
        parent.reportError("Socket closed")
    }
}
