//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get
import URLQueryEncoder

extension Paths {
    /// Adds items to a playlist.
    public static func addToPlaylist(playlistID: String, ids: [String]? = nil, userID: String? = nil) -> Request<Void> {
        Request(path: "/Playlists/\(playlistID)/Items", method: "POST", query: makeAddToPlaylistQuery(ids, userID), id: "AddToPlaylist")
    }

    private static func makeAddToPlaylistQuery(_ ids: [String]?, _ userID: String?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(ids, forKey: "ids")
        encoder.encode(userID, forKey: "userId")
        return encoder.items
    }
}
