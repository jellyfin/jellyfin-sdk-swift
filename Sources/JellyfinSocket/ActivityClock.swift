//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import Foundation

final class ActivityClock: @unchecked Sendable {

    private let lock = NSLock()
    private var instant: ContinuousClock.Instant = .now

    func touch() {
        lock.lock()
        defer { lock.unlock() }
        instant = .now
    }

    var elapsed: Duration {
        lock.lock()
        defer { lock.unlock() }
        return instant.duration(to: .now)
    }
}
