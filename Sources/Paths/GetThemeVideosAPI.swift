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
    /// Get theme videos for an item.
    public static func getThemeVideos(
        itemID: String,
        userID: String? = nil,
        isInheritFromParent: Bool? = nil
    ) -> Request<JellyfinAPI.ThemeMediaResult> {
        Request(
            path: "/Items/\(itemID)/ThemeVideos",
            method: "GET",
            query: makeGetThemeVideosQuery(userID, isInheritFromParent),
            id: "GetThemeVideos"
        )
    }

    private static func makeGetThemeVideosQuery(_ userID: String?, _ isInheritFromParent: Bool?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(userID, forKey: "userId")
        encoder.encode(isInheritFromParent, forKey: "inheritFromParent")
        return encoder.items
    }
}
