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
    /// Gets an image tiles playlist for trickplay.
    public static func getTrickplayHlsPlaylist(itemID: String, width: Int, mediaSourceID: String? = nil) -> Request<Data> {
        Request(
            path: "/Videos/\(itemID)/Trickplay/\(width)/tiles.m3u8",
            method: "GET",
            query: makeGetTrickplayHlsPlaylistQuery(mediaSourceID),
            id: "GetTrickplayHlsPlaylist"
        )
    }

    private static func makeGetTrickplayHlsPlaylistQuery(_ mediaSourceID: String?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(mediaSourceID, forKey: "mediaSourceId")
        return encoder.items
    }
}
