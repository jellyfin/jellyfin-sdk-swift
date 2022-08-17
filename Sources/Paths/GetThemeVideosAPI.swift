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
    /// Get theme videos for an item.
    static public func getThemeVideos(itemID: String, userID: UUID? = nil, isInheritFromParent: Bool? = nil) -> Request<JellyfinAPI.ThemeMediaResult> {
        Request(method: "GET", url: "/Items/\(itemID)/ThemeVideos", query: makeGetThemeVideosQuery(userID, isInheritFromParent), id: "GetThemeVideos")
    }

    private static func makeGetThemeVideosQuery(_ userID: UUID?, _ isInheritFromParent: Bool?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(userID, forKey: "userId")
        encoder.encode(isInheritFromParent, forKey: "inheritFromParent")
        return encoder.items
    }
}
