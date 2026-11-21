//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get

extension Paths {
    /// Gets an HLS subtitle playlist.
    public static func getSubtitlePlaylist(
        itemID: String,
        index: Int,
        mediaSourceID: String,
        segmentLength: Int,
        vttTimestampMapMpegts: Int? = nil
    ) -> Request<Data> {
        Request(
            path: "/Videos/\(itemID)/\(mediaSourceID)/Subtitles/\(index)/subtitles.m3u8",
            method: "GET",
            query: makeGetSubtitlePlaylistQuery(segmentLength, vttTimestampMapMpegts),
            id: "GetSubtitlePlaylist"
        )
    }

    private static func makeGetSubtitlePlaylistQuery(_ segmentLength: Int, _ vttTimestampMapMpegts: Int?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(segmentLength, forKey: "segmentLength")
        encoder.encode(vttTimestampMapMpegts, forKey: "vttTimestampMapMpegts")
        return encoder.items
    }
}
