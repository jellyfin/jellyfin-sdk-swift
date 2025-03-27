//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct PlayerStateInfo: Codable, Hashable {
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
    /// Gets or sets the playback order.
    public var playbackOrder: PlaybackOrder?
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
        playbackOrder: PlaybackOrder? = nil,
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
        self.playbackOrder = playbackOrder
        self.positionTicks = positionTicks
        self.repeatMode = repeatMode
        self.subtitleStreamIndex = subtitleStreamIndex
        self.volumeLevel = volumeLevel
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.audioStreamIndex = try values.decodeIfPresent(Int.self, forKey: "AudioStreamIndex")
        self.canSeek = try values.decodeIfPresent(Bool.self, forKey: "CanSeek")
        self.isMuted = try values.decodeIfPresent(Bool.self, forKey: "IsMuted")
        self.isPaused = try values.decodeIfPresent(Bool.self, forKey: "IsPaused")
        self.liveStreamID = try values.decodeIfPresent(String.self, forKey: "LiveStreamId")
        self.mediaSourceID = try values.decodeIfPresent(String.self, forKey: "MediaSourceId")
        self.playMethod = try values.decodeIfPresent(PlayMethod.self, forKey: "PlayMethod")
        self.playbackOrder = try values.decodeIfPresent(PlaybackOrder.self, forKey: "PlaybackOrder")
        self.positionTicks = try values.decodeIfPresent(Int.self, forKey: "PositionTicks")
        self.repeatMode = try values.decodeIfPresent(RepeatMode.self, forKey: "RepeatMode")
        self.subtitleStreamIndex = try values.decodeIfPresent(Int.self, forKey: "SubtitleStreamIndex")
        self.volumeLevel = try values.decodeIfPresent(Int.self, forKey: "VolumeLevel")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(audioStreamIndex, forKey: "AudioStreamIndex")
        try values.encodeIfPresent(canSeek, forKey: "CanSeek")
        try values.encodeIfPresent(isMuted, forKey: "IsMuted")
        try values.encodeIfPresent(isPaused, forKey: "IsPaused")
        try values.encodeIfPresent(liveStreamID, forKey: "LiveStreamId")
        try values.encodeIfPresent(mediaSourceID, forKey: "MediaSourceId")
        try values.encodeIfPresent(playMethod, forKey: "PlayMethod")
        try values.encodeIfPresent(playbackOrder, forKey: "PlaybackOrder")
        try values.encodeIfPresent(positionTicks, forKey: "PositionTicks")
        try values.encodeIfPresent(repeatMode, forKey: "RepeatMode")
        try values.encodeIfPresent(subtitleStreamIndex, forKey: "SubtitleStreamIndex")
        try values.encodeIfPresent(volumeLevel, forKey: "VolumeLevel")
    }
}
