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
    /// Delete an item's image.
    public static func deleteItemImage(itemID: String, imageType: String, imageIndex: Int? = nil) -> Request<Void> {
        Request(
            path: "/Items/\(itemID)/Images/\(imageType)",
            method: "DELETE",
            query: makeDeleteItemImageQuery(imageIndex),
            id: "DeleteItemImage"
        )
    }

    private static func makeDeleteItemImageQuery(_ imageIndex: Int?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(imageIndex, forKey: "imageIndex")
        return encoder.items
    }
}
