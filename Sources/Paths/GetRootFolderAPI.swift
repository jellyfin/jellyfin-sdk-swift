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
    /// Gets the root folder from a user's library.
    public static func getRootFolder(userID: String? = nil) -> Request<JellyfinAPI.BaseItemDto> {
        Request(path: "/Items/Root", method: "GET", query: makeGetRootFolderQuery(userID), id: "GetRootFolder")
    }

    private static func makeGetRootFolderQuery(_ userID: String?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(userID, forKey: "userId")
        return encoder.items
    }
}
