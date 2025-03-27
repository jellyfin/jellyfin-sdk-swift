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
    /// Gets available live tv epgs.
    static func getLiveTvPrograms(parameters: GetLiveTvProgramsParameters? = nil) -> Request<JellyfinAPI.BaseItemDtoQueryResult> {
        Request(path: "/LiveTv/Programs", method: "GET", query: parameters?.asQuery, id: "GetLiveTvPrograms")
    }

    struct GetLiveTvProgramsParameters {
        public var channelIDs: [String]?
        public var userID: String?
        public var minStartDate: Date?
        public var hasAired: Bool?
        public var isAiring: Bool?
        public var maxStartDate: Date?
        public var minEndDate: Date?
        public var maxEndDate: Date?
        public var isMovie: Bool?
        public var isSeries: Bool?
        public var isNews: Bool?
        public var isKids: Bool?
        public var isSports: Bool?
        public var startIndex: Int?
        public var limit: Int?
        public var sortBy: [JellyfinAPI.ItemSortBy]?
        public var sortOrder: [JellyfinAPI.SortOrder]?
        public var genres: [String]?
        public var genreIDs: [String]?
        public var enableImages: Bool?
        public var imageTypeLimit: Int?
        public var enableImageTypes: [JellyfinAPI.ImageType]?
        public var enableUserData: Bool?
        public var seriesTimerID: String?
        public var librarySeriesID: String?
        public var fields: [JellyfinAPI.ItemFields]?
        public var enableTotalRecordCount: Bool?

        public init(
            channelIDs: [String]? = nil,
            userID: String? = nil,
            minStartDate: Date? = nil,
            hasAired: Bool? = nil,
            isAiring: Bool? = nil,
            maxStartDate: Date? = nil,
            minEndDate: Date? = nil,
            maxEndDate: Date? = nil,
            isMovie: Bool? = nil,
            isSeries: Bool? = nil,
            isNews: Bool? = nil,
            isKids: Bool? = nil,
            isSports: Bool? = nil,
            startIndex: Int? = nil,
            limit: Int? = nil,
            sortBy: [JellyfinAPI.ItemSortBy]? = nil,
            sortOrder: [JellyfinAPI.SortOrder]? = nil,
            genres: [String]? = nil,
            genreIDs: [String]? = nil,
            enableImages: Bool? = nil,
            imageTypeLimit: Int? = nil,
            enableImageTypes: [JellyfinAPI.ImageType]? = nil,
            enableUserData: Bool? = nil,
            seriesTimerID: String? = nil,
            librarySeriesID: String? = nil,
            fields: [JellyfinAPI.ItemFields]? = nil,
            enableTotalRecordCount: Bool? = nil
        ) {
            self.channelIDs = channelIDs
            self.userID = userID
            self.minStartDate = minStartDate
            self.hasAired = hasAired
            self.isAiring = isAiring
            self.maxStartDate = maxStartDate
            self.minEndDate = minEndDate
            self.maxEndDate = maxEndDate
            self.isMovie = isMovie
            self.isSeries = isSeries
            self.isNews = isNews
            self.isKids = isKids
            self.isSports = isSports
            self.startIndex = startIndex
            self.limit = limit
            self.sortBy = sortBy
            self.sortOrder = sortOrder
            self.genres = genres
            self.genreIDs = genreIDs
            self.enableImages = enableImages
            self.imageTypeLimit = imageTypeLimit
            self.enableImageTypes = enableImageTypes
            self.enableUserData = enableUserData
            self.seriesTimerID = seriesTimerID
            self.librarySeriesID = librarySeriesID
            self.fields = fields
            self.enableTotalRecordCount = enableTotalRecordCount
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(channelIDs, forKey: "channelIds")
            encoder.encode(userID, forKey: "userId")
            encoder.encode(minStartDate, forKey: "minStartDate")
            encoder.encode(hasAired, forKey: "hasAired")
            encoder.encode(isAiring, forKey: "isAiring")
            encoder.encode(maxStartDate, forKey: "maxStartDate")
            encoder.encode(minEndDate, forKey: "minEndDate")
            encoder.encode(maxEndDate, forKey: "maxEndDate")
            encoder.encode(isMovie, forKey: "isMovie")
            encoder.encode(isSeries, forKey: "isSeries")
            encoder.encode(isNews, forKey: "isNews")
            encoder.encode(isKids, forKey: "isKids")
            encoder.encode(isSports, forKey: "isSports")
            encoder.encode(startIndex, forKey: "startIndex")
            encoder.encode(limit, forKey: "limit")
            encoder.encode(sortBy, forKey: "sortBy")
            encoder.encode(sortOrder, forKey: "sortOrder")
            encoder.encode(genres, forKey: "genres")
            encoder.encode(genreIDs, forKey: "genreIds")
            encoder.encode(enableImages, forKey: "enableImages")
            encoder.encode(imageTypeLimit, forKey: "imageTypeLimit")
            encoder.encode(enableImageTypes, forKey: "enableImageTypes")
            encoder.encode(enableUserData, forKey: "enableUserData")
            encoder.encode(seriesTimerID, forKey: "seriesTimerId")
            encoder.encode(librarySeriesID, forKey: "librarySeriesId")
            encoder.encode(fields, forKey: "fields")
            encoder.encode(enableTotalRecordCount, forKey: "enableTotalRecordCount")
            return encoder.items
        }
    }
}
