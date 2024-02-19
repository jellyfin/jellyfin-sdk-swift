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
    /// Leave the joined SyncPlay group.
    static var syncPlayLeaveGroup: Request<Void> {
        Request(path: "/SyncPlay/Leave", method: "POST", id: "SyncPlayLeaveGroup")
    }
}
