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
    /// Gets a SyncPlay group by id.
    static func syncPlayGetGroup(id: String) -> Request<GroupInfoDto> {
        Request(path: "/SyncPlay/\(id)", method: "GET", id: "SyncPlayGetGroup")
    }
}
