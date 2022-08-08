//
// Swiftfin is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get
import URLQueryEncoder

public extension Paths {
    /// Notify SyncPlay group that member is ready for playback.
    static func syncPlayReady(_ body: JellyfinAPI.ReadyRequestDto) -> Request<Void> {
        Request(method: "POST", url: "/SyncPlay/Ready", body: body, id: "SyncPlayReady")
    }
}
