//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import Foundation
import NIOCore
import NIOPosix

public extension JellyfinClient {

    enum ServerDiscoveryError: Error, Equatable, Sendable {
        case noUsableNetworkInterface
        case noUsableChannel
    }

    /// A response from UDP Jellyfin server discovery.
    struct PublicServer: Codable, Identifiable, Sendable {

        /// The server's ID.
        public let id: String

        /// The server's display name.
        public let name: String

        /// The server's URL.
        public let url: URL

        enum CodingKeys: String, CodingKey {
            case id = "Id"
            case name = "Name"
            case url = "Address"
        }
    }

    private typealias Datagram = AddressedEnvelope<ByteBuffer>

    private static let discoveryPort = 7359
    private static let broadcastAddress = "255.255.255.255"
    private static let payload = "who is JellyfinServer?"

    /// Discovers Jellyfin servers on the local network using UDP broadcast.
    ///
    /// - Parameters:
    ///   - duration: Duration to listen for server responses
    static func discover(duration: Duration = .seconds(5)) -> AsyncThrowingStream<PublicServer, Error> {
        AsyncThrowingStream { continuation in
            let task = Task {
                do {
                    try await Self.run(duration: duration) { response in
                        continuation.yield(response)
                    }
                    continuation.finish()
                } catch is CancellationError {
                    continuation.finish()
                } catch {
                    continuation.finish(throwing: error)
                }
            }

            continuation.onTermination = { _ in
                task.cancel()
            }
        }
    }
}

extension JellyfinClient {

    private struct NetworkInterface: Hashable {
        var name: String
        var index: Int
        var broadcastAddress: SocketAddress
    }

    private static func run(
        duration: Duration,
        onResponse: @Sendable @escaping (PublicServer) -> Void
    ) async throws {
        guard duration > .zero else { return }

        let interfaces = networkInterfaces()

        guard !interfaces.isEmpty else { throw ServerDiscoveryError.noUsableNetworkInterface }

        guard let channel = try? await DatagramBootstrap(group: MultiThreadedEventLoopGroup.singleton)
            .channelOption(.socketOption(.so_reuseaddr), value: 1)
            .channelOption(.socketOption(.so_broadcast), value: 1)
            .bind(host: "0.0.0.0", port: 0, channelInitializer: { channel in
                channel.eventLoop.makeCompletedFuture {
                    try NIOAsyncChannel<Datagram, Datagram>(wrappingChannelSynchronously: channel)
                }
            })
        else {
            throw ServerDiscoveryError.noUsableChannel
        }

        try await channel.executeThenClose { inbound, outbound in
            try await sendProbe(
                outbound: outbound,
                allocator: channel.channel.allocator,
                interfaces: interfaces
            )
            try await readResponses(inbound: inbound, duration: duration, onResponse: onResponse)
        }
    }

    private static func sendProbe(
        outbound: NIOAsyncChannelOutboundWriter<Datagram>,
        allocator: ByteBufferAllocator,
        interfaces: [NetworkInterface]
    ) async throws {
        let targets = try Set(interfaces.map(\.broadcastAddress) + [
            SocketAddress(ipAddress: broadcastAddress, port: discoveryPort),
        ])

        let envelopes = targets.map {
            Datagram(
                remoteAddress: $0,
                data: allocator.buffer(string: payload)
            )
        }

        try await outbound.write(contentsOf: envelopes)
    }

    private static func readResponses(
        inbound: NIOAsyncChannelInboundStream<Datagram>,
        duration: Duration,
        onResponse: @Sendable @escaping (PublicServer) -> Void
    ) async throws {
        try await withThrowingTaskGroup(of: Void.self) { group in
            group.addTask {
                for try await envelope in inbound {
                    if let response = try? JSONDecoder().decode(PublicServer.self, from: Data(envelope.data.readableBytesView)) {
                        onResponse(response)
                    }
                }
            }

            group.addTask {
                try await Task.sleep(for: duration)
            }

            try await group.next()
            group.cancelAll()
        }
    }

    private static func networkInterfaces() -> [NetworkInterface] {
        let devices = (try? System.enumerateDevices()) ?? []

        var interfaces: [String: NetworkInterface] = [:]

        for device in devices {
            guard device.interfaceIndex != 0, !isLoopback(device.address) else { continue }
            guard case .some(.v4) = device.address, let broadcastAddress = device.broadcastAddress else { continue }

            var address = broadcastAddress
            address.port = discoveryPort

            interfaces[device.name] = NetworkInterface(
                name: device.name,
                index: device.interfaceIndex,
                broadcastAddress: address
            )
        }

        return Array(interfaces.values)
    }

    private static func isLoopback(_ address: SocketAddress?) -> Bool {
        guard case let .v4(v4) = address else { return false }

        // 127.0.0.0/8
        return UInt32(bigEndian: v4.address.sin_addr.s_addr) >> 24 == 127
    }
}
