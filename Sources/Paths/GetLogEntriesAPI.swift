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
    /// Gets activity log entries.
    static func getLogEntries(parameters: GetLogEntriesParameters? = nil) -> Request<JellyfinAPI.ActivityLogEntryQueryResult> {
        Request(path: "/System/ActivityLog/Entries", method: "GET", query: parameters?.asQuery, id: "GetLogEntries")
    }

    struct GetLogEntriesParameters {
        public var startIndex: Int?
        public var limit: Int?
        public var minDate: Date?
        public var hasUserID: Bool?

        public init(startIndex: Int? = nil, limit: Int? = nil, minDate: Date? = nil, hasUserID: Bool? = nil) {
            self.startIndex = startIndex
            self.limit = limit
            self.minDate = minDate
            self.hasUserID = hasUserID
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(startIndex, forKey: "startIndex")
            encoder.encode(limit, forKey: "limit")
            encoder.encode(minDate, forKey: "minDate")
            encoder.encode(hasUserID, forKey: "hasUserId")
            return encoder.items
        }
    }
}
