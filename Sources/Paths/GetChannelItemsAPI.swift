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
    /// Get channel items.
    static func getChannelItems(
        channelID: String,
        parameters: GetChannelItemsParameters? = nil
    ) -> Request<JellyfinAPI.BaseItemDtoQueryResult> {
        Request(path: "/Channels/\(channelID)/Items", method: "GET", query: parameters?.asQuery, id: "GetChannelItems")
    }

    struct GetChannelItemsParameters {
        public var folderID: String?
        public var userID: String?
        public var startIndex: Int?
        public var limit: Int?
        public var sortOrder: [JellyfinAPI.SortOrder]?
        public var filters: [JellyfinAPI.ItemFilter]?
        public var sortBy: [JellyfinAPI.ItemSortBy]?
        public var fields: [JellyfinAPI.ItemFields]?

        public init(
            folderID: String? = nil,
            userID: String? = nil,
            startIndex: Int? = nil,
            limit: Int? = nil,
            sortOrder: [JellyfinAPI.SortOrder]? = nil,
            filters: [JellyfinAPI.ItemFilter]? = nil,
            sortBy: [JellyfinAPI.ItemSortBy]? = nil,
            fields: [JellyfinAPI.ItemFields]? = nil
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
