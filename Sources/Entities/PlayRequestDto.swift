//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class PlayRequestDto.
public struct PlayRequestDto: Codable {
    /// Gets or sets the position of the playing item in the queue.
    public var playingItemPosition: Int32?
    /// Gets or sets the playing queue.
    public var playingQueue: [UUID]?
    /// Gets or sets the start position ticks.
    public var startPositionTicks: Int64?

    public init(playingItemPosition: Int32? = nil, playingQueue: [UUID]? = nil, startPositionTicks: Int64? = nil) {
        self.playingItemPosition = playingItemPosition
        self.playingQueue = playingQueue
        self.startPositionTicks = startPositionTicks
    }
}
