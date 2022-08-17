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
    /// Gets movie recommendations.
    static public func getMovieRecommendations(parameters: GetMovieRecommendationsParameters? = nil) -> Request<[JellyfinAPI.RecommendationDto]> {
        Request(method: "GET", url: "/Movies/Recommendations", query: parameters?.asQuery, id: "GetMovieRecommendations")
    }

    public struct GetMovieRecommendationsParameters {
        public var userID: UUID?
        public var parentID: UUID?
        public var fields: [JellyfinAPI.ItemFields]?
        public var categoryLimit: Int32?
        public var itemLimit: Int32?

        public init(userID: UUID? = nil, parentID: UUID? = nil, fields: [JellyfinAPI.ItemFields]? = nil, categoryLimit: Int32? = nil, itemLimit: Int32? = nil) {
            self.userID = userID
            self.parentID = parentID
            self.fields = fields
            self.categoryLimit = categoryLimit
            self.itemLimit = itemLimit
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(userID, forKey: "userId")
            encoder.encode(parentID, forKey: "parentId")
            encoder.encode(fields, forKey: "fields")
            encoder.encode(categoryLimit, forKey: "categoryLimit")
            encoder.encode(itemLimit, forKey: "itemLimit")
            return encoder.items
        }
    }
}
