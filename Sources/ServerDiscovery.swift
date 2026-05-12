//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import Foundation
import Network

public extension JellyfinClient {

    enum ServerDiscoveryError: Error, Sendable {
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

    /// Discovers Jellyfin servers on the local network using UDP broadcast.
    ///
    /// - Parameters:
    ///   - duration: Duration to listen for server responses
    static func discover(duration: Duration = .seconds(5)) -> AsyncThrowingStream<PublicServer, Error> {
        AsyncThrowingStream { continuation in
            let task = Task {
                do {
                    guard duration > .zero else {
                        continuation.finish()
                        return
                    }

                    let discovery = try ServerDiscovery(continuation: continuation)
                    
                    defer { discovery.listener.cancel() }

                    let port = try await discovery.discover()

                    try await Task.sleep(for: duration)
                    
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

    private final class ServerDiscovery: @unchecked Sendable {

        let listener: NWListener
        private let queue = DispatchQueue(label: "JellyfinAPI.ServerDiscovery")
        private let decoder = JSONDecoder()
        private let continuation: AsyncThrowingStream<PublicServer, Error>.Continuation

        init(continuation: AsyncThrowingStream<PublicServer, Error>.Continuation) throws {
            self.continuation = continuation
            self.listener = try NWListener(using: Self.parameters(), on: .any)
        }

        func discover() async throws{
            let port: NWEndpoint.Port = try await withCheckedThrowingContinuation { continuation in
                let startup = SingleContinuation(continuation)

                listener.stateUpdateHandler = { [weak self] state in
                    switch state {
                    case .ready:
                        guard let port = self?.listener.port else {
                            startup.resume(throwing: ServerDiscoveryError.noUsableChannel)
                            return
                        }

                        startup.resume(returning: port)
                    case let .failed(error):
                        startup.resume(throwing: error)
                    case .cancelled:
                        startup.resume(throwing: CancellationError())
                    default:
                        break
                    }
                }

                listener.newConnectionHandler = { [weak self] connection in
                    self?.receive(on: connection)
                }

                listener.start(queue: queue)
            }
            
            let parameters = Self.parameters()
            parameters.requiredLocalEndpoint = .hostPort(host: .ipv4(.any), port: port)
            
            let host = ProcessInfo.processInfo.environment["JELLYFIN_DISCOVERY_HOST"] ?? "255.255.255.255"

            let connection = NWConnection(
                host: .init(host),
                port: 7359,
                using: parameters
            )

            defer { connection.cancel() }

            try await connection.start(on: queue)
            try await connection.send("who is JellyfinServer?".data(using: .utf8)!)
        }

        private static func parameters() -> NWParameters {
            let parameters = NWParameters.udp
            parameters.allowLocalEndpointReuse = true
            return parameters
        }

        private func receive(on connection: NWConnection) {
            connection.start(queue: queue)
            receiveNext(on: connection)
        }

        private func receiveNext(on connection: NWConnection) {
            connection.receiveMessage { [weak self] data, _, _, error in
                guard let self, error == nil else { return }

                if let data, let response = try? decoder.decode(PublicServer.self, from: data) {
                    continuation.yield(response)
                }

                receiveNext(on: connection)
            }
        }
    }
}
