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
    /// Get user views.
    static func getUserViews(userID: String, parameters: GetUserViewsParameters? = nil) -> Request<JellyfinAPI.BaseItemDtoQueryResult> {
        Request(method: "GET", url: "/Users/\(userID)/Views", query: parameters?.asQuery, id: "GetUserViews")
    }

    struct GetUserViewsParameters {
        public var isIncludeExternalContent: Bool?
        public var presetViews: [String]?
        public var isIncludeHidden: Bool?

        public init(isIncludeExternalContent: Bool? = nil, presetViews: [String]? = nil, isIncludeHidden: Bool? = nil) {
            self.isIncludeExternalContent = isIncludeExternalContent
            self.presetViews = presetViews
            self.isIncludeHidden = isIncludeHidden
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(isIncludeExternalContent, forKey: "includeExternalContent")
            encoder.encode(presetViews, forKey: "presetViews")
            encoder.encode(isIncludeHidden, forKey: "includeHidden")
            return encoder.items
        }
    }
}
