//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get
import URLQueryEncoder

extension Paths {
    /// Gets similar items.
    static public func getSimilarShows(itemID: String, parameters: GetSimilarShowsParameters? = nil) -> Request<JellyfinAPI.BaseItemDtoQueryResult> {
        Request(method: "GET", url: "/Shows/\(itemID)/Similar", query: parameters?.asQuery, id: "GetSimilarShows")
    }

    public struct GetSimilarShowsParameters {
        public var excludeArtistIDs: [UUID]?
        public var userID: UUID?
        public var limit: Int32?
        public var fields: [JellyfinAPI.ItemFields]?

        public init(excludeArtistIDs: [UUID]? = nil, userID: UUID? = nil, limit: Int32? = nil, fields: [JellyfinAPI.ItemFields]? = nil) {
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
