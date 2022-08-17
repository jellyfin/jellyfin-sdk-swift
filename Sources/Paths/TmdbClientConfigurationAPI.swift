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
    /// Gets the TMDb image configuration options.
    static public var tmdbClientConfiguration: Request<JellyfinAPI.ConfigImageTypes> {
        Request(method: "GET", url: "/Tmdb/ClientConfiguration", id: "TmdbClientConfiguration")
    }
}
