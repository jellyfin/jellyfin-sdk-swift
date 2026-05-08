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
    /// Get channel items.
    static func getChannelItems(channelID: String, parameters: GetChannelItemsParameters? = nil) -> Request<BaseItemDtoQueryResult> {
        Request(path: "/Channels/\(channelID)/Items", method: "GET", query: parameters?.asQuery, id: "GetChannelItems")
    }

    struct GetChannelItemsParameters {
        public var folderID: String?
        public var userID: String?
        public var startIndex: Int?
        public var limit: Int?
        public var sortOrder: [SortOrder]?
        public var filters: [ItemFilter]?
        public var sortBy: [ItemSortBy]?
        public var fields: [ItemFields]?

        public init(
            folderID: String? = nil,
            userID: String? = nil,
            startIndex: Int? = nil,
            limit: Int? = nil,
            sortOrder: [SortOrder]? = nil,
            filters: [ItemFilter]? = nil,
            sortBy: [ItemSortBy]? = nil,
            fields: [ItemFields]? = nil
        ) {
            self.folderID = folderID
            self.userID = userID
            self.startIndex = startIndex
            self.limit = limit
            self.sortOrder = sortOrder
            self.filters = filters
            self.sortBy = sortBy
            self.fields = fields
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(folderID, forKey: "folderId")
            encoder.encode(userID, forKey: "userId")
            encoder.encode(startIndex, forKey: "startIndex")
            encoder.encode(limit, forKey: "limit")
            encoder.encode(sortOrder, forKey: "sortOrder")
            encoder.encode(filters, forKey: "filters")
            encoder.encode(sortBy, forKey: "sortBy")
            encoder.encode(fields, forKey: "fields")
            return encoder.items
        }
    }
}
