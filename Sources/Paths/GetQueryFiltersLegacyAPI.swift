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
    /// Gets legacy query filters.
    static func getQueryFiltersLegacy(parameters: GetQueryFiltersLegacyParameters? = nil) -> Request<JellyfinAPI.QueryFiltersLegacy> {
        Request(path: "/Items/Filters", method: "GET", query: parameters?.asQuery, id: "GetQueryFiltersLegacy")
    }

    struct GetQueryFiltersLegacyParameters {
        public var userID: String?
        public var parentID: String?
        public var includeItemTypes: [JellyfinAPI.BaseItemKind]?
        public var mediaTypes: [JellyfinAPI.MediaType]?

        public init(
            userID: String? = nil,
            parentID: String? = nil,
            includeItemTypes: [JellyfinAPI.BaseItemKind]? = nil,
            mediaTypes: [JellyfinAPI.MediaType]? = nil
        ) {
            self.userID = userID
            self.parentID = parentID
            self.includeItemTypes = includeItemTypes
            self.mediaTypes = mediaTypes
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(userID, forKey: "userId")
            encoder.encode(parentID, forKey: "parentId")
            encoder.encode(includeItemTypes, forKey: "includeItemTypes")
            encoder.encode(mediaTypes, forKey: "mediaTypes")
            return encoder.items
        }
    }
}
