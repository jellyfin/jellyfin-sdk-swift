//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get
import URLQueryEncoder

extension Paths {
    /// Gets a genre, by name.
    public static func getGenre(genreName: String, userID: String? = nil) -> Request<JellyfinAPI.BaseItemDto> {
        Request(path: "/Genres/\(genreName)", method: "GET", query: makeGetGenreQuery(userID), id: "GetGenre")
    }

    private static func makeGetGenreQuery(_ userID: String?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(userID, forKey: "userId")
        return encoder.items
    }
}
