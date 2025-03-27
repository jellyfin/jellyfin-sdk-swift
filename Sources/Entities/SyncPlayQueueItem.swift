//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class QueueItem.
public struct SyncPlayQueueItem: Codable, Hashable {
    /// Gets the item identifier.
    public var itemID: String?
    /// Gets the playlist identifier of the item.
    public var playlistItemID: String?

    public init(itemID: String? = nil, playlistItemID: String? = nil) {
        self.itemID = itemID
        self.playlistItemID = playlistItemID
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.itemID = try values.decodeIfPresent(String.self, forKey: "ItemId")
        self.playlistItemID = try values.decodeIfPresent(String.self, forKey: "PlaylistItemId")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(itemID, forKey: "ItemId")
        try values.encodeIfPresent(playlistItemID, forKey: "PlaylistItemId")
    }
}
