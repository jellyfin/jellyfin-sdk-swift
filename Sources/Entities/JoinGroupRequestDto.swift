//
// Swiftfin is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class JoinGroupRequestDto.
public struct JoinGroupRequestDto: Codable {
    /// Gets or sets the group identifier.
    public var groupID: UUID?

    public init(groupID: UUID? = nil) {
        self.groupID = groupID
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.groupID = try values.decodeIfPresent(UUID.self, forKey: "GroupId")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(groupID, forKey: "GroupId")
    }
}
