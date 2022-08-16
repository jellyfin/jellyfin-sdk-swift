//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class PlaybackProgressInfo.
public struct PlaybackProgressInfo: Codable {
    public var aspectRatio: String?
    /// Gets or sets the index of the audio stream.
    public var audioStreamIndex: Int?
    public var brightness: Int?
    /// Gets or sets a value indicating whether this instance can seek.
    public var canSeek: Bool?
    /// Gets or sets a value indicating whether this instance is muted.
    public var isMuted: Bool?
    /// Gets or sets a value indicating whether this instance is paused.
    public var isPaused: Bool?
    /// Gets or sets the item.
    public var item: BaseItemDto?
    /// Gets or sets the item identifier.
    public var itemID: UUID?
    /// Gets or sets the live stream identifier.
    public var liveStreamID: String?
    /// Gets or sets the media version identifier.
    public var mediaSourceID: String?
    public var nowPlayingQueue: [QueueItem]?
    /// Gets or sets the play method.
    public var playMethod: PlayMethod?
    /// Gets or sets the play session identifier.
    public var playSessionID: String?
    public var playbackStartTimeTicks: Int?
    public var playlistItemID: String?
    /// Gets or sets the position ticks.
    public var positionTicks: Int?
    /// Gets or sets the repeat mode.
    public var repeatMode: RepeatMode?
    /// Gets or sets the session id.
    public var sessionID: String?
    /// Gets or sets the index of the subtitle stream.
    public var subtitleStreamIndex: Int?
    /// Gets or sets the volume level.
    public var volumeLevel: Int?

    public init(
        aspectRatio: String? = nil,
        audioStreamIndex: Int? = nil,
        brightness: Int? = nil,
        canSeek: Bool? = nil,
        isMuted: Bool? = nil,
        isPaused: Bool? = nil,
        item: BaseItemDto? = nil,
        itemID: UUID? = nil,
        liveStreamID: String? = nil,
        mediaSourceID: String? = nil,
        nowPlayingQueue: [QueueItem]? = nil,
        playMethod: PlayMethod? = nil,
        playSessionID: String? = nil,
        playbackStartTimeTicks: Int? = nil,
        playlistItemID: String? = nil,
        positionTicks: Int? = nil,
        repeatMode: RepeatMode? = nil,
        sessionID: String? = nil,
        subtitleStreamIndex: Int? = nil,
        volumeLevel: Int? = nil
    ) {
        self.aspectRatio = aspectRatio
        self.audioStreamIndex = audioStreamIndex
        self.brightness = brightness
        self.canSeek = canSeek
        self.isMuted = isMuted
        self.isPaused = isPaused
        self.item = item
        self.itemID = itemID
        self.liveStreamID = liveStreamID
        self.mediaSourceID = mediaSourceID
        self.nowPlayingQueue = nowPlayingQueue
        self.playMethod = playMethod
        self.playSessionID = playSessionID
        self.playbackStartTimeTicks = playbackStartTimeTicks
        self.playlistItemID = playlistItemID
        self.positionTicks = positionTicks
        self.repeatMode = repeatMode
        self.sessionID = sessionID
        self.subtitleStreamIndex = subtitleStreamIndex
        self.volumeLevel = volumeLevel
    }
}
