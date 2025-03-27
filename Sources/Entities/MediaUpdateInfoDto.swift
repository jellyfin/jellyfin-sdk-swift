//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Media Update Info Dto.
public struct MediaUpdateInfoDto: Codable, Hashable {
    /// Gets or sets the list of updates.
    public var updates: [MediaUpdateInfoPathDto]?

    public init(updates: [MediaUpdateInfoPathDto]? = nil) {
        self.updates = updates
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.updates = try values.decodeIfPresent([MediaUpdateInfoPathDto].self, forKey: "Updates")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(updates, forKey: "Updates")
    }
}
