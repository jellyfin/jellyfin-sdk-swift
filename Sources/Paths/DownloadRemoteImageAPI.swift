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
    /// Downloads a remote image for an item.
    static func downloadRemoteImage(itemID: String, parameters: DownloadRemoteImageParameters) -> Request<Void> {
        Request(path: "/Items/\(itemID)/RemoteImages/Download", method: "POST", query: parameters.asQuery, id: "DownloadRemoteImage")
    }

    struct DownloadRemoteImageParameters {
        /// Enum ImageType.
        public var type: `Type`
        public var imageURL: String?

        public typealias `Type` = JellyfinAPI.ImageType

        public init(type: Type, imageURL: String? = nil) {
            self.type = type
            self.imageURL = imageURL
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(type, forKey: "type")
            encoder.encode(imageURL, forKey: "imageUrl")
            return encoder.items
        }
    }
}
