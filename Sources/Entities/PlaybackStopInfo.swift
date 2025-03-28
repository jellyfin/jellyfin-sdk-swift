//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class PlaybackStopInfo.
public struct PlaybackStopInfo: Codable, Hashable {
    /// Gets or sets a value indicating whether this MediaBrowser.Model.Session.PlaybackStopInfo is failed.
    public var isFailed: Bool?
    /// Gets or sets the item.
    public var item: BaseItemDto?
    /// Gets or sets the item identifier.
    public var itemID: String?
    /// Gets or sets the live stream identifier.
    public var liveStreamID: String?
    /// Gets or sets the media version identifier.
    public var mediaSourceID: String?
    public var nextMediaType: String?
    public var nowPlayingQueue: [QueueItem]?
    /// Gets or sets the play session identifier.
    public var playSessionID: String?
    public var playlistItemID: String?
    /// Gets or sets the position ticks.
    public var positionTicks: Int?
    /// Gets or sets the session id.
    public var sessionID: String?

    public init(
        isFailed: Bool? = nil,
        item: BaseItemDto? = nil,
        itemID: String? = nil,
        liveStreamID: String? = nil,
        mediaSourceID: String? = nil,
        nextMediaType: String? = nil,
        nowPlayingQueue: [QueueItem]? = nil,
        playSessionID: String? = nil,
        playlistItemID: String? = nil,
        positionTicks: Int? = nil,
        sessionID: String? = nil
    ) {
        self.isFailed = isFailed
        self.item = item
        self.itemID = itemID
        self.liveStreamID = liveStreamID
        self.mediaSourceID = mediaSourceID
        self.nextMediaType = nextMediaType
        self.nowPlayingQueue = nowPlayingQueue
        self.playSessionID = playSessionID
        self.playlistItemID = playlistItemID
        self.positionTicks = positionTicks
        self.sessionID = sessionID
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.isFailed = try values.decodeIfPresent(Bool.self, forKey: "Failed")
        self.item = try values.decodeIfPresent(BaseItemDto.self, forKey: "Item")
        self.itemID = try values.decodeIfPresent(String.self, forKey: "ItemId")
        self.liveStreamID = try values.decodeIfPresent(String.self, forKey: "LiveStreamId")
        self.mediaSourceID = try values.decodeIfPresent(String.self, forKey: "MediaSourceId")
        self.nextMediaType = try values.decodeIfPresent(String.self, forKey: "NextMediaType")
        self.nowPlayingQueue = try values.decodeIfPresent([QueueItem].self, forKey: "NowPlayingQueue")
        self.playSessionID = try values.decodeIfPresent(String.self, forKey: "PlaySessionId")
        self.playlistItemID = try values.decodeIfPresent(String.self, forKey: "PlaylistItemId")
        self.positionTicks = try values.decodeIfPresent(Int.self, forKey: "PositionTicks")
        self.sessionID = try values.decodeIfPresent(String.self, forKey: "SessionId")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(isFailed, forKey: "Failed")
        try values.encodeIfPresent(item, forKey: "Item")
        try values.encodeIfPresent(itemID, forKey: "ItemId")
        try values.encodeIfPresent(liveStreamID, forKey: "LiveStreamId")
        try values.encodeIfPresent(mediaSourceID, forKey: "MediaSourceId")
        try values.encodeIfPresent(nextMediaType, forKey: "NextMediaType")
        try values.encodeIfPresent(nowPlayingQueue, forKey: "NowPlayingQueue")
        try values.encodeIfPresent(playSessionID, forKey: "PlaySessionId")
        try values.encodeIfPresent(playlistItemID, forKey: "PlaylistItemId")
        try values.encodeIfPresent(positionTicks, forKey: "PositionTicks")
        try values.encodeIfPresent(sessionID, forKey: "SessionId")
    }
}
