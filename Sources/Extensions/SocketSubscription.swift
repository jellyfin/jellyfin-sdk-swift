//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Types of subscriptions supported by the Jellyfin WebSocket
public enum SocketSubscription: Hashable {

    case activityLog(initialDelayMs: Int = 5000, intervalMs: Int = 5000)
    case scheduledTasks(initialDelayMs: Int = 0, intervalMs: Int = 5000)
    case sessions(initialDelayMs: Int = 0, intervalMs: Int = 2000)

    var data: String {
        switch self {
        case .activityLog(let delay, let interval),
             .scheduledTasks(let delay, let interval),
             .sessions(let delay, let interval):
            return "\(delay),\(interval)"
        }
    }
}
