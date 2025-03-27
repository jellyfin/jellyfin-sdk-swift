//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// An entity representing the metadata for a group of trickplay tiles.
public struct TrickplayInfo: Codable, Hashable {
    /// Gets or sets peak bandwith usage in bits per second.
    public var bandwidth: Int?
    /// Gets or sets height of an individual thumbnail.
    public var height: Int?
    /// Gets or sets interval in milliseconds between each trickplay thumbnail.
    public var interval: Int?
    /// Gets or sets total amount of non-black thumbnails.
    public var thumbnailCount: Int?
    /// Gets or sets amount of thumbnails per column.
    public var tileHeight: Int?
    /// Gets or sets amount of thumbnails per row.
    public var tileWidth: Int?
    /// Gets or sets width of an individual thumbnail.
    public var width: Int?

    public init(
        bandwidth: Int? = nil,
        height: Int? = nil,
        interval: Int? = nil,
        thumbnailCount: Int? = nil,
        tileHeight: Int? = nil,
        tileWidth: Int? = nil,
        width: Int? = nil
    ) {
        self.bandwidth = bandwidth
        self.height = height
        self.interval = interval
        self.thumbnailCount = thumbnailCount
        self.tileHeight = tileHeight
        self.tileWidth = tileWidth
        self.width = width
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.bandwidth = try values.decodeIfPresent(Int.self, forKey: "Bandwidth")
        self.height = try values.decodeIfPresent(Int.self, forKey: "Height")
        self.interval = try values.decodeIfPresent(Int.self, forKey: "Interval")
        self.thumbnailCount = try values.decodeIfPresent(Int.self, forKey: "ThumbnailCount")
        self.tileHeight = try values.decodeIfPresent(Int.self, forKey: "TileHeight")
        self.tileWidth = try values.decodeIfPresent(Int.self, forKey: "TileWidth")
        self.width = try values.decodeIfPresent(Int.self, forKey: "Width")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(bandwidth, forKey: "Bandwidth")
        try values.encodeIfPresent(height, forKey: "Height")
        try values.encodeIfPresent(interval, forKey: "Interval")
        try values.encodeIfPresent(thumbnailCount, forKey: "ThumbnailCount")
        try values.encodeIfPresent(tileHeight, forKey: "TileHeight")
        try values.encodeIfPresent(tileWidth, forKey: "TileWidth")
        try values.encodeIfPresent(width, forKey: "Width")
    }
}
