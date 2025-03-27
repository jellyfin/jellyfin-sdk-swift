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
    /// Gets movie recommendations.
    static func getMovieRecommendations(parameters: GetMovieRecommendationsParameters? = nil) -> Request<[JellyfinAPI.RecommendationDto]> {
        Request(path: "/Movies/Recommendations", method: "GET", query: parameters?.asQuery, id: "GetMovieRecommendations")
    }

    struct GetMovieRecommendationsParameters {
        public var userID: String?
        public var parentID: String?
        public var fields: [JellyfinAPI.ItemFields]?
        public var categoryLimit: Int?
        public var itemLimit: Int?

        public init(
            userID: String? = nil,
            parentID: String? = nil,
            fields: [JellyfinAPI.ItemFields]? = nil,
            categoryLimit: Int? = nil,
            itemLimit: Int? = nil
        ) {
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
