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
    /// Removes a virtual folder.
    public static func removeVirtualFolder(name: String? = nil, isRefreshLibrary: Bool? = nil) -> Request<Void> {
        Request(
            path: "/Library/VirtualFolders",
            method: "DELETE",
            query: makeRemoveVirtualFolderQuery(name, isRefreshLibrary),
            id: "RemoveVirtualFolder"
        )
    }

    private static func makeRemoveVirtualFolderQuery(_ name: String?, _ isRefreshLibrary: Bool?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(name, forKey: "name")
        encoder.encode(isRefreshLibrary, forKey: "refreshLibrary")
        return encoder.items
    }
}
