//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2024 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Enum TaskState.
public enum TaskState: String, Codable, CaseIterable {
    case idle = "Idle"
    case cancelling = "Cancelling"
    case running = "Running"
}
