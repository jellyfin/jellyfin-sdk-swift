//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2024 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get
import URLQueryEncoder

extension Paths {
    /// Updates a user's rating for an item.
    public static func updateUserItemRating(userID: String, itemID: String, isLikes: Bool? = nil) -> Request<JellyfinAPI.UserItemDataDto> {
        Request(
            path: "/Users/\(userID)/Items/\(itemID)/Rating",
            method: "POST",
            query: makeUpdateUserItemRatingQuery(isLikes),
            id: "UpdateUserItemRating"
        )
    }

    private static func makeUpdateUserItemRatingQuery(_ isLikes: Bool?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(isLikes, forKey: "likes")
        return encoder.items
    }
}
