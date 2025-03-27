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

public extension Paths {
    /// Gets live tv series timers.
    static func getSeriesTimers(parameters: GetSeriesTimersParameters? = nil) -> Request<JellyfinAPI.SeriesTimerInfoDtoQueryResult> {
        Request(path: "/LiveTv/SeriesTimers", method: "GET", query: parameters?.asQuery, id: "GetSeriesTimers")
    }

    struct GetSeriesTimersParameters {
        public var sortBy: String?
        public var sortOrder: SortOrder?

        public typealias SortOrder = JellyfinAPI.SortOrder

        public init(sortBy: String? = nil, sortOrder: SortOrder? = nil) {
            self.sortBy = sortBy
            self.sortOrder = sortOrder
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(sortBy, forKey: "sortBy")
            encoder.encode(sortOrder, forKey: "sortOrder")
            return encoder.items
        }
    }
}
