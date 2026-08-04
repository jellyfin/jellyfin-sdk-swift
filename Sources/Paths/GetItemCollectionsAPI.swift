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
    /// Gets the collections that include the specified item.
    static func getItemCollections(itemID: String, parameters: GetItemCollectionsParameters? = nil) -> Request<BaseItemDtoQueryResult> {
        Request(path: "/Items/\(itemID)/Collections", method: "GET", query: parameters?.asQuery, id: "GetItemCollections")
    }

    struct GetItemCollectionsParameters {
        public var userID: String?
        public var startIndex: Int?
        public var limit: Int?
        public var fields: [ItemFields]?

        public init(userID: String? = nil, startIndex: Int? = nil, limit: Int? = nil, fields: [ItemFields]? = nil) {
            self.userID = userID
            self.startIndex = startIndex
            self.limit = limit
            self.fields = fields
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(userID, forKey: "userId")
            encoder.encode(startIndex, forKey: "startIndex")
            encoder.encode(limit, forKey: "limit")
            encoder.encode(fields, forKey: "fields")
            return encoder.items
        }
    }
}
