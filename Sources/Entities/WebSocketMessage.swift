//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Represents the possible websocket types
public enum WebSocketMessage: Codable, Hashable {
    case inboundWebSocketMessage(InboundWebSocketMessage)
    case outboundWebSocketMessage(OutboundWebSocketMessage)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(InboundWebSocketMessage.self) {
            self = .inboundWebSocketMessage(value)
        } else if let value = try? container.decode(OutboundWebSocketMessage.self) {
            self = .outboundWebSocketMessage(value)
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Data could not be decoded as any of the expected types (InboundWebSocketMessage, OutboundWebSocketMessage)."
            )
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .inboundWebSocketMessage(value): try container.encode(value)
        case let .outboundWebSocketMessage(value): try container.encode(value)
        }
    }
}
