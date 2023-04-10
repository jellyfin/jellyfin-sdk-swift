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
    /// Updates a live tv timer.
    static func updateTimer(timerID: String, _ body: JellyfinAPI.TimerInfoDto? = nil) -> Request<Void> {
        Request(method: "POST", url: "/LiveTv/Timers/\(timerID)", body: body, id: "UpdateTimer")
    }
}
