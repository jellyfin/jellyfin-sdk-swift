//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class QueueRequestDto.
public struct QueueRequestDto: Codable, Hashable {
    /// Gets or sets the items to enqueue.
    public var itemIDs: [String]?
    /// Enum GroupQueueMode.
    public var mode: GroupQueueMode?

    public init(itemIDs: [String]? = nil, mode: GroupQueueMode? = nil) {
        self.itemIDs = itemIDs
        self.mode = mode
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.itemIDs = try values.decodeIfPresent([String].self, forKey: "ItemIds")
        self.mode = try values.decodeIfPresent(GroupQueueMode.self, forKey: "Mode")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(itemIDs, forKey: "ItemIds")
        try values.encodeIfPresent(mode, forKey: "Mode")
    }
}
