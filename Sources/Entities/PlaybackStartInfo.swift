//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class PlaybackStartInfo.
public struct PlaybackStartInfo: Codable, Hashable {
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
    public var itemID: String?
    /// Gets or sets the live stream identifier.
    public var liveStreamID: String?
    /// Gets or sets the media version identifier.
    public var mediaSourceID: String?
    public var nowPlayingQueue: [QueueItem]?
    /// Gets or sets the play method.
    public var playMethod: PlayMethod?
    /// Gets or sets the play session identifier.
    public var playSessionID: String?
    /// Gets or sets the playback order.
    public var playbackOrder: PlaybackOrder?
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
        itemID: String? = nil,
        liveStreamID: String? = nil,
        mediaSourceID: String? = nil,
        nowPlayingQueue: [QueueItem]? = nil,
        playMethod: PlayMethod? = nil,
        playSessionID: String? = nil,
        playbackOrder: PlaybackOrder? = nil,
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
        self.playbackOrder = playbackOrder
        self.playbackStartTimeTicks = playbackStartTimeTicks
        self.playlistItemID = playlistItemID
        self.positionTicks = positionTicks
        self.repeatMode = repeatMode
        self.sessionID = sessionID
        self.subtitleStreamIndex = subtitleStreamIndex
        self.volumeLevel = volumeLevel
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.aspectRatio = try values.decodeIfPresent(String.self, forKey: "AspectRatio")
        self.audioStreamIndex = try values.decodeIfPresent(Int.self, forKey: "AudioStreamIndex")
        self.brightness = try values.decodeIfPresent(Int.self, forKey: "Brightness")
        self.canSeek = try values.decodeIfPresent(Bool.self, forKey: "CanSeek")
        self.isMuted = try values.decodeIfPresent(Bool.self, forKey: "IsMuted")
        self.isPaused = try values.decodeIfPresent(Bool.self, forKey: "IsPaused")
        self.item = try values.decodeIfPresent(BaseItemDto.self, forKey: "Item")
        self.itemID = try values.decodeIfPresent(String.self, forKey: "ItemId")
        self.liveStreamID = try values.decodeIfPresent(String.self, forKey: "LiveStreamId")
        self.mediaSourceID = try values.decodeIfPresent(String.self, forKey: "MediaSourceId")
        self.nowPlayingQueue = try values.decodeIfPresent([QueueItem].self, forKey: "NowPlayingQueue")
        self.playMethod = try values.decodeIfPresent(PlayMethod.self, forKey: "PlayMethod")
        self.playSessionID = try values.decodeIfPresent(String.self, forKey: "PlaySessionId")
        self.playbackOrder = try values.decodeIfPresent(PlaybackOrder.self, forKey: "PlaybackOrder")
        self.playbackStartTimeTicks = try values.decodeIfPresent(Int.self, forKey: "PlaybackStartTimeTicks")
        self.playlistItemID = try values.decodeIfPresent(String.self, forKey: "PlaylistItemId")
        self.positionTicks = try values.decodeIfPresent(Int.self, forKey: "PositionTicks")
        self.repeatMode = try values.decodeIfPresent(RepeatMode.self, forKey: "RepeatMode")
        self.sessionID = try values.decodeIfPresent(String.self, forKey: "SessionId")
        self.subtitleStreamIndex = try values.decodeIfPresent(Int.self, forKey: "SubtitleStreamIndex")
        self.volumeLevel = try values.decodeIfPresent(Int.self, forKey: "VolumeLevel")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(aspectRatio, forKey: "AspectRatio")
        try values.encodeIfPresent(audioStreamIndex, forKey: "AudioStreamIndex")
        try values.encodeIfPresent(brightness, forKey: "Brightness")
        try values.encodeIfPresent(canSeek, forKey: "CanSeek")
        try values.encodeIfPresent(isMuted, forKey: "IsMuted")
        try values.encodeIfPresent(isPaused, forKey: "IsPaused")
        try values.encodeIfPresent(item, forKey: "Item")
        try values.encodeIfPresent(itemID, forKey: "ItemId")
        try values.encodeIfPresent(liveStreamID, forKey: "LiveStreamId")
        try values.encodeIfPresent(mediaSourceID, forKey: "MediaSourceId")
        try values.encodeIfPresent(nowPlayingQueue, forKey: "NowPlayingQueue")
        try values.encodeIfPresent(playMethod, forKey: "PlayMethod")
        try values.encodeIfPresent(playSessionID, forKey: "PlaySessionId")
        try values.encodeIfPresent(playbackOrder, forKey: "PlaybackOrder")
        try values.encodeIfPresent(playbackStartTimeTicks, forKey: "PlaybackStartTimeTicks")
        try values.encodeIfPresent(playlistItemID, forKey: "PlaylistItemId")
        try values.encodeIfPresent(positionTicks, forKey: "PositionTicks")
        try values.encodeIfPresent(repeatMode, forKey: "RepeatMode")
        try values.encodeIfPresent(sessionID, forKey: "SessionId")
        try values.encodeIfPresent(subtitleStreamIndex, forKey: "SubtitleStreamIndex")
        try values.encodeIfPresent(volumeLevel, forKey: "VolumeLevel")
    }
}
