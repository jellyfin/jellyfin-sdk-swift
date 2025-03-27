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
    /// Gets suggestions.
    static func getSuggestions(parameters: GetSuggestionsParameters? = nil) -> Request<JellyfinAPI.BaseItemDtoQueryResult> {
        Request(path: "/Items/Suggestions", method: "GET", query: parameters?.asQuery, id: "GetSuggestions")
    }

    struct GetSuggestionsParameters {
        public var userID: String?
        public var mediaType: [JellyfinAPI.MediaType]?
        public var type: [JellyfinAPI.BaseItemKind]?
        public var startIndex: Int?
        public var limit: Int?
        public var enableTotalRecordCount: Bool?

        public init(
            userID: String? = nil,
            mediaType: [JellyfinAPI.MediaType]? = nil,
            type: [JellyfinAPI.BaseItemKind]? = nil,
            startIndex: Int? = nil,
            limit: Int? = nil,
            enableTotalRecordCount: Bool? = nil
        ) {
            self.userID = userID
            self.mediaType = mediaType
            self.type = type
            self.startIndex = startIndex
            self.limit = limit
            self.enableTotalRecordCount = enableTotalRecordCount
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(userID, forKey: "userId")
            encoder.encode(mediaType, forKey: "mediaType")
            encoder.encode(type, forKey: "type")
            encoder.encode(startIndex, forKey: "startIndex")
            encoder.encode(limit, forKey: "limit")
            encoder.encode(enableTotalRecordCount, forKey: "enableTotalRecordCount")
            return encoder.items
        }
    }
}
