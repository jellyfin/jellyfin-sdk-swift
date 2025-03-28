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
    /// Gets latest channel items.
    static func getLatestChannelItems(parameters: GetLatestChannelItemsParameters? = nil) -> Request<JellyfinAPI.BaseItemDtoQueryResult> {
        Request(path: "/Channels/Items/Latest", method: "GET", query: parameters?.asQuery, id: "GetLatestChannelItems")
    }

    struct GetLatestChannelItemsParameters {
        public var userID: String?
        public var startIndex: Int?
        public var limit: Int?
        public var filters: [JellyfinAPI.ItemFilter]?
        public var fields: [JellyfinAPI.ItemFields]?
        public var channelIDs: [String]?

        public init(
            userID: String? = nil,
            startIndex: Int? = nil,
            limit: Int? = nil,
            filters: [JellyfinAPI.ItemFilter]? = nil,
            fields: [JellyfinAPI.ItemFields]? = nil,
            channelIDs: [String]? = nil
        ) {
            self.userID = userID
            self.startIndex = startIndex
            self.limit = limit
            self.filters = filters
            self.fields = fields
            self.channelIDs = channelIDs
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(userID, forKey: "userId")
            encoder.encode(startIndex, forKey: "startIndex")
            encoder.encode(limit, forKey: "limit")
            encoder.encode(filters, forKey: "filters")
            encoder.encode(fields, forKey: "fields")
            encoder.encode(channelIDs, forKey: "channelIds")
            return encoder.items
        }
    }
}
