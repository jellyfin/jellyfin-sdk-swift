//
//  ActivityClock.swift
//  JellyfinAPI
//
//  Created by Ethan Pippin on 5/12/26.
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
