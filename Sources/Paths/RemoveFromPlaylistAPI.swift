//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get
import URLQueryEncoder

extension Paths {
    /// Removes items from a playlist.
    public static func removeFromPlaylist(playlistID: String, entryIDs: [String]? = nil) -> Request<Void> {
        Request(
            method: "DELETE",
            url: "/Playlists/\(playlistID)/Items",
            query: makeRemoveFromPlaylistQuery(entryIDs),
            id: "RemoveFromPlaylist"
        )
    }

    private static func makeRemoveFromPlaylistQuery(_ entryIDs: [String]?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(entryIDs, forKey: "entryIds")
        return encoder.items
    }
}
