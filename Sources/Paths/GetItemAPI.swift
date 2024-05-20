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
    /// Gets an item from a user's library.
    public static func getItem(itemID: String, userID: String? = nil) -> Request<JellyfinAPI.BaseItemDto> {
        Request(path: "/Items/\(itemID)", method: "GET", query: makeGetItemQuery(userID), id: "GetItem")
    }

    private static func makeGetItemQuery(_ userID: String?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(userID, forKey: "userId")
        return encoder.items
    }
}
