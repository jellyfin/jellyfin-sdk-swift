//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class MovePlaylistItemRequestDto.
public struct MovePlaylistItemRequestDto: Codable, Hashable {
    /// Gets or sets the new position.
    public var newIndex: Int?
    /// Gets or sets the playlist identifier of the item.
    public var playlistItemID: String?

    public init(newIndex: Int? = nil, playlistItemID: String? = nil) {
        self.newIndex = newIndex
        self.playlistItemID = playlistItemID
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.newIndex = try values.decodeIfPresent(Int.self, forKey: "NewIndex")
        self.playlistItemID = try values.decodeIfPresent(String.self, forKey: "PlaylistItemId")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(newIndex, forKey: "NewIndex")
        try values.encodeIfPresent(playlistItemID, forKey: "PlaylistItemId")
    }
}
