//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class PlayQueueUpdate.
public struct PlayQueueUpdate: Codable, Hashable {
    /// Gets a value indicating whether the current item is playing.
    public var isPlaying: Bool?
    /// Gets the UTC time of the last change to the playing queue.
    public var lastUpdate: Date?
    /// Gets the playing item index in the playlist.
    public var playingItemIndex: Int?
    /// Gets the playlist.
    public var playlist: [SyncPlayQueueItem]?
    /// Gets the request type that originated this update.
    public var reason: PlayQueueUpdateReason?
    /// Gets the repeat mode.
    public var repeatMode: GroupRepeatMode?
    /// Gets the shuffle mode.
    public var shuffleMode: GroupShuffleMode?
    /// Gets the start position ticks.
    public var startPositionTicks: Int?

    public init(
        isPlaying: Bool? = nil,
        lastUpdate: Date? = nil,
        playingItemIndex: Int? = nil,
        playlist: [SyncPlayQueueItem]? = nil,
        reason: PlayQueueUpdateReason? = nil,
        repeatMode: GroupRepeatMode? = nil,
        shuffleMode: GroupShuffleMode? = nil,
        startPositionTicks: Int? = nil
    ) {
        self.isPlaying = isPlaying
        self.lastUpdate = lastUpdate
        self.playingItemIndex = playingItemIndex
        self.playlist = playlist
        self.reason = reason
        self.repeatMode = repeatMode
        self.shuffleMode = shuffleMode
        self.startPositionTicks = startPositionTicks
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.isPlaying = try values.decodeIfPresent(Bool.self, forKey: "IsPlaying")
        self.lastUpdate = try values.decodeIfPresent(Date.self, forKey: "LastUpdate")
        self.playingItemIndex = try values.decodeIfPresent(Int.self, forKey: "PlayingItemIndex")
        self.playlist = try values.decodeIfPresent([SyncPlayQueueItem].self, forKey: "Playlist")
        self.reason = try values.decodeIfPresent(PlayQueueUpdateReason.self, forKey: "Reason")
        self.repeatMode = try values.decodeIfPresent(GroupRepeatMode.self, forKey: "RepeatMode")
        self.shuffleMode = try values.decodeIfPresent(GroupShuffleMode.self, forKey: "ShuffleMode")
        self.startPositionTicks = try values.decodeIfPresent(Int.self, forKey: "StartPositionTicks")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(isPlaying, forKey: "IsPlaying")
        try values.encodeIfPresent(lastUpdate, forKey: "LastUpdate")
        try values.encodeIfPresent(playingItemIndex, forKey: "PlayingItemIndex")
        try values.encodeIfPresent(playlist, forKey: "Playlist")
        try values.encodeIfPresent(reason, forKey: "Reason")
        try values.encodeIfPresent(repeatMode, forKey: "RepeatMode")
        try values.encodeIfPresent(shuffleMode, forKey: "ShuffleMode")
        try values.encodeIfPresent(startPositionTicks, forKey: "StartPositionTicks")
    }
}
