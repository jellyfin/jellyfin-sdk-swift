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
    /// Get theme songs and videos for an item.
    static func getThemeMedia(itemID: String, parameters: GetThemeMediaParameters? = nil) -> Request<JellyfinAPI.AllThemeMediaResult> {
        Request(path: "/Items/\(itemID)/ThemeMedia", method: "GET", query: parameters?.asQuery, id: "GetThemeMedia")
    }

    struct GetThemeMediaParameters {
        public var userID: String?
        public var isInheritFromParent: Bool?
        public var sortBy: [JellyfinAPI.ItemSortBy]?
        public var sortOrder: [JellyfinAPI.SortOrder]?

        public init(
            userID: String? = nil,
            isInheritFromParent: Bool? = nil,
            sortBy: [JellyfinAPI.ItemSortBy]? = nil,
            sortOrder: [JellyfinAPI.SortOrder]? = nil
        ) {
            self.userID = userID
            self.isInheritFromParent = isInheritFromParent
            self.sortBy = sortBy
            self.sortOrder = sortOrder
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(userID, forKey: "userId")
            encoder.encode(isInheritFromParent, forKey: "inheritFromParent")
            encoder.encode(sortBy, forKey: "sortBy")
            encoder.encode(sortOrder, forKey: "sortOrder")
            return encoder.items
        }
    }
}
