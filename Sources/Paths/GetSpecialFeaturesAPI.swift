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
    /// Gets special features for an item.
    public static func getSpecialFeatures(itemID: String, userID: String? = nil) -> Request<[JellyfinAPI.BaseItemDto]> {
        Request(
            path: "/Items/\(itemID)/SpecialFeatures",
            method: "GET",
            query: makeGetSpecialFeaturesQuery(userID),
            id: "GetSpecialFeatures"
        )
    }

    private static func makeGetSpecialFeaturesQuery(_ userID: String?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(userID, forKey: "userId")
        return encoder.items
    }
}
