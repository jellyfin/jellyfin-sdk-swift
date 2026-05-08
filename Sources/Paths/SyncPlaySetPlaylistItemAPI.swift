//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get

public extension Paths {
    /// Request to change playlist item in SyncPlay group.
    static func syncPlaySetPlaylistItem(_ body: SetPlaylistItemRequestDto) -> Request<Void> {
        Request(path: "/SyncPlay/SetPlaylistItem", method: "POST", body: body, id: "SyncPlaySetPlaylistItem")
    }
}
