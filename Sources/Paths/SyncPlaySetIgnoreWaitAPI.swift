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
    /// Request SyncPlay group to ignore member during group-wait.
    static func syncPlaySetIgnoreWait(_ body: JellyfinAPI.IgnoreWaitRequestDto) -> Request<Void> {
        Request(path: "/SyncPlay/SetIgnoreWait", method: "POST", body: body, id: "SyncPlaySetIgnoreWait")
    }
}
