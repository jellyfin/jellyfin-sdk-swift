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
    /// Gets live tv recordings.
    static func getRecordings(parameters: GetRecordingsParameters? = nil) -> Request<JellyfinAPI.BaseItemDtoQueryResult> {
        Request(path: "/LiveTv/Recordings", method: "GET", query: parameters?.asQuery, id: "GetRecordings")
    }

    struct GetRecordingsParameters {
        public var channelID: String?
        public var userID: String?
        public var startIndex: Int?
        public var limit: Int?
        public var status: Status?
        public var isInProgress: Bool?
        public var seriesTimerID: String?
        public var enableImages: Bool?
        public var imageTypeLimit: Int?
        public var enableImageTypes: [JellyfinAPI.ImageType]?
        public var fields: [JellyfinAPI.ItemFields]?
        public var enableUserData: Bool?
        public var isMovie: Bool?
        public var isSeries: Bool?
        public var isKids: Bool?
        public var isSports: Bool?
        public var isNews: Bool?
        public var isLibraryItem: Bool?
        public var enableTotalRecordCount: Bool?

        public typealias Status = JellyfinAPI.RecordingStatus

        public init(
            channelID: String? = nil,
            userID: String? = nil,
            startIndex: Int? = nil,
            limit: Int? = nil,
            status: Status? = nil,
            isInProgress: Bool? = nil,
            seriesTimerID: String? = nil,
            enableImages: Bool? = nil,
            imageTypeLimit: Int? = nil,
            enableImageTypes: [JellyfinAPI.ImageType]? = nil,
            fields: [JellyfinAPI.ItemFields]? = nil,
            enableUserData: Bool? = nil,
            isMovie: Bool? = nil,
            isSeries: Bool? = nil,
            isKids: Bool? = nil,
            isSports: Bool? = nil,
            isNews: Bool? = nil,
            isLibraryItem: Bool? = nil,
            enableTotalRecordCount: Bool? = nil
        ) {
            self.channelID = channelID
            self.userID = userID
            self.startIndex = startIndex
            self.limit = limit
            self.status = status
            self.isInProgress = isInProgress
            self.seriesTimerID = seriesTimerID
            self.enableImages = enableImages
            self.imageTypeLimit = imageTypeLimit
            self.enableImageTypes = enableImageTypes
            self.fields = fields
            self.enableUserData = enableUserData
            self.isMovie = isMovie
            self.isSeries = isSeries
            self.isKids = isKids
            self.isSports = isSports
            self.isNews = isNews
            self.isLibraryItem = isLibraryItem
            self.enableTotalRecordCount = enableTotalRecordCount
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(channelID, forKey: "channelId")
            encoder.encode(userID, forKey: "userId")
            encoder.encode(startIndex, forKey: "startIndex")
            encoder.encode(limit, forKey: "limit")
            encoder.encode(status, forKey: "status")
            encoder.encode(isInProgress, forKey: "isInProgress")
            encoder.encode(seriesTimerID, forKey: "seriesTimerId")
            encoder.encode(enableImages, forKey: "enableImages")
            encoder.encode(imageTypeLimit, forKey: "imageTypeLimit")
            encoder.encode(enableImageTypes, forKey: "enableImageTypes")
            encoder.encode(fields, forKey: "fields")
            encoder.encode(enableUserData, forKey: "enableUserData")
            encoder.encode(isMovie, forKey: "isMovie")
            encoder.encode(isSeries, forKey: "isSeries")
            encoder.encode(isKids, forKey: "isKids")
            encoder.encode(isSports, forKey: "isSports")
            encoder.encode(isNews, forKey: "isNews")
            encoder.encode(isLibraryItem, forKey: "isLibraryItem")
            encoder.encode(enableTotalRecordCount, forKey: "enableTotalRecordCount")
            return encoder.items
        }
    }
}
