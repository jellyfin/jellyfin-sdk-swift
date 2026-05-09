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

/// A provider for discovering Jellyfin servers on the local network.
///
/// To start discovery, call `start()`. The `state` variable will be
/// updated to the current discovery state and can be subscribed to
/// with async/await or Combine. See `ServerDiscovery.State` for all
/// possible states. Discovered servers are appended to `responses`
/// as they arrive.
///
/// To stop discovery, typically for user cancellation, call `stop()`.
public final class ServerDiscovery: ObservableObject, @unchecked Sendable {

    // MARK: State

    public enum State: Equatable {

        /// Idle
        case idle
        /// Listening for server responses
        case discovering
        /// An internal error has occurred
        case error(DiscoveryError)
    }

    // MARK: Error

    public enum DiscoveryError: LocalizedError, Equatable {

        /// No network interface with a usable broadcast address was found
        case noUsableNetworkInterface
        /// The discovery socket could not be created
        case noUsableChannel
        /// An other error has occurred, typically a network error
        case other(String)

        var localizedError: String {
            switch self {
            case .noUsableNetworkInterface:
                "No usable network interface"
            case .noUsableChannel:
                "No usable channel"
            case let .other(message):
                message
            }
        }
    }

    // MARK: Response

    /// A response from a Jellyfin server discovery probe.
    public struct Response: Codable, Hashable, Identifiable, Sendable {

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

    /// The current state of the discovery flow.
    @Published
    public private(set) var state: State = .idle

    /// Servers discovered during the current or most recent run.
    @Published
    public private(set) var responses: [Response] = []

    private let duration: TimeInterval

    private var mainTask: Task<Void, Never>?

    /// Creates a manager for performing a Jellyfin server discovery flow.
    public init(duration: TimeInterval = 5) {
        precondition(duration > 0, "Duration must be positive")

        self.duration = duration
    }

    /// Starts the server discovery flow. Resets `responses` to empty.
    @MainActor
    public func start() {
        guard state == .idle else { return }

        responses = []

        mainTask = Task {
            await run()
        }
    }

    /// Stops the current server discovery flow.
    @MainActor
    public func stop() {
        mainTask?.cancel()
        state = .idle
    }

    private func run() async {
        do {
            await MainActor.run {
                state = .discovering
            }

            try await listen { [weak self] response in
                Task { @MainActor in
                    guard let self else { return }
                    if !self.responses.contains(where: { $0.id == response.id }) {
                        self.responses.append(response)
                    }
                }
            }

            await MainActor.run {
                if state == .discovering {
                    state = .idle
                }
            }
        } catch let error as DiscoveryError {
            await MainActor.run {
                state = .error(error)
            }
        } catch is CancellationError {
            // Task was cancelled, not an issue
        } catch {
            await MainActor.run {
                state = .error(.other(error.localizedDescription))
            }
        }
    }

    // MARK: Networking

    private typealias Datagram = AddressedEnvelope<ByteBuffer>
    private typealias AsyncDatagramChannel = NIOAsyncChannel<Datagram, Datagram>

    private static let discoveryPort = 7359
    private static let globalBroadcast = "255.255.255.255"
    private static let payload = "who is JellyfinServer?"

    private struct NetworkInterface: Hashable {
        var name: String
        var index: Int
        var broadcastAddress: SocketAddress
    }

    private func listen(onResponse: @Sendable @escaping (Response) -> Void) async throws {
        let interfaces = Self.networkInterfaces()
        guard !interfaces.isEmpty else { throw DiscoveryError.noUsableNetworkInterface }

        let group = MultiThreadedEventLoopGroup(numberOfThreads: 1)
        do {
            let channel = try await Self.makeChannel(on: group)
            try await channel.executeThenClose { inbound, outbound in
                try await Self.sendProbe(
                    outbound: outbound,
                    allocator: channel.channel.allocator,
                    interfaces: interfaces
                )
                try await Self.readResponses(
                    inbound: inbound,
                    duration: duration,
                    onResponse: onResponse
                )
            }
        } catch {
            await Self.shutdown(group)
            throw error
        }

        await Self.shutdown(group)
    }

    private static func makeChannel(on group: EventLoopGroup) async throws -> AsyncDatagramChannel {
        try await DatagramBootstrap(group: group)
            .channelOption(.socketOption(.so_reuseaddr), value: 1)
            .channelOption(.socketOption(.so_broadcast), value: 1)
            .bind(host: "0.0.0.0", port: 0) { channel in
                channel.eventLoop.makeCompletedFuture {
                    try AsyncDatagramChannel(wrappingChannelSynchronously: channel)
                }
            }
    }

    private static func sendProbe(
        outbound: NIOAsyncChannelOutboundWriter<Datagram>,
        allocator: ByteBufferAllocator,
        interfaces: [NetworkInterface]
    ) async throws {
        let targets = Set(interfaces.map(\.broadcastAddress) + [
            try SocketAddress(ipAddress: globalBroadcast, port: discoveryPort),
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
        duration: TimeInterval,
        onResponse: @Sendable @escaping (Response) -> Void
    ) async throws {
        try await withThrowingTaskGroup(of: Void.self) { group in
            group.addTask {
                for try await envelope in inbound {
                    if let response = decode(envelope.data) {
                        onResponse(response)
                    }
                }
            }

            group.addTask {
                try await sleep(seconds: duration)
            }

            try await group.next()
            group.cancelAll()
        }
    }

    private static func shutdown(_ group: EventLoopGroup) async {
        await withCheckedContinuation { continuation in
            group.shutdownGracefully { _ in
                continuation.resume()
            }
        }
    }

    private static func sleep(seconds: TimeInterval) async throws {
        let nanoseconds = UInt64(min(seconds, TimeInterval(UInt64.max) / 1_000_000_000) * 1_000_000_000)
        try await Task.sleep(nanoseconds: nanoseconds)
    }

    private static func decode(_ buffer: ByteBuffer) -> Response? {
        guard let bytes = buffer.getBytes(at: buffer.readerIndex, length: buffer.readableBytes),
              bytes.first == UInt8(ascii: "{")
        else {
            return nil
        }

        return try? JSONDecoder().decode(Response.self, from: Data(bytes))
    }

    private static func networkInterfaces() -> [NetworkInterface] {
        let devices = (try? System.enumerateDevices()) ?? []
        var interfaces: [String: NetworkInterface] = [:]

        for device in devices {
            guard device.interfaceIndex != 0,
                  device.address?.ipAddress != "127.0.0.1",
                  let broadcast = device.broadcastAddress
            else { continue }

            var address = broadcast
            address.port = discoveryPort

            interfaces[device.name] = NetworkInterface(
                name: device.name,
                index: device.interfaceIndex,
                broadcastAddress: address
            )
        }

        return Array(interfaces.values)
    }
}
