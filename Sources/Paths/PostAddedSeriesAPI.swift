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
    /// Reports that new episodes of a series have been added by an external source.
    public static func postAddedSeries(tvdbID: String? = nil) -> Request<Void> {
        Request(path: "/Library/Series/Added", method: "POST", query: makePostAddedSeriesQuery(tvdbID), id: "PostAddedSeries")
    }

    private static func makePostAddedSeriesQuery(_ tvdbID: String?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(tvdbID, forKey: "tvdbId")
        return encoder.items
    }
}
