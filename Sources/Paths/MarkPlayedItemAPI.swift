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
    /// Marks an item as played for user.
    public static func markPlayedItem(
        itemID: String,
        userID: String? = nil,
        datePlayed: Date? = nil
    ) -> Request<JellyfinAPI.UserItemDataDto> {
        Request(
            path: "/UserPlayedItems/\(itemID)",
            method: "POST",
            query: makeMarkPlayedItemQuery(userID, datePlayed),
            id: "MarkPlayedItem"
        )
    }

    private static func makeMarkPlayedItemQuery(_ userID: String?, _ datePlayed: Date?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(userID, forKey: "userId")
        encoder.encode(datePlayed, forKey: "datePlayed")
        return encoder.items
    }
}
