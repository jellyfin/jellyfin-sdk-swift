//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Combine
import Foundation
import NIOCore
import NIOPosix

/// Discovers Jellyfin servers on the local network using UDP broadcast
///
/// Uses both IPv4 and IPv6 to maximize discovery capabilities. The discovery process
/// broadcasts a query packet and listens for responses from Jellyfin servers.
public final class ServerDiscovery: ObservableObject {

    // MARK: - Server Discovery States

    /// Represents the current state of the server discovery process
    public enum State {
        /// No discovery is currently in progress
        case inactive

        /// Discovery is currently in progress and listening for responses
        case active

        /// An error occurred during the discovery process
        case error(String)
    }

    // MARK: - Network Availability

    /// Tracks network protocol availability
    private enum NetworkAvailability {
        /// Network Status is Unknown
        case unknown

        /// Network Status is Available
        case available

        /// Network Status is Unavailable
        case unavailable
    }

    // MARK: - Asynchronous Networking Group

    /// Event loop group for managing asynchronous networking operations
    private let group: EventLoopGroup

    // MARK: - Static Variables

    /// The standard UDP port used by Jellyfin for server discovery
    private let discoveryPort = 7359

    /// The standard IPv6 multicast group for Jellyfin server discovery (link-local scope)
    private let ipv6MulticastGroup = "ff02::1:1000"

    // MARK: - Discovery Properties

    /// Channel used for IPv4 discovery communications
    private var ipv4Channel: Channel?

    /// Channel used for IPv6 discovery communications
    private var ipv6Channel: Channel?

    // MARK: - Discovery Channel Statuses

    /// Cached IPv4 availability status
    private var ipv4Availability: NetworkAvailability = .unknown

    /// Cached IPv6 availability status
    private var ipv6Availability: NetworkAvailability = .unknown

    // MARK: - Published Variables

    /// Publisher that emits server responses as they are discovered
    private let discoveredServersPublisher = PassthroughSubject<ServerDiscoveryResponse, Never>()

    /// Publisher that emits state changes during the discovery process
    private let stateSubject = CurrentValueSubject<State, Never>(.inactive)

    /// Publisher for observing discovered servers
    ///
    /// Subscribe to this publisher to receive notifications when servers are found
    /// during the discovery process. Emissions are delivered on the main thread.
    public var discoveredServers: AnyPublisher<ServerDiscoveryResponse, Never> {
        discoveredServersPublisher
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }

    /// Publisher for observing the current state of the discovery process
    ///
    /// Subscribe to this publisher to be notified of state changes such as when
    /// discovery starts, stops, or encounters errors. Emissions are delivered on the main thread.
    public var state: AnyPublisher<State, Never> {
        stateSubject
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }

    // MARK: - Initializer

    /// Initialize the discovery service and set up network channels
    ///
    /// Creates the event loop group and attempts to bind to available network interfaces.
    /// Does not begin active discovery until `broadcast()` is called.
    public init() {
        group = MultiThreadedEventLoopGroup(numberOfThreads: 1)
        bindChannel()
    }

    // MARK: - Deinitializer

    /// Clean up resources when the object is deallocated
    ///
    /// Properly closes network channels and shuts down the event loop group.
    deinit {
        ipv4Channel?.close(promise: nil)
        ipv6Channel?.close(promise: nil)
        discoveredServersPublisher.send(completion: .finished)
        _ = group.shutdownGracefully { _ in }
    }

    // MARK: - Reset
    
    /// Reset the discovery service by closing and nullifying channels
    ///
    /// This can be called to clean up the current discovery state before starting
    /// a new discovery process.
    public func reset() {
        ipv4Channel?.close(promise: nil)
        ipv6Channel?.close(promise: nil)
        ipv4Channel = nil
        ipv6Channel = nil
        stateSubject.send(.inactive)
    }

    // MARK: - Discovery Orchestration
    
    /// Broadcast discovery messages over IPv4 and IPv6
    ///
    /// Sends UDP broadcast messages to discover Jellyfin servers on the local network.
    /// Updates the state subject to reflect the current discovery status.
    /// Discovery window remains active for 5 seconds.
    public func broadcast(duration: Double = 5) {

        print("Opening Discovery Window")

        /// Only attempt binding if there are no bound channels.
        /// Use reset() before broadcasting to reset your bindings
        if ipv4Channel == nil && ipv6Channel == nil {
            bindChannel()
        }

        let payload = "who is JellyfinServer?"
        let ipv4Sent = sendIPv4(payload: payload)
        let ipv6Sent = sendIPv6(payload: payload)

        if ipv4Sent || ipv6Sent {
            stateSubject.send(.active)

            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                self.stateSubject.send(.inactive)
                print("Closing Discovery Window")
            }
        } else {
            stateSubject.send(.error("No channels ready"))
            print("Failed to Open Discovery Window")
        }
    }
    
    // MARK: - Channel Binding
    
    /// Create and bind channels if they don't exist
    ///
    /// Attempts to set up both IPv4 and IPv6 channels for discovery.
    /// If binding fails, error information is logged and reported via the state subject.
    private func bindChannel() {

        /// IPv4 binding with availability check
        if ipv4Channel == nil && ipv4Availability != .unavailable {
            do {
                ipv4Channel = try bindIPv4()
                ipv4Availability = .available

                if let ipv4LocalAddress = ipv4Channel?.localAddress {
                    print("Successfully Bound IPv4: \(ipv4LocalAddress)")
                } else {
                    print("Successfully Bound IPv4: *Unknown Address*")
                }
            } catch {
                ipv4Availability = .unavailable

                print("Error IPv4 Binding: \(error.localizedDescription)")

                stateSubject.send(.error(error.localizedDescription))
            }
        } else if ipv4Availability == .unavailable {
            print("Skipping IPv4 Binding: Address unavailable for this protocol")
        }

        /// IPv6 binding with availability check
        if ipv6Channel == nil && ipv6Availability != .unavailable {
            do {
                ipv6Channel = try bindIPv6()
                ipv6Availability = .available

                if let ipv6LocalAddress = ipv6Channel?.localAddress {
                    print("Successfully Bound IPv6: \(ipv6LocalAddress)")
                } else {
                    print("Successfully Bound IPv6: *Unknown Address*")
                }
            } catch {
                ipv6Availability = .unavailable

                let errorMessage: String

                /// Improved error handling for IPv6
                if let nioError = error as? IOError {
                    switch nioError.errnoCode {
                    case EADDRNOTAVAIL:
                        errorMessage = "Protocol not available on this system"
                    case EADDRINUSE:
                        errorMessage = "Port \(discoveryPort) already in use"
                    case EACCES, EPERM:
                        errorMessage = "Permission denied - elevated privileges may be required"
                    case ENOPROTOOPT:
                        errorMessage = "Protocol not supported on this device"
                    default:
                        errorMessage = "(\(nioError.errnoCode)) \(error.localizedDescription)"
                    }
                } else {
                    errorMessage = error.localizedDescription
                }

                print("Error IPv6 Binding: \(errorMessage)")

                /// Only send error state if IPv4 also failed
                /// If both bindings failed then there is no binding available
                if ipv4Channel == nil {
                    stateSubject.send(.error(error.localizedDescription))
                }
            }
        } else if ipv6Availability == .unavailable {
            print("Skipping IPv6 Binding: Address unavailable for this protocol")
        }
    }

    // MARK: - Channel Binding - IPv4

    /// Binds a UDP socket for IPv4 discovery
    ///
    /// Creates and configures a datagram channel for IPv4 broadcast communication.
    /// Uses the first available non-loopback IPv4 address, or 0.0.0.0 if none is found.
    ///
    /// - Returns: A configured NIO channel ready for IPv4 communication
    /// - Throws: Errors from NIO if binding fails
    private func bindIPv4() throws -> Channel {

        /// Get device IPv4 - Fallback to binding to all interfaces
        let host = Self.getDeviceIPv4Address() ?? "0.0.0.0"

        let bootstrap = DatagramBootstrap(group: group)
            .channelOption(ChannelOptions.autoRead, value: true)
            .channelOption(ChannelOptions.socketOption(.so_reuseaddr), value: 1)
            .channelOption(ChannelOptions.socketOption(.so_broadcast), value: 1)
            .channelInitializer { $0.pipeline.addHandler(Handler(parent: self)) }

        return try bootstrap.bind(host: host, port: discoveryPort).wait()
    }

    // MARK: - Channel Binding - IPv6

    /// Binds a UDP socket for IPv6 discovery
    ///
    /// Creates and configures a datagram channel for IPv6 multicast communication.
    /// Requires a valid IPv6 address on the device.
    ///
    /// - Returns: A configured NIO channel ready for IPv6 communication
    /// - Throws: NSError if no IPv6 address is available, or NIO errors if binding fails
    private func bindIPv6() throws -> Channel {

        /// Get device IPv6 - Error if unavailable
        guard let (address, scopeId) = Self.getDeviceIPv6Address() else {
            throw NSError(
                domain: NSPOSIXErrorDomain,
                code: Int(ENXIO),
                userInfo: [NSLocalizedDescriptionKey: "Error IPv6 Binding: No address found for this device"]
            )
        }

        let bootstrap = DatagramBootstrap(group: group)
            .channelOption(ChannelOptions.autoRead, value: true)
            .channelOption(ChannelOptions.socketOption(.so_reuseaddr), value: 1)
            .channelOption(ChannelOptions.socketOption(.ipv6_multicast_hops), value: 1)
            .channelOption(ChannelOptions.socketOption(.ip_multicast_if), value: Int32(scopeId))
            .channelInitializer { channel in
                channel.pipeline.addHandler(Handler(parent: self))
            }

        return try bootstrap.bind(host: address, port: discoveryPort).wait()
    }
    
    // MARK: - Discovery Send - IPv4
    
    /// Send discovery message using IPv4 broadcast
    ///
    /// Broadcasts the discovery payload to the global IPv4 broadcast address (255.255.255.255).
    ///
    /// - Parameter payload: The discovery message to broadcast
    /// - Returns: Boolean indicating if the message was successfully sent
    private func sendIPv4(payload: String) -> Bool {

        guard let channel = ipv4Channel else {

            if ipv4Availability != .unavailable {
                print("Error IPv4 Broadcast: Called before channel ready")
            }

            return false
        }

        /// Send to global broadcast address for widest coverage
        do {
            let address = try SocketAddress(ipAddress: "255.255.255.255", port: discoveryPort)
            var data = channel.allocator.buffer(capacity: payload.utf8.count)

            data.writeString(payload)

            let promise = channel.eventLoop.makePromise(of: Void.self)

            promise.futureResult.whenFailure { error in
                print("Error IPv4 Broadcast: Global broadcast failed - \(error.localizedDescription)")
                self.logDetailedSocketError(error)
            }

            channel.writeAndFlush(AddressedEnvelope(remoteAddress: address, data: data), promise: promise)

            return true
        } catch {
            print("Error IPv4 Broadcast: Global broadcast failed - \(error.localizedDescription)")
        }

        return false
    }
    
    // MARK: - Discovery Send - IPv6
    
    /// Send discovery message using IPv6 broadcast
    ///
    /// Sends the discovery payload to an IPv6 global scope multicast address.
    /// Uses ff0e::1:1000 for better compatibility with various network configurations.
    ///
    /// - Parameter payload: The discovery message to broadcast
    /// - Returns: Boolean indicating if the message was successfully sent
    private func sendIPv6(payload: String) -> Bool {

        guard let channel = ipv6Channel else { return false }

        /// Use global scope multicast instead of link-local for better compatibility
        let alternateMulticast = "ff0e::1:1000"

        do {
            let address = try SocketAddress(ipAddress: alternateMulticast, port: discoveryPort)
            var data = channel.allocator.buffer(capacity: payload.utf8.count)

            data.writeString(payload)

            let promise = channel.eventLoop.makePromise(of: Void.self)

            promise.futureResult.whenComplete { result in
                switch result {
                case .success:
                    print("Successful IPv6 Broadcast: Sent Global multicast to \(alternateMulticast)")
                case let .failure(error):
                    print("Error IPv6 Broadcast: Global multicast failed - \(error.localizedDescription)")
                }
            }

            channel.writeAndFlush(AddressedEnvelope(remoteAddress: address, data: data), promise: promise)

            return true
        } catch {
            print("Error IPv6 Broadcast: Global multicast failed - \(error.localizedDescription)")
        }

        return false
    }
    
    // MARK: - Helper Methods
    
    /// Log detailed information about socket errors for diagnosis
    ///
    /// Extracts and logs various error details to help diagnose network issues,
    /// including domain, code, POSIX error description, and underlying errors.
    ///
    /// - Parameter error: The error to log detailed information about
    private func logDetailedSocketError(_ error: Error) {

        let socketError = error as NSError

        print("Socket error details:")
        print("→ Domain: \(socketError.domain)")
        print("→ Code: \(socketError.code)")

        if socketError.domain == NSPOSIXErrorDomain {
            let domainError = socketError.code

            print("→ POSIX error: \(domainError) (\(String(cString: strerror(Int32(domainError)))))")
        }

        if let errorKey = socketError.userInfo[NSUnderlyingErrorKey] as? NSError {
            print("→ Underlying Error: \(errorKey.localizedDescription) (code: \(errorKey.code))")
        }
    }

    // MARK: - Channel Handler

    /// Handler for processing incoming UDP packets
    ///
    /// Processes incoming datagram packets, decodes JSON responses from servers,
    /// and publishes discovered servers to the discovery publisher.
    private final class Handler: ChannelInboundHandler {

        typealias InboundIn = AddressedEnvelope<ByteBuffer>

        private weak var parent: ServerDiscovery?

        /// Initialize the handler with a reference to the parent ServerDiscovery
        ///
        /// - Parameter parent: The ServerDiscovery instance that will receive discovery notifications
        init(parent: ServerDiscovery) {
            self.parent = parent
        }

        /// Process incoming channel data
        ///
        /// Examines incoming UDP packets, filters for JSON data starting with '{',
        /// and attempts to decode them as ServerDiscoveryResponse objects.
        ///
        /// - Parameters:
        ///   - context: The NIO context for the channel event
        ///   - data: The incoming data wrapped in an NIOAny container
        func channelRead(context: ChannelHandlerContext, data: NIOAny) {

            guard let parent = parent else { return }

            let envelope = unwrapInboundIn(data)
            let buffer = envelope.data

            guard let bytes = buffer.getBytes(at: buffer.readerIndex, length: buffer.readableBytes),
                  bytes.first == UInt8(ascii: "{")
            else {
                print("Error Decoding: Skipping non-JSON packet")

                return
            }

            let raw = Data(bytes)

            do {
                let response = try JSONDecoder().decode(ServerDiscoveryResponse.self, from: raw)

                print("Successful Decoding: \(response.name) @ \(response.url) from \(envelope.remoteAddress)")

                DispatchQueue.main.async {
                    parent.discoveredServersPublisher.send(response)
                }
            } catch {
                print("Error Decoding: \(error.localizedDescription)")

                if let string = String(data: raw, encoding: .utf8) {
                    print("Raw Payload:")
                    print(string)
                }
            }
        }

        /// Handle errors on the channel
        ///
        /// Logs errors and closes the channel when errors occur.
        ///
        /// - Parameters:
        ///   - context: The NIO context for the channel event
        ///   - error: The error that occurred
        func errorCaught(context: ChannelHandlerContext, error: Error) {
            print("Error Channel: \(error.localizedDescription)")
            context.close(promise: nil)
        }
    }

    // MARK: - Get Device IPv4

    /// Returns first non-loopback IPv4 address (e.g. "192.168.1.42")
    ///
    /// Searches system network interfaces for the first available IPv4 address
    /// that is active and not a loopback interface.
    ///
    /// - Returns: String representation of IPv4 address, or nil if none found
    /// - Reference: https://github.com/apple/swift-nio/issues/1494
    private static func getDeviceIPv4Address() -> String? {
        var interfaceList: UnsafeMutablePointer<ifaddrs>?

        defer { interfaceList.flatMap(freeifaddrs) }

        guard getifaddrs(&interfaceList) == 0, let firstInterface = interfaceList else { return nil }

        for interface in sequence(first: firstInterface, next: { $0.pointee.ifa_next }) {
            let flags = Int32(interface.pointee.ifa_flags)

            let isInterfaceUp = (flags & IFF_UP) != 0
            let isLoopbackInterface = (flags & IFF_LOOPBACK) != 0
            let isIPv4 = interface.pointee.ifa_addr.pointee.sa_family == sa_family_t(AF_INET)

            guard isInterfaceUp, !isLoopbackInterface, isIPv4 else { continue }

            var ipv4Address = interface.pointee.ifa_addr.withMemoryRebound(
                to: sockaddr_in.self, capacity: 1
            ) { $0.pointee.sin_addr }

            var addressBuffer = [CChar](repeating: 0, count: Int(INET_ADDRSTRLEN))
            inet_ntop(AF_INET, &ipv4Address, &addressBuffer, socklen_t(INET_ADDRSTRLEN))

            return String(cString: addressBuffer)
        }

        return nil
    }

    // MARK: - Get Device IPv6

    /// Returns first non-loopback scoped IPv6 address and its interface index
    ///
    /// Searches system network interfaces for the first available IPv6 address
    /// that is active and not a loopback interface. Returns the address with
    /// interface scope identifier and the interface index.
    ///
    /// - Returns: Tuple containing the scoped IPv6 address and interface index, or nil if none found
    /// - Reference: https://github.com/apple/swift-nio/issues/1494
    private static func getDeviceIPv6Address() -> (String, UInt32)? {
        var interfaceList: UnsafeMutablePointer<ifaddrs>?
        defer { interfaceList.flatMap(freeifaddrs) }

        guard getifaddrs(&interfaceList) == 0, let firstInterface = interfaceList else { return nil }

        /// First try to find a global or ULA address (preferred)
        var fallbackAddress: (String, UInt32)? = nil

        for interface in sequence(first: firstInterface, next: { $0.pointee.ifa_next }) {
            let flags = Int32(interface.pointee.ifa_flags)

            let isInterfaceUp = (flags & IFF_UP) != 0
            let isLoopbackInterface = (flags & IFF_LOOPBACK) != 0
            let isIPv6 = interface.pointee.ifa_addr.pointee.sa_family == sa_family_t(AF_INET6)

            guard isInterfaceUp, !isLoopbackInterface, isIPv6 else { continue }

            var socketAddressIPv6 = interface.pointee.ifa_addr.withMemoryRebound(
                to: sockaddr_in6.self, capacity: 1
            ) { $0.pointee }

            var addressBuffer = [CChar](repeating: 0, count: Int(INET6_ADDRSTRLEN))
            inet_ntop(AF_INET6, &socketAddressIPv6.sin6_addr, &addressBuffer, socklen_t(INET6_ADDRSTRLEN))

            let address = String(cString: addressBuffer)
            let interfaceName = String(cString: interface.pointee.ifa_name)
            let interfaceIndex = if_nametoindex(interfaceName)

            /// Is this a link-local address? (fe80::)
            let isLinkLocal = address.hasPrefix("fe80")

            if isLinkLocal {
                /// Save as fallback but keep looking for better addresses
                fallbackAddress = (address, UInt32(interfaceIndex))
            } else {
                /// If not link-local, return immediately (preferred)
                return (address, UInt32(interfaceIndex))
            }
        }

        /// Return the fallback link-local address if we found one
        return fallbackAddress
    }
    
    // MARK: - Network Availability Info
    
    /// Get information about current network availability
    ///
    /// Returns a tuple indicating IPv4 and IPv6 availability status
    public var networkAvailabilityInfo: (ipv4: Bool, ipv6: Bool) {
        (
            ipv4: ipv4Availability == .available,
            ipv6: ipv6Availability == .available
        )
    }
}
