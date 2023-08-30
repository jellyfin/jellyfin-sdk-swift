//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get
import URLQueryEncoder

public extension Paths {
    /// Notify SyncPlay group that member is buffering.
    static func syncPlayBuffering(_ body: JellyfinAPI.BufferRequestDto) -> Request<Void> {
        Request(path: "/SyncPlay/Buffering", method: "POST", body: body, id: "SyncPlayBuffering")
    }
}
