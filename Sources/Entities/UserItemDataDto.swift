//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class UserItemDataDto.
public struct UserItemDataDto: Codable {
    /// Gets or sets a value indicating whether this instance is favorite.
    public var isFavorite: Bool?
    /// Gets or sets the item identifier.
    public var itemID: String?
    /// Gets or sets the key.
    public var key: String?
    /// Gets or sets the last played date.
    public var lastPlayedDate: Date?
    /// Gets or sets a value indicating whether this MediaBrowser.Model.Dto.UserItemDataDto is likes.
    public var isLikes: Bool?
    /// Gets or sets the play count.
    public var playCount: Int?
    /// Gets or sets the playback position ticks.
    public var playbackPositionTicks: Int?
    /// Gets or sets a value indicating whether this MediaBrowser.Model.Dto.UserItemDataDto is played.
    public var isPlayed: Bool?
    /// Gets or sets the played percentage.
    public var playedPercentage: Double?
    /// Gets or sets the rating.
    public var rating: Double?
    /// Gets or sets the unplayed item count.
    public var unplayedItemCount: Int?

    public init(
        isFavorite: Bool? = nil,
        itemID: String? = nil,
        key: String? = nil,
        lastPlayedDate: Date? = nil,
        isLikes: Bool? = nil,
        playCount: Int? = nil,
        playbackPositionTicks: Int? = nil,
        isPlayed: Bool? = nil,
        playedPercentage: Double? = nil,
        rating: Double? = nil,
        unplayedItemCount: Int? = nil
    ) {
        self.isFavorite = isFavorite
        self.itemID = itemID
        self.key = key
        self.lastPlayedDate = lastPlayedDate
        self.isLikes = isLikes
        self.playCount = playCount
        self.playbackPositionTicks = playbackPositionTicks
        self.isPlayed = isPlayed
        self.playedPercentage = playedPercentage
        self.rating = rating
        self.unplayedItemCount = unplayedItemCount
    }
}
