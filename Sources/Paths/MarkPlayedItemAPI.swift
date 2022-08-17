//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get
import URLQueryEncoder

extension Paths {
    /// Marks an item as played for user.
    static public func markPlayedItem(userID: String, itemID: String, datePlayed: Date? = nil) -> Request<JellyfinAPI.UserItemDataDto> {
        Request(method: "POST", url: "/Users/\(userID)/PlayedItems/\(itemID)", query: makeMarkPlayedItemQuery(datePlayed), id: "MarkPlayedItem")
    }

    private static func makeMarkPlayedItemQuery(_ datePlayed: Date?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(datePlayed, forKey: "datePlayed")
        return encoder.items
    }
}
