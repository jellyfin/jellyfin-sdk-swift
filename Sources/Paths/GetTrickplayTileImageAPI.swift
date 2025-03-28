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

extension Paths {
    /// Gets a trickplay tile image.
    public static func getTrickplayTileImage(itemID: String, width: Int, index: Int, mediaSourceID: String? = nil) -> Request<Data> {
        Request(
            path: "/Videos/\(itemID)/Trickplay/\(width)/\(index).jpg",
            method: "GET",
            query: makeGetTrickplayTileImageQuery(mediaSourceID),
            id: "GetTrickplayTileImage"
        )
    }

    private static func makeGetTrickplayTileImageQuery(_ mediaSourceID: String?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(mediaSourceID, forKey: "mediaSourceId")
        return encoder.items
    }
}
