//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Group update without data.
public enum GroupUpdate: Codable, Hashable {
    case groupInfoDtoGroupUpdate(GroupInfoDtoGroupUpdate)
    case groupStateUpdateGroupUpdate(GroupStateUpdateGroupUpdate)
    case stringGroupUpdate(StringGroupUpdate)
    case playQueueUpdateGroupUpdate(PlayQueueUpdateGroupUpdate)

    public init(from decoder: Decoder) throws {

        struct Discriminator: Decodable {
            let __Type: String
        }

        let container = try decoder.singleValueContainer()
        let discriminatorValue = try container.decode(Discriminator.self).__Type

        switch discriminatorValue {
        case "GroupJoined": self = try .groupInfoDtoGroupUpdate(container.decode(GroupInfoDtoGroupUpdate.self))
        case "StateUpdate": self = try .groupStateUpdateGroupUpdate(container.decode(GroupStateUpdateGroupUpdate.self))
        case "GroupDoesNotExist": self = try .stringGroupUpdate(container.decode(StringGroupUpdate.self))
        case "GroupLeft": self = try .stringGroupUpdate(container.decode(StringGroupUpdate.self))
        case "LibraryAccessDenied": self = try .stringGroupUpdate(container.decode(StringGroupUpdate.self))
        case "NotInGroup": self = try .stringGroupUpdate(container.decode(StringGroupUpdate.self))
        case "UserJoined": self = try .stringGroupUpdate(container.decode(StringGroupUpdate.self))
        case "UserLeft": self = try .stringGroupUpdate(container.decode(StringGroupUpdate.self))
        case "PlayQueue": self = try .playQueueUpdateGroupUpdate(container.decode(PlayQueueUpdateGroupUpdate.self))
        default:
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Discriminator value '\(discriminatorValue)' does not match any expected values (GroupJoined, StateUpdate, GroupDoesNotExist, GroupLeft, LibraryAccessDenied, NotInGroup, UserJoined, UserLeft, PlayQueue)."
            )
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .groupInfoDtoGroupUpdate(value): try container.encode(value)
        case let .groupStateUpdateGroupUpdate(value): try container.encode(value)
        case let .stringGroupUpdate(value): try container.encode(value)
        case let .playQueueUpdateGroupUpdate(value): try container.encode(value)
        }
    }
}
