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
    /// Refreshes metadata for an item.
    static func refreshItem(itemID: String, parameters: RefreshItemParameters? = nil) -> Request<Void> {
        Request(path: "/Items/\(itemID)/Refresh", method: "POST", query: parameters?.asQuery, id: "RefreshItem")
    }

    struct RefreshItemParameters {
        public var metadataRefreshMode: MetadataRefreshMode?
        public var imageRefreshMode: MetadataRefreshMode?
        public var isReplaceallmetadata: Bool?
        public var isReplaceallimages: Bool?
        public var isRegeneratetrickplay: Bool?

        public init(
            metadataRefreshMode: MetadataRefreshMode? = nil,
            imageRefreshMode: MetadataRefreshMode? = nil,
            isReplaceallmetadata: Bool? = nil,
            isReplaceallimages: Bool? = nil,
            isRegeneratetrickplay: Bool? = nil
        ) {
            self.metadataRefreshMode = metadataRefreshMode
            self.imageRefreshMode = imageRefreshMode
            self.isReplaceallmetadata = isReplaceallmetadata
            self.isReplaceallimages = isReplaceallimages
            self.isRegeneratetrickplay = isRegeneratetrickplay
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(metadataRefreshMode, forKey: "metadataRefreshMode")
            encoder.encode(imageRefreshMode, forKey: "imageRefreshMode")
            encoder.encode(isReplaceallmetadata, forKey: "replaceAllMetadata")
            encoder.encode(isReplaceallimages, forKey: "replaceAllImages")
            encoder.encode(isRegeneratetrickplay, forKey: "regenerateTrickplay")
            return encoder.items
        }
    }
}
