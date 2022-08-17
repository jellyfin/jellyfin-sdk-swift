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
    /// Gets seasons for a tv series.
    static public func getSeasons(seriesID: String, parameters: GetSeasonsParameters? = nil) -> Request<JellyfinAPI.BaseItemDtoQueryResult> {
        Request(method: "GET", url: "/Shows/\(seriesID)/Seasons", query: parameters?.asQuery, id: "GetSeasons")
    }

    public struct GetSeasonsParameters {
        public var userID: UUID?
        public var fields: [JellyfinAPI.ItemFields]?
        public var isSpecialSeason: Bool?
        public var isMissing: Bool?
        public var adjacentTo: String?
        public var enableImages: Bool?
        public var imageTypeLimit: Int32?
        public var enableImageTypes: [JellyfinAPI.ImageType]?
        public var enableUserData: Bool?

        public init(userID: UUID? = nil, fields: [JellyfinAPI.ItemFields]? = nil, isSpecialSeason: Bool? = nil, isMissing: Bool? = nil, adjacentTo: String? = nil, enableImages: Bool? = nil, imageTypeLimit: Int32? = nil, enableImageTypes: [JellyfinAPI.ImageType]? = nil, enableUserData: Bool? = nil) {
            self.userID = userID
            self.fields = fields
            self.isSpecialSeason = isSpecialSeason
            self.isMissing = isMissing
            self.adjacentTo = adjacentTo
            self.enableImages = enableImages
            self.imageTypeLimit = imageTypeLimit
            self.enableImageTypes = enableImageTypes
            self.enableUserData = enableUserData
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(userID, forKey: "userId")
            encoder.encode(fields, forKey: "fields")
            encoder.encode(isSpecialSeason, forKey: "isSpecialSeason")
            encoder.encode(isMissing, forKey: "isMissing")
            encoder.encode(adjacentTo, forKey: "adjacentTo")
            encoder.encode(enableImages, forKey: "enableImages")
            encoder.encode(imageTypeLimit, forKey: "imageTypeLimit")
            encoder.encode(enableImageTypes, forKey: "enableImageTypes")
            encoder.encode(enableUserData, forKey: "enableUserData")
            return encoder.items
        }
    }
}
