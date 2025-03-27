//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class BufferRequestDto.
public struct BufferRequestDto: Codable, Hashable {
    /// Gets or sets a value indicating whether the client playback is unpaused.
    public var isPlaying: Bool?
    /// Gets or sets the playlist item identifier of the playing item.
    public var playlistItemID: String?
    /// Gets or sets the position ticks.
    public var positionTicks: Int?
    /// Gets or sets when the request has been made by the client.
    public var when: Date?

    public init(isPlaying: Bool? = nil, playlistItemID: String? = nil, positionTicks: Int? = nil, when: Date? = nil) {
        self.isPlaying = isPlaying
        self.playlistItemID = playlistItemID
        self.positionTicks = positionTicks
        self.when = when
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.isPlaying = try values.decodeIfPresent(Bool.self, forKey: "IsPlaying")
        self.playlistItemID = try values.decodeIfPresent(String.self, forKey: "PlaylistItemId")
        self.positionTicks = try values.decodeIfPresent(Int.self, forKey: "PositionTicks")
        self.when = try values.decodeIfPresent(Date.self, forKey: "When")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(isPlaying, forKey: "IsPlaying")
        try values.encodeIfPresent(playlistItemID, forKey: "PlaylistItemId")
        try values.encodeIfPresent(positionTicks, forKey: "PositionTicks")
        try values.encodeIfPresent(when, forKey: "When")
    }
}
