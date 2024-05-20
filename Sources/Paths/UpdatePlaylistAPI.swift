//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2024 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get
import URLQueryEncoder

public extension Paths {
    /// Updates a playlist.
    static func updatePlaylist(playlistID: String, _ body: JellyfinAPI.UpdatePlaylistDto) -> Request<Void> {
        Request(path: "/Playlists/\(playlistID)", method: "POST", body: body, id: "UpdatePlaylist")
    }
}
