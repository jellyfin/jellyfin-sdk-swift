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
    /// Gets suggestions.
    static func getSuggestions(userID: String, parameters: GetSuggestionsParameters? = nil) -> Request<JellyfinAPI.BaseItemDtoQueryResult> {
        Request(method: "GET", url: "/Users/\(userID)/Suggestions", query: parameters?.asQuery, id: "GetSuggestions")
    }

    struct GetSuggestionsParameters {
        public var mediaType: [String]?
        public var type: [JellyfinAPI.BaseItemKind]?
        public var startIndex: Int?
        public var limit: Int?
        public var enableTotalRecordCount: Bool?

        public init(
            mediaType: [String]? = nil,
            type: [JellyfinAPI.BaseItemKind]? = nil,
            startIndex: Int? = nil,
            limit: Int? = nil,
            enableTotalRecordCount: Bool? = nil
        ) {
            self.mediaType = mediaType
            self.type = type
            self.startIndex = startIndex
            self.limit = limit
            self.enableTotalRecordCount = enableTotalRecordCount
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(mediaType, forKey: "mediaType")
            encoder.encode(type, forKey: "type")
            encoder.encode(startIndex, forKey: "startIndex")
            encoder.encode(limit, forKey: "limit")
            encoder.encode(enableTotalRecordCount, forKey: "enableTotalRecordCount")
            return encoder.items
        }
    }
}
