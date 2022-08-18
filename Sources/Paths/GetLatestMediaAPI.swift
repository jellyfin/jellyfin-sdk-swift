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

public extension Paths {
    /// Gets latest media.
    static func getLatestMedia(userID: String, parameters: GetLatestMediaParameters? = nil) -> Request<[JellyfinAPI.BaseItemDto]> {
        Request(method: "GET", url: "/Users/\(userID)/Items/Latest", query: parameters?.asQuery, id: "GetLatestMedia")
    }

    struct GetLatestMediaParameters {
        public var parentID: String?
        public var fields: [JellyfinAPI.ItemFields]?
        public var includeItemTypes: [JellyfinAPI.BaseItemKind]?
        public var isPlayed: Bool?
        public var enableImages: Bool?
        public var imageTypeLimit: Int32?
        public var enableImageTypes: [JellyfinAPI.ImageType]?
        public var enableUserData: Bool?
        public var limit: Int32?
        public var isGroupItems: Bool?

        public init(
            parentID: String? = nil,
            fields: [JellyfinAPI.ItemFields]? = nil,
            includeItemTypes: [JellyfinAPI.BaseItemKind]? = nil,
            isPlayed: Bool? = nil,
            enableImages: Bool? = nil,
            imageTypeLimit: Int32? = nil,
            enableImageTypes: [JellyfinAPI.ImageType]? = nil,
            enableUserData: Bool? = nil,
            limit: Int32? = nil,
            isGroupItems: Bool? = nil
        ) {
            self.parentID = parentID
            self.fields = fields
            self.includeItemTypes = includeItemTypes
            self.isPlayed = isPlayed
            self.enableImages = enableImages
            self.imageTypeLimit = imageTypeLimit
            self.enableImageTypes = enableImageTypes
            self.enableUserData = enableUserData
            self.limit = limit
            self.isGroupItems = isGroupItems
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(parentID, forKey: "parentId")
            encoder.encode(fields, forKey: "fields")
            encoder.encode(includeItemTypes, forKey: "includeItemTypes")
            encoder.encode(isPlayed, forKey: "isPlayed")
            encoder.encode(enableImages, forKey: "enableImages")
            encoder.encode(imageTypeLimit, forKey: "imageTypeLimit")
            encoder.encode(enableImageTypes, forKey: "enableImageTypes")
            encoder.encode(enableUserData, forKey: "enableUserData")
            encoder.encode(limit, forKey: "limit")
            encoder.encode(isGroupItems, forKey: "groupItems")
            return encoder.items
        }
    }
}
