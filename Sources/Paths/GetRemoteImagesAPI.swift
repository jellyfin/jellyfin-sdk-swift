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
    /// Gets available remote images for an item.
    static func getRemoteImages(itemID: String, parameters: GetRemoteImagesParameters? = nil) -> Request<RemoteImageResult> {
        Request(path: "/Items/\(itemID)/RemoteImages", method: "GET", query: parameters?.asQuery, id: "GetRemoteImages")
    }

    struct GetRemoteImagesParameters {
        public var type: ImageType?
        public var startIndex: Int?
        public var limit: Int?
        public var providerName: String?
        public var isIncludeAllLanguages: Bool?

        public init(
            type: ImageType? = nil,
            startIndex: Int? = nil,
            limit: Int? = nil,
            providerName: String? = nil,
            isIncludeAllLanguages: Bool? = nil
        ) {
            self.type = type
            self.startIndex = startIndex
            self.limit = limit
            self.providerName = providerName
            self.isIncludeAllLanguages = isIncludeAllLanguages
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(type, forKey: "type")
            encoder.encode(startIndex, forKey: "startIndex")
            encoder.encode(limit, forKey: "limit")
            encoder.encode(providerName, forKey: "providerName")
            encoder.encode(isIncludeAllLanguages, forKey: "includeAllLanguages")
            return encoder.items
        }
    }
}
