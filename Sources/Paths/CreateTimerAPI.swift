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
    /// Creates a live tv timer.
    static func createTimer(_ body: TimerInfoDto? = nil) -> Request<Void> {
        Request(path: "/LiveTv/Timers", method: "POST", body: body, id: "CreateTimer")
    }
}
