//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

public enum SocketSubscription: Hashable {

    case activityLog(initialDelay: Duration = .seconds(5), interval: Duration = .seconds(5))
    case scheduledTasks(initialDelay: Duration = .zero, interval: Duration = .seconds(5))
    case sessions(initialDelay: Duration = .zero, interval: Duration = .seconds(2))

    var data: String {
        switch self {
        case .activityLog(let delay, let interval),
             .scheduledTasks(let delay, let interval),
             .sessions(let delay, let interval):
            return "\(toMilliseconds(delay)),\(toMilliseconds(interval))"
        }
    }

    private func toMilliseconds(_ duration: Duration) -> Int {
        Int(duration.components.seconds * 1000 + duration.components.attoseconds / 1_000_000_000_000_000)
    }
}
