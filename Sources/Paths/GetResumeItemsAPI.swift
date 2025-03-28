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
    /// Gets items based on a query.
    static func getResumeItems(parameters: GetResumeItemsParameters? = nil) -> Request<JellyfinAPI.BaseItemDtoQueryResult> {
        Request(path: "/UserItems/Resume", method: "GET", query: parameters?.asQuery, id: "GetResumeItems")
    }

    struct GetResumeItemsParameters {
        public var userID: String?
        public var startIndex: Int?
        public var limit: Int?
        public var searchTerm: String?
        public var parentID: String?
        public var fields: [JellyfinAPI.ItemFields]?
        public var mediaTypes: [JellyfinAPI.MediaType]?
        public var enableUserData: Bool?
        public var imageTypeLimit: Int?
        public var enableImageTypes: [JellyfinAPI.ImageType]?
        public var excludeItemTypes: [JellyfinAPI.BaseItemKind]?
        public var includeItemTypes: [JellyfinAPI.BaseItemKind]?
        public var enableTotalRecordCount: Bool?
        public var enableImages: Bool?
        public var excludeActiveSessions: Bool?

        public init(
            userID: String? = nil,
            startIndex: Int? = nil,
            limit: Int? = nil,
            searchTerm: String? = nil,
            parentID: String? = nil,
            fields: [JellyfinAPI.ItemFields]? = nil,
            mediaTypes: [JellyfinAPI.MediaType]? = nil,
            enableUserData: Bool? = nil,
            imageTypeLimit: Int? = nil,
            enableImageTypes: [JellyfinAPI.ImageType]? = nil,
            excludeItemTypes: [JellyfinAPI.BaseItemKind]? = nil,
            includeItemTypes: [JellyfinAPI.BaseItemKind]? = nil,
            enableTotalRecordCount: Bool? = nil,
            enableImages: Bool? = nil,
            excludeActiveSessions: Bool? = nil
        ) {
            self.userID = userID
            self.startIndex = startIndex
            self.limit = limit
            self.searchTerm = searchTerm
            self.parentID = parentID
            self.fields = fields
            self.mediaTypes = mediaTypes
            self.enableUserData = enableUserData
            self.imageTypeLimit = imageTypeLimit
            self.enableImageTypes = enableImageTypes
            self.excludeItemTypes = excludeItemTypes
            self.includeItemTypes = includeItemTypes
            self.enableTotalRecordCount = enableTotalRecordCount
            self.enableImages = enableImages
            self.excludeActiveSessions = excludeActiveSessions
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(userID, forKey: "userId")
            encoder.encode(startIndex, forKey: "startIndex")
            encoder.encode(limit, forKey: "limit")
            encoder.encode(searchTerm, forKey: "searchTerm")
            encoder.encode(parentID, forKey: "parentId")
            encoder.encode(fields, forKey: "fields")
            encoder.encode(mediaTypes, forKey: "mediaTypes")
            encoder.encode(enableUserData, forKey: "enableUserData")
            encoder.encode(imageTypeLimit, forKey: "imageTypeLimit")
            encoder.encode(enableImageTypes, forKey: "enableImageTypes")
            encoder.encode(excludeItemTypes, forKey: "excludeItemTypes")
            encoder.encode(includeItemTypes, forKey: "includeItemTypes")
            encoder.encode(enableTotalRecordCount, forKey: "enableTotalRecordCount")
            encoder.encode(enableImages, forKey: "enableImages")
            encoder.encode(excludeActiveSessions, forKey: "excludeActiveSessions")
            return encoder.items
        }
    }
}
