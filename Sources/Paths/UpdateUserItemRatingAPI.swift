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
    /// Updates a user's rating for an item.
    public static func updateUserItemRating(
        itemID: String,
        userID: String? = nil,
        isLikes: Bool? = nil
    ) -> Request<JellyfinAPI.UserItemDataDto> {
        Request(
            path: "/UserItems/\(itemID)/Rating",
            method: "POST",
            query: makeUpdateUserItemRatingQuery(userID, isLikes),
            id: "UpdateUserItemRating"
        )
    }

    private static func makeUpdateUserItemRatingQuery(_ userID: String?, _ isLikes: Bool?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(userID, forKey: "userId")
        encoder.encode(isLikes, forKey: "likes")
        return encoder.items
    }
}
