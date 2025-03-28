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
    /// Gets recommended live tv epgs.
    static func getRecommendedPrograms(parameters: GetRecommendedProgramsParameters? = nil) -> Request<JellyfinAPI.BaseItemDtoQueryResult> {
        Request(path: "/LiveTv/Programs/Recommended", method: "GET", query: parameters?.asQuery, id: "GetRecommendedPrograms")
    }

    struct GetRecommendedProgramsParameters {
        public var userID: String?
        public var limit: Int?
        public var isAiring: Bool?
        public var hasAired: Bool?
        public var isSeries: Bool?
        public var isMovie: Bool?
        public var isNews: Bool?
        public var isKids: Bool?
        public var isSports: Bool?
        public var enableImages: Bool?
        public var imageTypeLimit: Int?
        public var enableImageTypes: [JellyfinAPI.ImageType]?
        public var genreIDs: [String]?
        public var fields: [JellyfinAPI.ItemFields]?
        public var enableUserData: Bool?
        public var enableTotalRecordCount: Bool?

        public init(
            userID: String? = nil,
            limit: Int? = nil,
            isAiring: Bool? = nil,
            hasAired: Bool? = nil,
            isSeries: Bool? = nil,
            isMovie: Bool? = nil,
            isNews: Bool? = nil,
            isKids: Bool? = nil,
            isSports: Bool? = nil,
            enableImages: Bool? = nil,
            imageTypeLimit: Int? = nil,
            enableImageTypes: [JellyfinAPI.ImageType]? = nil,
            genreIDs: [String]? = nil,
            fields: [JellyfinAPI.ItemFields]? = nil,
            enableUserData: Bool? = nil,
            enableTotalRecordCount: Bool? = nil
        ) {
            self.userID = userID
            self.limit = limit
            self.isAiring = isAiring
            self.hasAired = hasAired
            self.isSeries = isSeries
            self.isMovie = isMovie
            self.isNews = isNews
            self.isKids = isKids
            self.isSports = isSports
            self.enableImages = enableImages
            self.imageTypeLimit = imageTypeLimit
            self.enableImageTypes = enableImageTypes
            self.genreIDs = genreIDs
            self.fields = fields
            self.enableUserData = enableUserData
            self.enableTotalRecordCount = enableTotalRecordCount
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(userID, forKey: "userId")
            encoder.encode(limit, forKey: "limit")
            encoder.encode(isAiring, forKey: "isAiring")
            encoder.encode(hasAired, forKey: "hasAired")
            encoder.encode(isSeries, forKey: "isSeries")
            encoder.encode(isMovie, forKey: "isMovie")
            encoder.encode(isNews, forKey: "isNews")
            encoder.encode(isKids, forKey: "isKids")
            encoder.encode(isSports, forKey: "isSports")
            encoder.encode(enableImages, forKey: "enableImages")
            encoder.encode(imageTypeLimit, forKey: "imageTypeLimit")
            encoder.encode(enableImageTypes, forKey: "enableImageTypes")
            encoder.encode(genreIDs, forKey: "genreIds")
            encoder.encode(fields, forKey: "fields")
            encoder.encode(enableUserData, forKey: "enableUserData")
            encoder.encode(enableTotalRecordCount, forKey: "enableTotalRecordCount")
            return encoder.items
        }
    }
}
