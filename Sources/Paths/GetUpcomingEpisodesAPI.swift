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
    /// Gets a list of upcoming episodes.
    static func getUpcomingEpisodes(parameters: GetUpcomingEpisodesParameters? = nil) -> Request<JellyfinAPI.BaseItemDtoQueryResult> {
        Request(path: "/Shows/Upcoming", method: "GET", query: parameters?.asQuery, id: "GetUpcomingEpisodes")
    }

    struct GetUpcomingEpisodesParameters {
        public var userID: String?
        public var startIndex: Int?
        public var limit: Int?
        public var fields: [JellyfinAPI.ItemFields]?
        public var parentID: String?
        public var enableImages: Bool?
        public var imageTypeLimit: Int?
        public var enableImageTypes: [JellyfinAPI.ImageType]?
        public var enableUserData: Bool?

        public init(
            userID: String? = nil,
            startIndex: Int? = nil,
            limit: Int? = nil,
            fields: [JellyfinAPI.ItemFields]? = nil,
            parentID: String? = nil,
            enableImages: Bool? = nil,
            imageTypeLimit: Int? = nil,
            enableImageTypes: [JellyfinAPI.ImageType]? = nil,
            enableUserData: Bool? = nil
        ) {
            self.userID = userID
            self.startIndex = startIndex
            self.limit = limit
            self.fields = fields
            self.parentID = parentID
            self.enableImages = enableImages
            self.imageTypeLimit = imageTypeLimit
            self.enableImageTypes = enableImageTypes
            self.enableUserData = enableUserData
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(userID, forKey: "userId")
            encoder.encode(startIndex, forKey: "startIndex")
            encoder.encode(limit, forKey: "limit")
            encoder.encode(fields, forKey: "fields")
            encoder.encode(parentID, forKey: "parentId")
            encoder.encode(enableImages, forKey: "enableImages")
            encoder.encode(imageTypeLimit, forKey: "imageTypeLimit")
            encoder.encode(enableImageTypes, forKey: "enableImageTypes")
            encoder.encode(enableUserData, forKey: "enableUserData")
            return encoder.items
        }
    }
}
