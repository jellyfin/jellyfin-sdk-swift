//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class GroupUpdate.
public struct StringGroupUpdate: Codable, Hashable {
    /// Gets the update data.
    public var data: String?
    /// Gets the group identifier.
    public var groupID: String?
    /// Gets the update type.
    public var type: GroupUpdateType?

    public init(data: String? = nil, groupID: String? = nil, type: GroupUpdateType? = nil) {
        self.data = data
        self.groupID = groupID
        self.type = type
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.data = try values.decodeIfPresent(String.self, forKey: "Data")
        self.groupID = try values.decodeIfPresent(String.self, forKey: "GroupId")
        self.type = try values.decodeIfPresent(GroupUpdateType.self, forKey: "Type")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(data, forKey: "Data")
        try values.encodeIfPresent(groupID, forKey: "GroupId")
        try values.encodeIfPresent(type, forKey: "Type")
    }
}
