//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Represents the list of possible group update types
public enum GroupUpdate: Codable, Hashable {
    case syncPlayGroupDoesNotExistUpdate(SyncPlayGroupDoesNotExistUpdate)
    case syncPlayGroupJoinedUpdate(SyncPlayGroupJoinedUpdate)
    case syncPlayGroupLeftUpdate(SyncPlayGroupLeftUpdate)
    case syncPlayLibraryAccessDeniedUpdate(SyncPlayLibraryAccessDeniedUpdate)
    case syncPlayNotInGroupUpdate(SyncPlayNotInGroupUpdate)
    case syncPlayPlayQueueUpdate(SyncPlayPlayQueueUpdate)
    case syncPlayStateUpdate(SyncPlayStateUpdate)
    case syncPlayUserJoinedUpdate(SyncPlayUserJoinedUpdate)
    case syncPlayUserLeftUpdate(SyncPlayUserLeftUpdate)

    public init(from decoder: Decoder) throws {

        struct Discriminator: Decodable {
            let _Type: String
        }

        let container = try decoder.singleValueContainer()
        let discriminatorValue = try container.decode(Discriminator.self)._Type

        switch discriminatorValue {
        case "GroupDoesNotExist": self = try .syncPlayGroupDoesNotExistUpdate(container.decode(SyncPlayGroupDoesNotExistUpdate.self))
        case "GroupJoined": self = try .syncPlayGroupJoinedUpdate(container.decode(SyncPlayGroupJoinedUpdate.self))
        case "GroupLeft": self = try .syncPlayGroupLeftUpdate(container.decode(SyncPlayGroupLeftUpdate.self))
        case "LibraryAccessDenied": self = try .syncPlayLibraryAccessDeniedUpdate(container.decode(SyncPlayLibraryAccessDeniedUpdate.self))
        case "NotInGroup": self = try .syncPlayNotInGroupUpdate(container.decode(SyncPlayNotInGroupUpdate.self))
        case "PlayQueue": self = try .syncPlayPlayQueueUpdate(container.decode(SyncPlayPlayQueueUpdate.self))
        case "StateUpdate": self = try .syncPlayStateUpdate(container.decode(SyncPlayStateUpdate.self))
        case "UserJoined": self = try .syncPlayUserJoinedUpdate(container.decode(SyncPlayUserJoinedUpdate.self))
        case "UserLeft": self = try .syncPlayUserLeftUpdate(container.decode(SyncPlayUserLeftUpdate.self))
        default:
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Discriminator value '\(discriminatorValue)' does not match any expected values (GroupDoesNotExist, GroupJoined, GroupLeft, LibraryAccessDenied, NotInGroup, PlayQueue, StateUpdate, UserJoined, UserLeft)."
            )
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .syncPlayGroupDoesNotExistUpdate(value): try container.encode(value)
        case let .syncPlayGroupJoinedUpdate(value): try container.encode(value)
        case let .syncPlayGroupLeftUpdate(value): try container.encode(value)
        case let .syncPlayLibraryAccessDeniedUpdate(value): try container.encode(value)
        case let .syncPlayNotInGroupUpdate(value): try container.encode(value)
        case let .syncPlayPlayQueueUpdate(value): try container.encode(value)
        case let .syncPlayStateUpdate(value): try container.encode(value)
        case let .syncPlayUserJoinedUpdate(value): try container.encode(value)
        case let .syncPlayUserLeftUpdate(value): try container.encode(value)
        }
    }
}
