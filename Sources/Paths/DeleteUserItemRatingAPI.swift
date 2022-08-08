//
// Swiftfin is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get
import URLQueryEncoder

public extension Paths {
    /// Deletes a user's saved personal rating for an item.
    static func deleteUserItemRating(userID: String, itemID: String) -> Request<JellyfinAPI.UserItemDataDto> {
        Request(method: "DELETE", url: "/Users/\(userID)/Items/\(itemID)/Rating", id: "DeleteUserItemRating")
    }
}
