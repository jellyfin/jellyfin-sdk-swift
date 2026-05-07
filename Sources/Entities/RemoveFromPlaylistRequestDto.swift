//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class RemoveFromPlaylistRequestDto.
public struct RemoveFromPlaylistRequestDto: Codable, Hashable, Sendable {
    /// Gets or sets a value indicating whether the playing item should be removed as well. Used only when clearing the playlist.
    public var isClearplayingitem: Bool?
    /// Gets or sets a value indicating whether the entire playlist should be cleared.
    public var isClearplaylist: Bool?
    /// Gets or sets the playlist identifiers of the items. Ignored when clearing the playlist.
    public var playlistItemIDs: [String]?

    public init(isClearplayingitem: Bool? = nil, isClearplaylist: Bool? = nil, playlistItemIDs: [String]? = nil) {
        self.isClearplayingitem = isClearplayingitem
        self.isClearplaylist = isClearplaylist
        self.playlistItemIDs = playlistItemIDs
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.isClearplayingitem = try values.decodeIfPresent(Bool.self, forKey: "ClearPlayingItem")
        self.isClearplaylist = try values.decodeIfPresent(Bool.self, forKey: "ClearPlaylist")
        self.playlistItemIDs = try values.decodeIfPresent([String].self, forKey: "PlaylistItemIds")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(isClearplayingitem, forKey: "ClearPlayingItem")
        try values.encodeIfPresent(isClearplaylist, forKey: "ClearPlaylist")
        try values.encodeIfPresent(playlistItemIDs, forKey: "PlaylistItemIds")
    }
}
