//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class UserItemDataDto.
public struct UserItemDataDto: Codable, Hashable {
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

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.isFavorite = try values.decodeIfPresent(Bool.self, forKey: "IsFavorite")
        self.itemID = try values.decodeIfPresent(String.self, forKey: "ItemId")
        self.key = try values.decodeIfPresent(String.self, forKey: "Key")
        self.lastPlayedDate = try values.decodeIfPresent(Date.self, forKey: "LastPlayedDate")
        self.isLikes = try values.decodeIfPresent(Bool.self, forKey: "Likes")
        self.playCount = try values.decodeIfPresent(Int.self, forKey: "PlayCount")
        self.playbackPositionTicks = try values.decodeIfPresent(Int.self, forKey: "PlaybackPositionTicks")
        self.isPlayed = try values.decodeIfPresent(Bool.self, forKey: "Played")
        self.playedPercentage = try values.decodeIfPresent(Double.self, forKey: "PlayedPercentage")
        self.rating = try values.decodeIfPresent(Double.self, forKey: "Rating")
        self.unplayedItemCount = try values.decodeIfPresent(Int.self, forKey: "UnplayedItemCount")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(isFavorite, forKey: "IsFavorite")
        try values.encodeIfPresent(itemID, forKey: "ItemId")
        try values.encodeIfPresent(key, forKey: "Key")
        try values.encodeIfPresent(lastPlayedDate, forKey: "LastPlayedDate")
        try values.encodeIfPresent(isLikes, forKey: "Likes")
        try values.encodeIfPresent(playCount, forKey: "PlayCount")
        try values.encodeIfPresent(playbackPositionTicks, forKey: "PlaybackPositionTicks")
        try values.encodeIfPresent(isPlayed, forKey: "Played")
        try values.encodeIfPresent(playedPercentage, forKey: "PlayedPercentage")
        try values.encodeIfPresent(rating, forKey: "Rating")
        try values.encodeIfPresent(unplayedItemCount, forKey: "UnplayedItemCount")
    }
}
