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
    /// Unmarks item as a favorite.
    public static func unmarkFavoriteItem(itemID: String, userID: String? = nil) -> Request<JellyfinAPI.UserItemDataDto> {
        Request(
            path: "/UserFavoriteItems/\(itemID)",
            method: "DELETE",
            query: makeUnmarkFavoriteItemQuery(userID),
            id: "UnmarkFavoriteItem"
        )
    }

    private static func makeUnmarkFavoriteItemQuery(_ userID: String?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(userID, forKey: "userId")
        return encoder.items
    }
}
