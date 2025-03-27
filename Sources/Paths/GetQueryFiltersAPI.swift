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
    /// Gets query filters.
    static func getQueryFilters(parameters: GetQueryFiltersParameters? = nil) -> Request<JellyfinAPI.QueryFilters> {
        Request(path: "/Items/Filters2", method: "GET", query: parameters?.asQuery, id: "GetQueryFilters")
    }

    struct GetQueryFiltersParameters {
        public var userID: String?
        public var parentID: String?
        public var includeItemTypes: [JellyfinAPI.BaseItemKind]?
        public var isAiring: Bool?
        public var isMovie: Bool?
        public var isSports: Bool?
        public var isKids: Bool?
        public var isNews: Bool?
        public var isSeries: Bool?
        public var isRecursive: Bool?

        public init(
            userID: String? = nil,
            parentID: String? = nil,
            includeItemTypes: [JellyfinAPI.BaseItemKind]? = nil,
            isAiring: Bool? = nil,
            isMovie: Bool? = nil,
            isSports: Bool? = nil,
            isKids: Bool? = nil,
            isNews: Bool? = nil,
            isSeries: Bool? = nil,
            isRecursive: Bool? = nil
        ) {
            self.userID = userID
            self.parentID = parentID
            self.includeItemTypes = includeItemTypes
            self.isAiring = isAiring
            self.isMovie = isMovie
            self.isSports = isSports
            self.isKids = isKids
            self.isNews = isNews
            self.isSeries = isSeries
            self.isRecursive = isRecursive
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(userID, forKey: "userId")
            encoder.encode(parentID, forKey: "parentId")
            encoder.encode(includeItemTypes, forKey: "includeItemTypes")
            encoder.encode(isAiring, forKey: "isAiring")
            encoder.encode(isMovie, forKey: "isMovie")
            encoder.encode(isSports, forKey: "isSports")
            encoder.encode(isKids, forKey: "isKids")
            encoder.encode(isNews, forKey: "isNews")
            encoder.encode(isSeries, forKey: "isSeries")
            encoder.encode(isRecursive, forKey: "recursive")
            return encoder.items
        }
    }
}
