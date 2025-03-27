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
    /// Gets intros to play before the main media item plays.
    public static func getIntros(itemID: String, userID: String? = nil) -> Request<JellyfinAPI.BaseItemDtoQueryResult> {
        Request(path: "/Items/\(itemID)/Intros", method: "GET", query: makeGetIntrosQuery(userID), id: "GetIntros")
    }

    private static func makeGetIntrosQuery(_ userID: String?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(userID, forKey: "userId")
        return encoder.items
    }
}
