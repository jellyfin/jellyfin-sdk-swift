//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Enum PlaybackRequestType.
public enum PlaybackRequestType: String, Codable, CaseIterable {
    case play = "Play"
    case setPlaylistItem = "SetPlaylistItem"
    case removeFromPlaylist = "RemoveFromPlaylist"
    case movePlaylistItem = "MovePlaylistItem"
    case queue = "Queue"
    case unpause = "Unpause"
    case pause = "Pause"
    case stop = "Stop"
    case seek = "Seek"
    case buffer = "Buffer"
    case ready = "Ready"
    case nextItem = "NextItem"
    case previousItem = "PreviousItem"
    case setRepeatMode = "SetRepeatMode"
    case setShuffleMode = "SetShuffleMode"
    case ping = "Ping"
    case ignoreWait = "IgnoreWait"
}
