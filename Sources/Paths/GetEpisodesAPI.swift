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
    /// Gets episodes for a tv season.
    static public func getEpisodes(seriesID: String, parameters: GetEpisodesParameters? = nil) -> Request<JellyfinAPI.BaseItemDtoQueryResult> {
        Request(method: "GET", url: "/Shows/\(seriesID)/Episodes", query: parameters?.asQuery, id: "GetEpisodes")
    }

    public struct GetEpisodesParameters {
        public var userID: UUID?
        public var fields: [JellyfinAPI.ItemFields]?
        public var season: Int32?
        public var seasonID: UUID?
        public var isMissing: Bool?
        public var adjacentTo: String?
        public var startItemID: UUID?
        public var startIndex: Int32?
        public var limit: Int32?
        public var enableImages: Bool?
        public var imageTypeLimit: Int32?
        public var enableImageTypes: [JellyfinAPI.ImageType]?
        public var enableUserData: Bool?
        public var sortBy: String?

        public init(userID: UUID? = nil, fields: [JellyfinAPI.ItemFields]? = nil, season: Int32? = nil, seasonID: UUID? = nil, isMissing: Bool? = nil, adjacentTo: String? = nil, startItemID: UUID? = nil, startIndex: Int32? = nil, limit: Int32? = nil, enableImages: Bool? = nil, imageTypeLimit: Int32? = nil, enableImageTypes: [JellyfinAPI.ImageType]? = nil, enableUserData: Bool? = nil, sortBy: String? = nil) {
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
