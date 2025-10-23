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

public extension Paths {
    /// Gets the descriptor from an existing archive is present.
    static func getBackup(path: String) -> Request<JellyfinAPI.BackupManifestDto> {
        Request(path: "/Backup/Manifest", method: "GET", query: [("path", path)], id: "GetBackup")
    }
}
