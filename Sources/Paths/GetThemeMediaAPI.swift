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

extension Paths {
    /// Get theme songs and videos for an item.
    public static func getThemeMedia(
        itemID: String,
        userID: String? = nil,
        isInheritFromParent: Bool? = nil
    ) -> Request<JellyfinAPI.AllThemeMediaResult> {
        Request(
            method: "GET",
            url: "/Items/\(itemID)/ThemeMedia",
            query: makeGetThemeMediaQuery(userID, isInheritFromParent),
            id: "GetThemeMedia"
        )
    }

    private static func makeGetThemeMediaQuery(_ userID: String?, _ isInheritFromParent: Bool?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(userID, forKey: "userId")
        encoder.encode(isInheritFromParent, forKey: "inheritFromParent")
        return encoder.items
    }
}
