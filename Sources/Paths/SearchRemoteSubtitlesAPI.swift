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
    /// Search remote subtitles.
    public static func searchRemoteSubtitles(
        itemID: String,
        language: String,
        isPerfectMatch: Bool? = nil
    ) -> Request<[JellyfinAPI.RemoteSubtitleInfo]> {
        Request(
            path: "/Items/\(itemID)/RemoteSearch/Subtitles/\(language)",
            method: "GET",
            query: makeSearchRemoteSubtitlesQuery(isPerfectMatch),
            id: "SearchRemoteSubtitles"
        )
    }

    private static func makeSearchRemoteSubtitlesQuery(_ isPerfectMatch: Bool?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(isPerfectMatch, forKey: "isPerfectMatch")
        return encoder.items
    }
}
