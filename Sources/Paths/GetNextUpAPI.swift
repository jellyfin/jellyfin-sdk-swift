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
    /// Gets a list of next up episodes.
    static func getNextUp(parameters: GetNextUpParameters? = nil) -> Request<JellyfinAPI.BaseItemDtoQueryResult> {
        Request(path: "/Shows/NextUp", method: "GET", query: parameters?.asQuery, id: "GetNextUp")
    }

    struct GetNextUpParameters {
        public var userID: String?
        public var startIndex: Int?
        public var limit: Int?
        public var fields: [JellyfinAPI.ItemFields]?
        public var seriesID: String?
        public var parentID: String?
        public var enableImages: Bool?
        public var imageTypeLimit: Int?
        public var enableImageTypes: [JellyfinAPI.ImageType]?
        public var enableUserData: Bool?
        public var nextUpDateCutoff: Date?
        public var enableTotalRecordCount: Bool?
        public var isDisableFirstEpisode: Bool?
        public var enableResumable: Bool?
        public var enableRewatching: Bool?

        public init(
            userID: String? = nil,
            startIndex: Int? = nil,
            limit: Int? = nil,
            fields: [JellyfinAPI.ItemFields]? = nil,
            seriesID: String? = nil,
            parentID: String? = nil,
            enableImages: Bool? = nil,
            imageTypeLimit: Int? = nil,
            enableImageTypes: [JellyfinAPI.ImageType]? = nil,
            enableUserData: Bool? = nil,
            nextUpDateCutoff: Date? = nil,
            enableTotalRecordCount: Bool? = nil,
            isDisableFirstEpisode: Bool? = nil,
            enableResumable: Bool? = nil,
            enableRewatching: Bool? = nil
        ) {
            self.userID = userID
            self.startIndex = startIndex
            self.limit = limit
            self.fields = fields
            self.seriesID = seriesID
            self.parentID = parentID
            self.enableImages = enableImages
            self.imageTypeLimit = imageTypeLimit
            self.enableImageTypes = enableImageTypes
            self.enableUserData = enableUserData
            self.nextUpDateCutoff = nextUpDateCutoff
            self.enableTotalRecordCount = enableTotalRecordCount
            self.isDisableFirstEpisode = isDisableFirstEpisode
            self.enableResumable = enableResumable
            self.enableRewatching = enableRewatching
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(userID, forKey: "userId")
            encoder.encode(startIndex, forKey: "startIndex")
            encoder.encode(limit, forKey: "limit")
            encoder.encode(fields, forKey: "fields")
            encoder.encode(seriesID, forKey: "seriesId")
            encoder.encode(parentID, forKey: "parentId")
            encoder.encode(enableImages, forKey: "enableImages")
            encoder.encode(imageTypeLimit, forKey: "imageTypeLimit")
            encoder.encode(enableImageTypes, forKey: "enableImageTypes")
            encoder.encode(enableUserData, forKey: "enableUserData")
            encoder.encode(nextUpDateCutoff, forKey: "nextUpDateCutoff")
            encoder.encode(enableTotalRecordCount, forKey: "enableTotalRecordCount")
            encoder.encode(isDisableFirstEpisode, forKey: "disableFirstEpisode")
            encoder.encode(enableResumable, forKey: "enableResumable")
            encoder.encode(enableRewatching, forKey: "enableRewatching")
            return encoder.items
        }
    }
}
