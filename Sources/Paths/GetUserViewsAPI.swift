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
    /// Get user views.
    static func getUserViews(parameters: GetUserViewsParameters? = nil) -> Request<JellyfinAPI.BaseItemDtoQueryResult> {
        Request(path: "/UserViews", method: "GET", query: parameters?.asQuery, id: "GetUserViews")
    }

    struct GetUserViewsParameters {
        public var userID: String?
        public var isIncludeExternalContent: Bool?
        public var presetViews: [JellyfinAPI.CollectionType]?
        public var isIncludeHidden: Bool?

        public init(
            userID: String? = nil,
            isIncludeExternalContent: Bool? = nil,
            presetViews: [JellyfinAPI.CollectionType]? = nil,
            isIncludeHidden: Bool? = nil
        ) {
            self.userID = userID
            self.isIncludeExternalContent = isIncludeExternalContent
            self.presetViews = presetViews
            self.isIncludeHidden = isIncludeHidden
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(userID, forKey: "userId")
            encoder.encode(isIncludeExternalContent, forKey: "includeExternalContent")
            encoder.encode(presetViews, forKey: "presetViews")
            encoder.encode(isIncludeHidden, forKey: "includeHidden")
            return encoder.items
        }
    }
}
