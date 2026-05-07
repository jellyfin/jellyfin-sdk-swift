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
    /// Get theme videos for an item.
    static func getThemeVideos(itemID: String, parameters: GetThemeVideosParameters? = nil) -> Request<ThemeMediaResult> {
        Request(path: "/Items/\(itemID)/ThemeVideos", method: "GET", query: parameters?.asQuery, id: "GetThemeVideos")
    }

    struct GetThemeVideosParameters {
        public var userID: String?
        public var isInheritfromparent: Bool?
        public var sortBy: [ItemSortBy]?
        public var sortOrder: [SortOrder]?

        public init(userID: String? = nil, isInheritfromparent: Bool? = nil, sortBy: [ItemSortBy]? = nil, sortOrder: [SortOrder]? = nil) {
            self.userID = userID
            self.isInheritfromparent = isInheritfromparent
            self.sortBy = sortBy
            self.sortOrder = sortOrder
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(userID, forKey: "userId")
            encoder.encode(isInheritfromparent, forKey: "inheritFromParent")
            encoder.encode(sortBy, forKey: "sortBy")
            encoder.encode(sortOrder, forKey: "sortOrder")
            return encoder.items
        }
    }
}
