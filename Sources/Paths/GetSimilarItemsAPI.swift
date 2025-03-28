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
    /// Gets similar items.
    static func getSimilarItems(
        itemID: String,
        parameters: GetSimilarItemsParameters? = nil
    ) -> Request<JellyfinAPI.BaseItemDtoQueryResult> {
        Request(path: "/Items/\(itemID)/Similar", method: "GET", query: parameters?.asQuery, id: "GetSimilarItems")
    }

    struct GetSimilarItemsParameters {
        public var excludeArtistIDs: [String]?
        public var userID: String?
        public var limit: Int?
        public var fields: [JellyfinAPI.ItemFields]?

        public init(excludeArtistIDs: [String]? = nil, userID: String? = nil, limit: Int? = nil, fields: [JellyfinAPI.ItemFields]? = nil) {
            self.excludeArtistIDs = excludeArtistIDs
            self.userID = userID
            self.limit = limit
            self.fields = fields
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(excludeArtistIDs, forKey: "excludeArtistIds")
            encoder.encode(userID, forKey: "userId")
            encoder.encode(limit, forKey: "limit")
            encoder.encode(fields, forKey: "fields")
            return encoder.items
        }
    }
}
