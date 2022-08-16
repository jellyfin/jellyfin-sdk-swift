//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class MovePlaylistItemRequestDto.
public struct MovePlaylistItemRequestDto: Codable {
    /// Gets or sets the new position.
    public var newIndex: Int?
    /// Gets or sets the playlist identifier of the item.
    public var playlistItemID: UUID?

    public init(newIndex: Int? = nil, playlistItemID: UUID? = nil) {
        self.newIndex = newIndex
        self.playlistItemID = playlistItemID
    }
}
