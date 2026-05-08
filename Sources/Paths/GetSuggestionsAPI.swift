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
    /// Gets suggestions.
    static func getSuggestions(parameters: GetSuggestionsParameters? = nil) -> Request<BaseItemDtoQueryResult> {
        Request(path: "/Items/Suggestions", method: "GET", query: parameters?.asQuery, id: "GetSuggestions")
    }

    struct GetSuggestionsParameters {
        public var userID: String?
        public var mediaType: [MediaType]?
        public var type: [BaseItemKind]?
        public var startIndex: Int?
        public var limit: Int?
        public var enableTotalRecordCount: Bool?

        public init(
            userID: String? = nil,
            mediaType: [MediaType]? = nil,
            type: [BaseItemKind]? = nil,
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
