//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class PlaybackStopInfo.
public struct PlaybackStopInfo: Codable {
    /// Gets or sets a value indicating whether this MediaBrowser.Model.Session.PlaybackStopInfo is failed.
    public var isFailed: Bool?
    /// Gets or sets the item.
    public var item: BaseItemDto?
    /// Gets or sets the item identifier.
    public var itemID: UUID?
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
        itemID: UUID? = nil,
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
}
