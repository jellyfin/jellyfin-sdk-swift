//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import Foundation
import Network

extension NWConnection {

    enum WebSocketError: Error {
        case closed
        case invalidText
        case missingMetadata
    }
    
    convenience init(url: URL, authorizationHeaders: String) {
        let options = NWProtocolWebSocket.Options()

        options.autoReplyPing = true
        options.setAdditionalHeaders([
            ("Authorization", authorizationHeaders),
        ])

        let parameters: NWParameters

        switch url.scheme {
        case "wss":
            parameters = .tls
        default:
            parameters = .tcp
        }

        parameters.defaultProtocolStack.applicationProtocols.insert(options, at: 0)

        self.init(to: .url(url), using: parameters)
    }

    func start(on queue: DispatchQueue) async throws {
        let _: Void = try await withCheckedThrowingContinuation { _continuation in
            let continuation = SingleContinuation(_continuation)

            stateUpdateHandler = { state in
                switch state {
                case .ready:
                    continuation.resume(returning: ())
                case let .failed(error):
                    continuation.resume(throwing: error)
                case .cancelled:
                    continuation.resume(throwing: CancellationError())
                default:
                    break
                }
            }

            start(queue: queue)
        }
    }

    func send(_ content: Data) async throws {
        let _: Void = try await withCheckedThrowingContinuation { continuation in
            send(content: content, completion: .contentProcessed { error in
                if let error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume()
                }
            })
        }
    }

    func sendWebSocketData(_ data: Data) async throws {
        let metadata = NWProtocolWebSocket.Metadata(opcode: .binary)
        let context = NWConnection.ContentContext(
            identifier: "JellyfinAPI.WebSocketMessage",
            metadata: [metadata]
        )

        let _: Void = try await withCheckedThrowingContinuation { continuation in
            send(content: data, contentContext: context, isComplete: true, completion: .contentProcessed { error in
                if let error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume()
                }
            })
        }
    }

    func receiveWebSocketMessage() async throws -> Data? {
        try await withCheckedThrowingContinuation { continuation in
            receiveMessage { data, context, _, error in
                if let error {
                    continuation.resume(throwing: error)
                    return
                }

                guard let metadata = context?.protocolMetadata(definition: NWProtocolWebSocket.definition)
                    as? NWProtocolWebSocket.Metadata
                else {
                    continuation.resume(throwing: WebSocketError.missingMetadata)
                    return
                }

                switch metadata.opcode {
                case .binary:
                    continuation.resume(returning: data)
                case .text:
                    guard let data else {
                        continuation.resume(returning: nil)
                        return
                    }

                    guard let text = String(data: data, encoding: .utf8),
                          let textData = text.data(using: .utf8)
                    else {
                        continuation.resume(throwing: WebSocketError.invalidText)
                        return
                    }

                    continuation.resume(returning: textData)
                case .close:
                    continuation.resume(throwing: WebSocketError.closed)
                default:
                    continuation.resume(returning: nil)
                }
            }
        }
    }
}
