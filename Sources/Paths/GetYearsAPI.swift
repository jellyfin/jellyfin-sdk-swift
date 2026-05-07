//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get

public extension Paths {
    /// Get years.
    static func getYears(parameters: GetYearsParameters? = nil) -> Request<BaseItemDtoQueryResult> {
        Request(path: "/Years", method: "GET", query: parameters?.asQuery, id: "GetYears")
    }

    struct GetYearsParameters {
        public var startIndex: Int?
        public var limit: Int?
        public var sortOrder: [SortOrder]?
        public var parentID: String?
        public var fields: [ItemFields]?
        public var excludeItemTypes: [BaseItemKind]?
        public var includeItemTypes: [BaseItemKind]?
        public var mediaTypes: [MediaType]?
        public var sortBy: [ItemSortBy]?
        public var enableUserData: Bool?
        public var imageTypeLimit: Int?
        public var enableImageTypes: [ImageType]?
        public var userID: String?
        public var isRecursive: Bool?
        public var enableImages: Bool?

        public init(
            startIndex: Int? = nil,
            limit: Int? = nil,
            sortOrder: [SortOrder]? = nil,
            parentID: String? = nil,
            fields: [ItemFields]? = nil,
            excludeItemTypes: [BaseItemKind]? = nil,
            includeItemTypes: [BaseItemKind]? = nil,
            mediaTypes: [MediaType]? = nil,
            sortBy: [ItemSortBy]? = nil,
            enableUserData: Bool? = nil,
            imageTypeLimit: Int? = nil,
            enableImageTypes: [ImageType]? = nil,
            userID: String? = nil,
            isRecursive: Bool? = nil,
            enableImages: Bool? = nil
        ) {
            self.startIndex = startIndex
            self.limit = limit
            self.sortOrder = sortOrder
            self.parentID = parentID
            self.fields = fields
            self.excludeItemTypes = excludeItemTypes
            self.includeItemTypes = includeItemTypes
            self.mediaTypes = mediaTypes
            self.sortBy = sortBy
            self.enableUserData = enableUserData
            self.imageTypeLimit = imageTypeLimit
            self.enableImageTypes = enableImageTypes
            self.userID = userID
            self.isRecursive = isRecursive
            self.enableImages = enableImages
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(startIndex, forKey: "startIndex")
            encoder.encode(limit, forKey: "limit")
            encoder.encode(sortOrder, forKey: "sortOrder")
            encoder.encode(parentID, forKey: "parentId")
            encoder.encode(fields, forKey: "fields")
            encoder.encode(excludeItemTypes, forKey: "excludeItemTypes")
            encoder.encode(includeItemTypes, forKey: "includeItemTypes")
            encoder.encode(mediaTypes, forKey: "mediaTypes")
            encoder.encode(sortBy, forKey: "sortBy")
            encoder.encode(enableUserData, forKey: "enableUserData")
            encoder.encode(imageTypeLimit, forKey: "imageTypeLimit")
            encoder.encode(enableImageTypes, forKey: "enableImageTypes")
            encoder.encode(userID, forKey: "userId")
            encoder.encode(isRecursive, forKey: "recursive")
            encoder.encode(enableImages, forKey: "enableImages")
            return encoder.items
        }
    }
}
