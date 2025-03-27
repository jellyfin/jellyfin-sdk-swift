//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Enum PlayQueueUpdateReason.
public enum PlayQueueUpdateReason: String, Codable, CaseIterable {
    case newPlaylist = "NewPlaylist"
    case setCurrentItem = "SetCurrentItem"
    case removeItems = "RemoveItems"
    case moveItem = "MoveItem"
    case queue = "Queue"
    case queueNext = "QueueNext"
    case nextItem = "NextItem"
    case previousItem = "PreviousItem"
    case repeatMode = "RepeatMode"
    case shuffleMode = "ShuffleMode"
}
