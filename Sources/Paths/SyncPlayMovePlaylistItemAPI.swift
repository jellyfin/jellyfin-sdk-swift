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

public extension Paths {
    /// Request to move an item in the playlist in SyncPlay group.
    static func syncPlayMovePlaylistItem(_ body: JellyfinAPI.MovePlaylistItemRequestDto) -> Request<Void> {
        Request(path: "/SyncPlay/MovePlaylistItem", method: "POST", body: body, id: "SyncPlayMovePlaylistItem")
    }
}
