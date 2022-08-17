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
    /// Gets a music genre, by name.
    static public func getMusicGenre(genreName: String, userID: String? = nil) -> Request<JellyfinAPI.BaseItemDto> {
        Request(method: "GET", url: "/MusicGenres/\(genreName)", query: makeGetMusicGenreQuery(userID), id: "GetMusicGenre")
    }

    private static func makeGetMusicGenreQuery(_ userID: String?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(userID, forKey: "userId")
        return encoder.items
    }
}
