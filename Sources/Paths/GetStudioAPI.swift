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
    /// Gets a studio by name.
    public static func getStudio(name: String, userID: String? = nil) -> Request<JellyfinAPI.BaseItemDto> {
        Request(path: "/Studios/\(name)", method: "GET", query: makeGetStudioQuery(userID), id: "GetStudio")
    }

    private static func makeGetStudioQuery(_ userID: String?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(userID, forKey: "userId")
        return encoder.items
    }
}
