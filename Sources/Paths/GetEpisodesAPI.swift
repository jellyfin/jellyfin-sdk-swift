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
    /// Gets episodes for a tv season.
    static func getEpisodes(seriesID: String, parameters: GetEpisodesParameters? = nil) -> Request<JellyfinAPI.BaseItemDtoQueryResult> {
        Request(path: "/Shows/\(seriesID)/Episodes", method: "GET", query: parameters?.asQuery, id: "GetEpisodes")
    }

    struct GetEpisodesParameters {
        public var userID: String?
        public var fields: [JellyfinAPI.ItemFields]?
        public var season: Int?
        public var seasonID: String?
        public var isMissing: Bool?
        public var adjacentTo: String?
        public var startItemID: String?
        public var startIndex: Int?
        public var limit: Int?
        public var enableImages: Bool?
        public var imageTypeLimit: Int?
        public var enableImageTypes: [JellyfinAPI.ImageType]?
        public var enableUserData: Bool?
        public var sortBy: SortBy?

        public typealias SortBy = JellyfinAPI.ItemSortBy

        public init(
            userID: String? = nil,
            fields: [JellyfinAPI.ItemFields]? = nil,
            season: Int? = nil,
            seasonID: String? = nil,
            isMissing: Bool? = nil,
            adjacentTo: String? = nil,
            startItemID: String? = nil,
            startIndex: Int? = nil,
            limit: Int? = nil,
            enableImages: Bool? = nil,
            imageTypeLimit: Int? = nil,
            enableImageTypes: [JellyfinAPI.ImageType]? = nil,
            enableUserData: Bool? = nil,
            sortBy: SortBy? = nil
        ) {
            self.userID = userID
            self.fields = fields
            self.season = season
            self.seasonID = seasonID
            self.isMissing = isMissing
            self.adjacentTo = adjacentTo
            self.startItemID = startItemID
            self.startIndex = startIndex
            self.limit = limit
            self.enableImages = enableImages
            self.imageTypeLimit = imageTypeLimit
            self.enableImageTypes = enableImageTypes
            self.enableUserData = enableUserData
            self.sortBy = sortBy
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(userID, forKey: "userId")
            encoder.encode(fields, forKey: "fields")
            encoder.encode(season, forKey: "season")
            encoder.encode(seasonID, forKey: "seasonId")
            encoder.encode(isMissing, forKey: "isMissing")
            encoder.encode(adjacentTo, forKey: "adjacentTo")
            encoder.encode(startItemID, forKey: "startItemId")
            encoder.encode(startIndex, forKey: "startIndex")
            encoder.encode(limit, forKey: "limit")
            encoder.encode(enableImages, forKey: "enableImages")
            encoder.encode(imageTypeLimit, forKey: "imageTypeLimit")
            encoder.encode(enableImageTypes, forKey: "enableImageTypes")
            encoder.encode(enableUserData, forKey: "enableUserData")
            encoder.encode(sortBy, forKey: "sortBy")
            return encoder.items
        }
    }
}
