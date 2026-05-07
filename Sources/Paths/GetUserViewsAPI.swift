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
    /// Get user views.
    static func getUserViews(parameters: GetUserViewsParameters? = nil) -> Request<BaseItemDtoQueryResult> {
        Request(path: "/UserViews", method: "GET", query: parameters?.asQuery, id: "GetUserViews")
    }

    struct GetUserViewsParameters {
        public var userID: String?
        public var isIncludeexternalcontent: Bool?
        public var presetViews: [CollectionType]?
        public var isIncludehidden: Bool?

        public init(
            userID: String? = nil,
            isIncludeexternalcontent: Bool? = nil,
            presetViews: [CollectionType]? = nil,
            isIncludehidden: Bool? = nil
        ) {
            self.userID = userID
            self.isIncludeexternalcontent = isIncludeexternalcontent
            self.presetViews = presetViews
            self.isIncludehidden = isIncludehidden
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(userID, forKey: "userId")
            encoder.encode(isIncludeexternalcontent, forKey: "includeExternalContent")
            encoder.encode(presetViews, forKey: "presetViews")
            encoder.encode(isIncludehidden, forKey: "includeHidden")
            return encoder.items
        }
    }
}
