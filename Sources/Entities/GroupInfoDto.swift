//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class GroupInfoDto.
public struct GroupInfoDto: Codable, Hashable {
    /// Gets the group identifier.
    public var groupID: String?
    /// Gets the group name.
    public var groupName: String?
    /// Gets the date when this DTO has been created.
    public var lastUpdatedAt: Date?
    /// Gets the participants.
    public var participants: [String]?
    /// Gets the group state.
    public var state: GroupStateType?

    public init(
        groupID: String? = nil,
        groupName: String? = nil,
        lastUpdatedAt: Date? = nil,
        participants: [String]? = nil,
        state: GroupStateType? = nil
    ) {
        self.groupID = groupID
        self.groupName = groupName
        self.lastUpdatedAt = lastUpdatedAt
        self.participants = participants
        self.state = state
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.groupID = try values.decodeIfPresent(String.self, forKey: "GroupId")
        self.groupName = try values.decodeIfPresent(String.self, forKey: "GroupName")
        self.lastUpdatedAt = try values.decodeIfPresent(Date.self, forKey: "LastUpdatedAt")
        self.participants = try values.decodeIfPresent([String].self, forKey: "Participants")
        self.state = try values.decodeIfPresent(GroupStateType.self, forKey: "State")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(groupID, forKey: "GroupId")
        try values.encodeIfPresent(groupName, forKey: "GroupName")
        try values.encodeIfPresent(lastUpdatedAt, forKey: "LastUpdatedAt")
        try values.encodeIfPresent(participants, forKey: "Participants")
        try values.encodeIfPresent(state, forKey: "State")
    }
}
