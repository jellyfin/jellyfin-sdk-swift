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
    case sessions(initialDelayMs: Int = 0, intervalMs: Int = 10000)
    case scheduledTasks(initialDelayMs: Int = 0, intervalMs: Int = 60000)
    case activityLog(initialDelayMs: Int = 0, intervalMs: Int = 5000)

    /// Formats the subscription parameters as a string for the server
    var data: String? {
        let parameters: (Int, Int)
        switch self {
        case .sessions(let delay, let interval):
            parameters = (delay, interval)
        case .scheduledTasks(let delay, let interval):
            parameters = (delay, interval)
        case .activityLog(let delay, let interval):
            parameters = (delay, interval)
        }
        return "\(parameters.0),\(parameters.1)"
    }
}
