//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get
import URLQueryEncoder

public extension Paths {
    /// Marks an item as unplayed for user.
    static func markUnplayedItem(userID: String, itemID: String) -> Request<JellyfinAPI.UserItemDataDto> {
        Request(path: "/Users/\(userID)/PlayedItems/\(itemID)", method: "DELETE", id: "MarkUnplayedItem")
    }
}
