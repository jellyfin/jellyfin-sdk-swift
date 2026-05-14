//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Represents the list of possible inbound websocket types
public enum InboundWebSocketMessage: Codable, Hashable, Sendable {
    case activityLogEntryStartMessage(WebSocketDataMessageInfo)
    case activityLogEntryStopMessage(WebSocketMessageTypeInfo)
    case inboundKeepAliveMessage(WebSocketMessageTypeInfo)
    case scheduledTasksInfoStartMessage(WebSocketDataMessageInfo)
    case scheduledTasksInfoStopMessage(WebSocketMessageTypeInfo)
    case sessionsStartMessage(WebSocketDataMessageInfo)
    case sessionsStopMessage(WebSocketMessageTypeInfo)

    public init(from decoder: Decoder) throws {

        struct Discriminator: Decodable {
            let MessageType: String
        }

        let container = try decoder.singleValueContainer()
        let discriminatorValue = try container.decode(Discriminator.self).MessageType

        switch discriminatorValue {
        case "ActivityLogEntryStart": self = try .activityLogEntryStartMessage(container.decode(WebSocketDataMessageInfo.self))
        case "ActivityLogEntryStop": self = try .activityLogEntryStopMessage(container.decode(WebSocketMessageTypeInfo.self))
        case "KeepAlive": self = try .inboundKeepAliveMessage(container.decode(WebSocketMessageTypeInfo.self))
        case "ScheduledTasksInfoStart": self = try .scheduledTasksInfoStartMessage(container.decode(WebSocketDataMessageInfo.self))
        case "ScheduledTasksInfoStop": self = try .scheduledTasksInfoStopMessage(container.decode(WebSocketMessageTypeInfo.self))
        case "SessionsStart": self = try .sessionsStartMessage(container.decode(WebSocketDataMessageInfo.self))
        case "SessionsStop": self = try .sessionsStopMessage(container.decode(WebSocketMessageTypeInfo.self))
        default:
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Discriminator value '\(discriminatorValue)' does not match any expected values (ActivityLogEntryStart, ActivityLogEntryStop, KeepAlive, ScheduledTasksInfoStart, ScheduledTasksInfoStop, SessionsStart, SessionsStop)."
            )
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .activityLogEntryStartMessage(value): try container.encode(value)
        case let .activityLogEntryStopMessage(value): try container.encode(value)
        case let .inboundKeepAliveMessage(value): try container.encode(value)
        case let .scheduledTasksInfoStartMessage(value): try container.encode(value)
        case let .scheduledTasksInfoStopMessage(value): try container.encode(value)
        case let .sessionsStartMessage(value): try container.encode(value)
        case let .sessionsStopMessage(value): try container.encode(value)
        }
    }
}
