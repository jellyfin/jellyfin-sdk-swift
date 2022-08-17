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
    /// Creates an instant playlist based on a given playlist.
    static public func getInstantMixFromPlaylist(id: String, parameters: GetInstantMixFromPlaylistParameters? = nil) -> Request<JellyfinAPI.BaseItemDtoQueryResult> {
        Request(method: "GET", url: "/Playlists/\(id)/InstantMix", query: parameters?.asQuery, id: "GetInstantMixFromPlaylist")
    }

    public struct GetInstantMixFromPlaylistParameters {
        public var userID: String?
        public var limit: Int32?
        public var fields: [JellyfinAPI.ItemFields]?
        public var enableImages: Bool?
        public var enableUserData: Bool?
        public var imageTypeLimit: Int32?
        public var enableImageTypes: [JellyfinAPI.ImageType]?

        public init(userID: String? = nil, limit: Int32? = nil, fields: [JellyfinAPI.ItemFields]? = nil, enableImages: Bool? = nil, enableUserData: Bool? = nil, imageTypeLimit: Int32? = nil, enableImageTypes: [JellyfinAPI.ImageType]? = nil) {
            self.userID = userID
            self.limit = limit
            self.fields = fields
            self.enableImages = enableImages
            self.enableUserData = enableUserData
            self.imageTypeLimit = imageTypeLimit
            self.enableImageTypes = enableImageTypes
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(userID, forKey: "userId")
            encoder.encode(limit, forKey: "limit")
            encoder.encode(fields, forKey: "fields")
            encoder.encode(enableImages, forKey: "enableImages")
            encoder.encode(enableUserData, forKey: "enableUserData")
            encoder.encode(imageTypeLimit, forKey: "imageTypeLimit")
            encoder.encode(enableImageTypes, forKey: "enableImageTypes")
            return encoder.items
        }
    }
}
