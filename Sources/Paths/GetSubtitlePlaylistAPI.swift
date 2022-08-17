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
    /// Gets an HLS subtitle playlist.
    static public func getSubtitlePlaylist(itemID: String, index: Int, mediaSourceID: String, segmentLength: Int32) -> Request<Data> {
        Request(method: "GET", url: "/Videos/\(itemID)/\(mediaSourceID)/Subtitles/\(index)/subtitles.m3u8", query: makeGetSubtitlePlaylistQuery(segmentLength), id: "GetSubtitlePlaylist")
    }

    private static func makeGetSubtitlePlaylistQuery(_ segmentLength: Int32) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(segmentLength, forKey: "segmentLength")
        return encoder.items
    }
}
