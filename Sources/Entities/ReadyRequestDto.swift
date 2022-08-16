//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class ReadyRequest.
public struct ReadyRequestDto: Codable {
    /// Gets or sets a value indicating whether the client playback is unpaused.
    public var isPlaying: Bool?
    /// Gets or sets the playlist item identifier of the playing item.
    public var playlistItemID: UUID?
    /// Gets or sets the position ticks.
    public var positionTicks: Int?
    /// Gets or sets when the request has been made by the client.
    public var when: Date?

    public init(isPlaying: Bool? = nil, playlistItemID: UUID? = nil, positionTicks: Int? = nil, when: Date? = nil) {
        self.isPlaying = isPlaying
        self.playlistItemID = playlistItemID
        self.positionTicks = positionTicks
        self.when = when
    }
}
