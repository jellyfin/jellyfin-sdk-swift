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
    
    /// Event loop group for managing asynchronous networking operations
    private let group: EventLoopGroup
    
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

        // Only attempt binding if there are no bound channels.
        // Use reset() before broadcasting to reset your bindings
        if ipv4Channel == nil && ipv6Channel == nil {
            bindChannel()
        }
        
        let payload = "Who is JellyfinServer?"
        let ipv4Sent = sendIPv4(payload: payload)
        let ipv6Sent = sendIPv6(payload: payload)
        
        if ipv4Sent || ipv6Sent {
            stateSubject.send(.active)
            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                print("Discovery window ended")
                self.stateSubject.send(.inactive)
            }
        } else {
            stateSubject.send(.error("No channels ready"))
        }
    }
    
    // MARK: - Channel Binding
    
    /// Create and bind channels if they don't exist
    ///
    /// Attempts to set up both IPv4 and IPv6 channels for discovery.
    /// If binding fails, error information is logged and reported via the state subject.
    private func bindChannel() {
        if ipv4Channel == nil {
            do {
                ipv4Channel = try bindIPv4()
                print("Bound IPv4 UDP to \(ipv4Channel!.localAddress!)")
            } catch {
                print("IPv4 bind error: \(error.localizedDescription)")
                stateSubject.send(.error(error.localizedDescription))
            }
        }
        
        if ipv6Channel == nil {
            do {
                ipv6Channel = try bindIPv6()
                print("Bound IPv6 UDP to \(ipv6Channel!.localAddress!)")
            } catch {
                print("IPv6 bind error: \(error.localizedDescription)")
                if ipv4Channel == nil {
                    stateSubject.send(.error(error.localizedDescription))
                }
            }
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
        guard let (address, scopeId) = Self.getDeviceIPv6Address() else {
            throw NSError(
                domain: NSPOSIXErrorDomain,
                code: Int(ENXIO),
                userInfo: [NSLocalizedDescriptionKey: "No IPv6 address found for this device."]
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
            print("IPv4 broadcast called before channel ready")
            return false
        }

        // Send to global broadcast address for widest coverage
        do {
            let address = try SocketAddress(ipAddress: "255.255.255.255", port: discoveryPort)
            var data = channel.allocator.buffer(capacity: payload.utf8.count)
            data.writeString(payload)

            let promise = channel.eventLoop.makePromise(of: Void.self)
            promise.futureResult.whenFailure { error in
                print("Global broadcast failed: \(error.localizedDescription)")
                self.logDetailedSocketError(error)
            }

            channel.writeAndFlush(AddressedEnvelope(remoteAddress: address, data: data), promise: promise)
            return true
        } catch {
            print("Failed to send global broadcast: \(error.localizedDescription)")
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

        // Use global scope multicast instead of link-local for better compatibility
        let alternateMulticast = "ff0e::1:1000"

        do {
            let address = try SocketAddress(ipAddress: alternateMulticast, port: discoveryPort)
            var data = channel.allocator.buffer(capacity: payload.utf8.count)
            data.writeString(payload)

            let promise = channel.eventLoop.makePromise(of: Void.self)
            promise.futureResult.whenComplete { result in
                switch result {
                case .success:
                    print("Successfully sent IPv6 multicast to \(alternateMulticast)")
                case let .failure(error):
                    print("IPv6 global multicast failed: \(error.localizedDescription)")
                }
            }

            channel.writeAndFlush(AddressedEnvelope(remoteAddress: address, data: data), promise: promise)
            return true
        } catch {
            print("IPv6 multicast setup error: \(error.localizedDescription)")
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
                print("Skipping non-JSON packet")
                return
            }

            let raw = Data(bytes)
            do {
                let response = try JSONDecoder().decode(ServerDiscoveryResponse.self, from: raw)
                print("Decoded server: \(response.name) @ \(response.url) from \(envelope.remoteAddress)")
                DispatchQueue.main.async {
                    parent.discoveredServersPublisher.send(response)
                }
            } catch {
                print("JSON decode failed: \(error.localizedDescription)")
                if let string = String(data: raw, encoding: .utf8) {
                    print("Raw payload: \(string)")
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
            print("Channel error: \(error.localizedDescription)")
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
        var pointer: UnsafeMutablePointer<ifaddrs>?

        defer { pointer.flatMap(freeifaddrs) }

        guard getifaddrs(&pointer) == 0, let first = pointer else { return nil }

        for current in sequence(first: first, next: { $0.pointee.ifa_next }) {
            let flags = Int32(current.pointee.ifa_flags)

            guard flags & IFF_UP != 0, flags & IFF_LOOPBACK == 0 else { continue }
            guard current.pointee.ifa_addr.pointee.sa_family == sa_family_t(AF_INET) else { continue }

            var address = current.pointee.ifa_addr.withMemoryRebound(
                to: sockaddr_in.self, capacity: 1
            ) { $0.pointee.sin_addr }

            var buffer = [CChar](repeating: 0, count: Int(INET_ADDRSTRLEN))
            inet_ntop(AF_INET, &address, &buffer, socklen_t(INET_ADDRSTRLEN))

            return String(cString: buffer)
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
        var pointer: UnsafeMutablePointer<ifaddrs>?
        defer { pointer.flatMap(freeifaddrs) }
        
        guard getifaddrs(&pointer) == 0, let first = pointer else { return nil }
        
        // First try to find a global or ULA address (preferred)
        var fallbackAddress: (String, UInt32)? = nil
        
        for current in sequence(first: first, next: { $0.pointee.ifa_next }) {
            let flags = Int32(current.pointee.ifa_flags)
            
            guard flags & IFF_UP != 0, flags & IFF_LOOPBACK == 0 else { continue }
            guard current.pointee.ifa_addr.pointee.sa_family == sa_family_t(AF_INET6) else { continue }
            
            var socketAddressIPv6 = current.pointee.ifa_addr.withMemoryRebound(
                to: sockaddr_in6.self, capacity: 1
            ) { $0.pointee }
            
            var buffer = [CChar](repeating: 0, count: Int(INET6_ADDRSTRLEN))
            inet_ntop(AF_INET6, &socketAddressIPv6.sin6_addr, &buffer, socklen_t(INET6_ADDRSTRLEN))
            
            let address = String(cString: buffer)
            let name = String(cString: current.pointee.ifa_name)
            let index = if_nametoindex(name)
            
            // Is this a link-local address? (fe80::)
            let isLinkLocal = address.hasPrefix("fe80")
            
            if isLinkLocal {
                // Save as fallback but keep looking for better addresses
                fallbackAddress = (address, UInt32(index))
            } else {
                // If not link-local, return immediately (preferred)
                return (address, UInt32(index))
            }
        }
        
        // Return the fallback link-local address if we found one
        return fallbackAddress
    }
}
