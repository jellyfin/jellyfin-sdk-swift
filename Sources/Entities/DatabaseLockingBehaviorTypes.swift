//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Defines all possible methods for locking database access for concurrent queries.
public enum DatabaseLockingBehaviorTypes: String, Codable, CaseIterable {
    case noLock = "NoLock"
    case pessimistic = "Pessimistic"
    case optimistic = "Optimistic"
}
