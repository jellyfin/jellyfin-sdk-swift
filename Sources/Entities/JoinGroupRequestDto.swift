//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class JoinGroupRequestDto.
public struct JoinGroupRequestDto: Codable, Hashable {
    /// Gets or sets the group identifier.
    public var groupID: String?

    public init(groupID: String? = nil) {
        self.groupID = groupID
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.groupID = try values.decodeIfPresent(String.self, forKey: "GroupId")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(groupID, forKey: "GroupId")
    }
}
