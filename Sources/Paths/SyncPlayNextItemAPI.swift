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
    /// Request next item in SyncPlay group.
    static func syncPlayNextItem(_ body: NextItemRequestDto) -> Request<Void> {
        Request(path: "/SyncPlay/NextItem", method: "POST", body: body, id: "SyncPlayNextItem")
    }
}
