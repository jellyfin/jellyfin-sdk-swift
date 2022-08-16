//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class SetPlaylistItemRequestDto.
public struct SetPlaylistItemRequestDto: Codable {
    /// Gets or sets the playlist identifier of the playing item.
    public var playlistItemID: UUID?

    public init(playlistItemID: UUID? = nil) {
        self.playlistItemID = playlistItemID
    }
}
