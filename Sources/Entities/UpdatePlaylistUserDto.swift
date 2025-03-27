//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Update existing playlist user dto. Fields set to `null` will not be updated and keep their current values.
public struct UpdatePlaylistUserDto: Codable, Hashable {
    /// Gets or sets a value indicating whether the user can edit the playlist.
    public var canEdit: Bool?

    public init(canEdit: Bool? = nil) {
        self.canEdit = canEdit
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.canEdit = try values.decodeIfPresent(Bool.self, forKey: "CanEdit")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(canEdit, forKey: "CanEdit")
    }
}
