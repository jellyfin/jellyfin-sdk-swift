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
    /// Get music album remote search.
    static func getMusicAlbumRemoteSearchResults(
        _ body: JellyfinAPI
            .AlbumInfoRemoteSearchQuery
    ) -> Request<[JellyfinAPI.RemoteSearchResult]> {
        Request(path: "/Items/RemoteSearch/MusicAlbum", method: "POST", body: body, id: "GetMusicAlbumRemoteSearchResults")
    }
}
