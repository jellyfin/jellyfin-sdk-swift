//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct PlayerStateInfo: Codable {
    /// Gets or sets the index of the now playing audio stream.
    public var audioStreamIndex: Int?
    /// Gets or sets a value indicating whether this instance can seek.
    public var canSeek: Bool?
    /// Gets or sets a value indicating whether this instance is muted.
    public var isMuted: Bool?
    /// Gets or sets a value indicating whether this instance is paused.
    public var isPaused: Bool?
    /// Gets or sets the now playing live stream identifier.
    public var liveStreamID: String?
    /// Gets or sets the now playing media version identifier.
    public var mediaSourceID: String?
    /// Gets or sets the play method.
    public var playMethod: PlayMethod?
    /// Gets or sets the now playing position ticks.
    public var positionTicks: Int?
    /// Gets or sets the repeat mode.
    public var repeatMode: RepeatMode?
    /// Gets or sets the index of the now playing subtitle stream.
    public var subtitleStreamIndex: Int?
    /// Gets or sets the volume level.
    public var volumeLevel: Int?

    public init(
        audioStreamIndex: Int? = nil,
        canSeek: Bool? = nil,
        isMuted: Bool? = nil,
        isPaused: Bool? = nil,
        liveStreamID: String? = nil,
        mediaSourceID: String? = nil,
        playMethod: PlayMethod? = nil,
        positionTicks: Int? = nil,
        repeatMode: RepeatMode? = nil,
        subtitleStreamIndex: Int? = nil,
        volumeLevel: Int? = nil
    ) {
        self.audioStreamIndex = audioStreamIndex
        self.canSeek = canSeek
        self.isMuted = isMuted
        self.isPaused = isPaused
        self.liveStreamID = liveStreamID
        self.mediaSourceID = mediaSourceID
        self.playMethod = playMethod
        self.positionTicks = positionTicks
        self.repeatMode = repeatMode
        self.subtitleStreamIndex = subtitleStreamIndex
        self.volumeLevel = volumeLevel
    }
}
