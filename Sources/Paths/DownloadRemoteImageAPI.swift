//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get

extension Paths {
    /// Downloads a remote image for an item.
    public static func downloadRemoteImage(itemID: String, type: ImageType, imageURL: String? = nil) -> Request<Void> {
        Request(
            path: "/Items/\(itemID)/RemoteImages/Download",
            method: "POST",
            query: makeDownloadRemoteImageQuery(type, imageURL),
            id: "DownloadRemoteImage"
        )
    }

    private static func makeDownloadRemoteImageQuery(_ type: ImageType, _ imageURL: String?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(type, forKey: "type")
        encoder.encode(imageURL, forKey: "imageUrl")
        return encoder.items
    }
}
