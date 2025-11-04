//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Api model for MediaSegment's.
public struct MediaSegmentDto: Codable, Hashable, Identifiable {
    /// Gets or sets the end of the segment.
    public var endTicks: Int?
    /// Gets or sets the id of the media segment.
    public var id: String?
    /// Gets or sets the id of the associated item.
    public var itemID: String?
    /// Gets or sets the start of the segment.
    public var startTicks: Int?
    /// Defines the types of content an individual Jellyfin.Database.Implementations.Entities.MediaSegment represents.
    public var type: MediaSegmentType?

    public init(endTicks: Int? = nil, id: String? = nil, itemID: String? = nil, startTicks: Int? = nil, type: MediaSegmentType? = nil) {
        self.endTicks = endTicks
        self.id = id
        self.itemID = itemID
        self.startTicks = startTicks
        self.type = type
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.endTicks = try values.decodeIfPresent(Int.self, forKey: "EndTicks")
        self.id = try values.decodeIfPresent(String.self, forKey: "Id")
        self.itemID = try values.decodeIfPresent(String.self, forKey: "ItemId")
        self.startTicks = try values.decodeIfPresent(Int.self, forKey: "StartTicks")
        self.type = try values.decodeIfPresent(MediaSegmentType.self, forKey: "Type")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(endTicks, forKey: "EndTicks")
        try values.encodeIfPresent(id, forKey: "Id")
        try values.encodeIfPresent(itemID, forKey: "ItemId")
        try values.encodeIfPresent(startTicks, forKey: "StartTicks")
        try values.encodeIfPresent(type, forKey: "Type")
    }
}
