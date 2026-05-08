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
    /// Gets live tv series timers.
    public static func getSeriesTimers(sortBy: String? = nil, sortOrder: SortOrder? = nil) -> Request<SeriesTimerInfoDtoQueryResult> {
        Request(path: "/LiveTv/SeriesTimers", method: "GET", query: makeGetSeriesTimersQuery(sortBy, sortOrder), id: "GetSeriesTimers")
    }

    private static func makeGetSeriesTimersQuery(_ sortBy: String?, _ sortOrder: SortOrder?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(sortBy, forKey: "sortBy")
        encoder.encode(sortOrder, forKey: "sortOrder")
        return encoder.items
    }
}
