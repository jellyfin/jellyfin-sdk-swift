//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Enum TaskCompletionStatus.
public enum TaskCompletionStatus: String, Codable, CaseIterable {
    case completed = "Completed"
    case failed = "Failed"
    case cancelled = "Cancelled"
    case aborted = "Aborted"
}
