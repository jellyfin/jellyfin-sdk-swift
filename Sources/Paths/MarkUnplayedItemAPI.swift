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
    /// Marks an item as unplayed for user.
    public static func markUnplayedItem(itemID: String, userID: String? = nil) -> Request<JellyfinAPI.UserItemDataDto> {
        Request(path: "/UserPlayedItems/\(itemID)", method: "DELETE", query: makeMarkUnplayedItemQuery(userID), id: "MarkUnplayedItem")
    }

    private static func makeMarkUnplayedItemQuery(_ userID: String?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(userID, forKey: "userId")
        return encoder.items
    }
}
