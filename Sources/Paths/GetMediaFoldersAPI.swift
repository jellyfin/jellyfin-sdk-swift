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
    /// Gets all user media folders.
    public static func getMediaFolders(isHidden: Bool? = nil) -> Request<JellyfinAPI.BaseItemDtoQueryResult> {
        Request(path: "/Library/MediaFolders", method: "GET", query: makeGetMediaFoldersQuery(isHidden), id: "GetMediaFolders")
    }

    private static func makeGetMediaFoldersQuery(_ isHidden: Bool?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(isHidden, forKey: "isHidden")
        return encoder.items
    }
}
