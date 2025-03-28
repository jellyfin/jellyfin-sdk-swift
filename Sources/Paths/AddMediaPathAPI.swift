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
    /// Add a media path to a library.
    public static func addMediaPath(isRefreshLibrary: Bool? = nil, _ body: JellyfinAPI.MediaPathDto) -> Request<Void> {
        Request(
            path: "/Library/VirtualFolders/Paths",
            method: "POST",
            query: makeAddMediaPathQuery(isRefreshLibrary),
            body: body,
            id: "AddMediaPath"
        )
    }

    private static func makeAddMediaPathQuery(_ isRefreshLibrary: Bool?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(isRefreshLibrary, forKey: "refreshLibrary")
        return encoder.items
    }
}
