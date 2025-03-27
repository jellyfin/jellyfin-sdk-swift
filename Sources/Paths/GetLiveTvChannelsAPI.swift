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
    /// Gets available live tv channels.
    static func getLiveTvChannels(parameters: GetLiveTvChannelsParameters? = nil) -> Request<JellyfinAPI.BaseItemDtoQueryResult> {
        Request(path: "/LiveTv/Channels", method: "GET", query: parameters?.asQuery, id: "GetLiveTvChannels")
    }

    struct GetLiveTvChannelsParameters {
        public var type: `Type`?
        public var userID: String?
        public var startIndex: Int?
        public var isMovie: Bool?
        public var isSeries: Bool?
        public var isNews: Bool?
        public var isKids: Bool?
        public var isSports: Bool?
        public var limit: Int?
        public var isFavorite: Bool?
        public var isLiked: Bool?
        public var isDisliked: Bool?
        public var enableImages: Bool?
        public var imageTypeLimit: Int?
        public var enableImageTypes: [JellyfinAPI.ImageType]?
        public var fields: [JellyfinAPI.ItemFields]?
        public var enableUserData: Bool?
        public var sortBy: [JellyfinAPI.ItemSortBy]?
        public var sortOrder: SortOrder?
        public var enableFavoriteSorting: Bool?
        public var isAddCurrentProgram: Bool?

        public typealias `Type` = JellyfinAPI.ChannelType

        public typealias SortOrder = JellyfinAPI.SortOrder

        public init(
            type: Type? = nil,
            userID: String? = nil,
            startIndex: Int? = nil,
            isMovie: Bool? = nil,
            isSeries: Bool? = nil,
            isNews: Bool? = nil,
            isKids: Bool? = nil,
            isSports: Bool? = nil,
            limit: Int? = nil,
            isFavorite: Bool? = nil,
            isLiked: Bool? = nil,
            isDisliked: Bool? = nil,
            enableImages: Bool? = nil,
            imageTypeLimit: Int? = nil,
            enableImageTypes: [JellyfinAPI.ImageType]? = nil,
            fields: [JellyfinAPI.ItemFields]? = nil,
            enableUserData: Bool? = nil,
            sortBy: [JellyfinAPI.ItemSortBy]? = nil,
            sortOrder: SortOrder? = nil,
            enableFavoriteSorting: Bool? = nil,
            isAddCurrentProgram: Bool? = nil
        ) {
            self.type = type
            self.userID = userID
            self.startIndex = startIndex
            self.isMovie = isMovie
            self.isSeries = isSeries
            self.isNews = isNews
            self.isKids = isKids
            self.isSports = isSports
            self.limit = limit
            self.isFavorite = isFavorite
            self.isLiked = isLiked
            self.isDisliked = isDisliked
            self.enableImages = enableImages
            self.imageTypeLimit = imageTypeLimit
            self.enableImageTypes = enableImageTypes
            self.fields = fields
            self.enableUserData = enableUserData
            self.sortBy = sortBy
            self.sortOrder = sortOrder
            self.enableFavoriteSorting = enableFavoriteSorting
            self.isAddCurrentProgram = isAddCurrentProgram
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(type, forKey: "type")
            encoder.encode(userID, forKey: "userId")
            encoder.encode(startIndex, forKey: "startIndex")
            encoder.encode(isMovie, forKey: "isMovie")
            encoder.encode(isSeries, forKey: "isSeries")
            encoder.encode(isNews, forKey: "isNews")
            encoder.encode(isKids, forKey: "isKids")
            encoder.encode(isSports, forKey: "isSports")
            encoder.encode(limit, forKey: "limit")
            encoder.encode(isFavorite, forKey: "isFavorite")
            encoder.encode(isLiked, forKey: "isLiked")
            encoder.encode(isDisliked, forKey: "isDisliked")
            encoder.encode(enableImages, forKey: "enableImages")
            encoder.encode(imageTypeLimit, forKey: "imageTypeLimit")
            encoder.encode(enableImageTypes, forKey: "enableImageTypes")
            encoder.encode(fields, forKey: "fields")
            encoder.encode(enableUserData, forKey: "enableUserData")
            encoder.encode(sortBy, forKey: "sortBy")
            encoder.encode(sortOrder, forKey: "sortOrder")
            encoder.encode(enableFavoriteSorting, forKey: "enableFavoriteSorting")
            encoder.encode(isAddCurrentProgram, forKey: "addCurrentProgram")
            return encoder.items
        }
    }
}
