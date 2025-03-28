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
    /// Reports that new movies have been added by an external source.
    public static func postUpdatedMovies(tmdbID: String? = nil, imdbID: String? = nil) -> Request<Void> {
        Request(path: "/Library/Movies/Updated", method: "POST", query: makePostUpdatedMoviesQuery(tmdbID, imdbID), id: "PostUpdatedMovies")
    }

    private static func makePostUpdatedMoviesQuery(_ tmdbID: String?, _ imdbID: String?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(tmdbID, forKey: "tmdbId")
        encoder.encode(imdbID, forKey: "imdbId")
        return encoder.items
    }
}
