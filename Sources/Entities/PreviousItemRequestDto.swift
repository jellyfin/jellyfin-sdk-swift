//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class PreviousItemRequestDto.
public struct PreviousItemRequestDto: Codable, Hashable {
    /// Gets or sets the playing item identifier.
    public var playlistItemID: String?

    public init(playlistItemID: String? = nil) {
        self.playlistItemID = playlistItemID
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.playlistItemID = try values.decodeIfPresent(String.self, forKey: "PlaylistItemId")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(playlistItemID, forKey: "PlaylistItemId")
    }
}
