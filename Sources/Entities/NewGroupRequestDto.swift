//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class NewGroupRequestDto.
public struct NewGroupRequestDto: Codable, Hashable {
    /// Gets or sets the group name.
    public var groupName: String?

    public init(groupName: String? = nil) {
        self.groupName = groupName
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.groupName = try values.decodeIfPresent(String.self, forKey: "GroupName")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(groupName, forKey: "GroupName")
    }
}
