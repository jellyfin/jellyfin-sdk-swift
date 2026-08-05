//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get

public extension Paths {
    /// Gets activity log entries.
    static func getLogEntries(parameters: GetLogEntriesParameters? = nil) -> Request<ActivityLogEntryQueryResult> {
        Request(path: "/System/ActivityLog/Entries", method: "GET", query: parameters?.asQuery, id: "GetLogEntries")
    }

    struct GetLogEntriesParameters {
        public var startIndex: Int?
        public var limit: Int?
        public var minDate: Date?
        public var maxDate: Date?
        public var hasUserID: Bool?
        public var name: String?
        public var overview: String?
        public var shortOverview: String?
        public var type: String?
        public var itemID: String?
        public var username: String?
        public var severity: LogLevel?
        public var sortBy: [ActivityLogSortBy]?
        public var sortOrder: [SortOrder]?

        public init(
            startIndex: Int? = nil,
            limit: Int? = nil,
            minDate: Date? = nil,
            maxDate: Date? = nil,
            hasUserID: Bool? = nil,
            name: String? = nil,
            overview: String? = nil,
            shortOverview: String? = nil,
            type: String? = nil,
            itemID: String? = nil,
            username: String? = nil,
            severity: LogLevel? = nil,
            sortBy: [ActivityLogSortBy]? = nil,
            sortOrder: [SortOrder]? = nil
        ) {
            self.startIndex = startIndex
            self.limit = limit
            self.minDate = minDate
            self.maxDate = maxDate
            self.hasUserID = hasUserID
            self.name = name
            self.overview = overview
            self.shortOverview = shortOverview
            self.type = type
            self.itemID = itemID
            self.username = username
            self.severity = severity
            self.sortBy = sortBy
            self.sortOrder = sortOrder
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(startIndex, forKey: "startIndex")
            encoder.encode(limit, forKey: "limit")
            encoder.encode(minDate, forKey: "minDate")
            encoder.encode(maxDate, forKey: "maxDate")
            encoder.encode(hasUserID, forKey: "hasUserId")
            encoder.encode(name, forKey: "name")
            encoder.encode(overview, forKey: "overview")
            encoder.encode(shortOverview, forKey: "shortOverview")
            encoder.encode(type, forKey: "type")
            encoder.encode(itemID, forKey: "itemId")
            encoder.encode(username, forKey: "username")
            encoder.encode(severity, forKey: "severity")
            encoder.encode(sortBy, forKey: "sortBy")
            encoder.encode(sortOrder, forKey: "sortOrder")
            return encoder.items
        }
    }
}
