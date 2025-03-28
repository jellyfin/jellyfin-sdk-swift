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
    /// Refreshes metadata for an item.
    static func refreshItem(itemID: String, parameters: RefreshItemParameters? = nil) -> Request<Void> {
        Request(path: "/Items/\(itemID)/Refresh", method: "POST", query: parameters?.asQuery, id: "RefreshItem")
    }

    struct RefreshItemParameters {
        public var metadataRefreshMode: MetadataRefreshMode?
        public var imageRefreshMode: ImageRefreshMode?
        public var isReplaceAllMetadata: Bool?
        public var isReplaceAllImages: Bool?
        public var isRegenerateTrickplay: Bool?

        public typealias MetadataRefreshMode = JellyfinAPI.MetadataRefreshMode

        public typealias ImageRefreshMode = JellyfinAPI.MetadataRefreshMode

        public init(
            metadataRefreshMode: MetadataRefreshMode? = nil,
            imageRefreshMode: ImageRefreshMode? = nil,
            isReplaceAllMetadata: Bool? = nil,
            isReplaceAllImages: Bool? = nil,
            isRegenerateTrickplay: Bool? = nil
        ) {
            self.metadataRefreshMode = metadataRefreshMode
            self.imageRefreshMode = imageRefreshMode
            self.isReplaceAllMetadata = isReplaceAllMetadata
            self.isReplaceAllImages = isReplaceAllImages
            self.isRegenerateTrickplay = isRegenerateTrickplay
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(metadataRefreshMode, forKey: "metadataRefreshMode")
            encoder.encode(imageRefreshMode, forKey: "imageRefreshMode")
            encoder.encode(isReplaceAllMetadata, forKey: "replaceAllMetadata")
            encoder.encode(isReplaceAllImages, forKey: "replaceAllImages")
            encoder.encode(isRegenerateTrickplay, forKey: "regenerateTrickplay")
            return encoder.items
        }
    }
}
