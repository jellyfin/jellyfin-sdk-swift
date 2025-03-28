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
    /// Deletes a user's saved personal rating for an item.
    public static func deleteUserItemRating(itemID: String, userID: String? = nil) -> Request<JellyfinAPI.UserItemDataDto> {
        Request(
            path: "/UserItems/\(itemID)/Rating",
            method: "DELETE",
            query: makeDeleteUserItemRatingQuery(userID),
            id: "DeleteUserItemRating"
        )
    }

    private static func makeDeleteUserItemRatingQuery(_ userID: String?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(userID, forKey: "userId")
        return encoder.items
    }
}
