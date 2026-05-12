//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import Foundation

final class SingleContinuation<Value: Sendable>: @unchecked Sendable {

    private let lock = NSLock()
    private var continuation: CheckedContinuation<Value, Error>?

    init(_ continuation: CheckedContinuation<Value, Error>) {
        self.continuation = continuation
    }

    func resume(returning value: Value) {
        resume { $0.resume(returning: value) }
    }

    func resume(throwing error: Error) {
        resume { $0.resume(throwing: error) }
    }

    private func resume(_ body: (CheckedContinuation<Value, Error>) -> Void) {
        lock.lock()
        let continuation = continuation
        self.continuation = nil
        lock.unlock()

        if let continuation {
            body(continuation)
        }
    }
}
