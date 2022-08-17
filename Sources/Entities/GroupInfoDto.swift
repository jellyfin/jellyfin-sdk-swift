//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class GroupInfoDto.
public struct GroupInfoDto: Codable {
    /// Gets the group identifier.
    public var groupID: UUID?
    /// Gets the group name.
    public var groupName: String?
    /// Gets the date when this DTO has been created.
    public var lastUpdatedAt: Date?
    /// Gets the participants.
    public var participants: [String]?
    /// Gets the group state.
    public var state: GroupStateType?

    public init(groupID: UUID? = nil, groupName: String? = nil, lastUpdatedAt: Date? = nil, participants: [String]? = nil, state: GroupStateType? = nil) {
        self.groupID = groupID
        self.groupName = groupName
        self.lastUpdatedAt = lastUpdatedAt
        self.participants = participants
        self.state = state
    }
}
