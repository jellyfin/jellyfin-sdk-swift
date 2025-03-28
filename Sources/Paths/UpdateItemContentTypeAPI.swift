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
    /// Updates an item's content type.
    public static func updateItemContentType(itemID: String, contentType: String? = nil) -> Request<Void> {
        Request(
            path: "/Items/\(itemID)/ContentType",
            method: "POST",
            query: makeUpdateItemContentTypeQuery(contentType),
            id: "UpdateItemContentType"
        )
    }

    private static func makeUpdateItemContentTypeQuery(_ contentType: String?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(contentType, forKey: "contentType")
        return encoder.items
    }
}
