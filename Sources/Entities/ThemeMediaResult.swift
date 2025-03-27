//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class ThemeMediaResult.
public struct ThemeMediaResult: Codable, Hashable {
    /// Gets or sets the items.
    public var items: [BaseItemDto]?
    /// Gets or sets the owner id.
    public var ownerID: String?
    /// Gets or sets the index of the first record in Items.
    public var startIndex: Int?
    /// Gets or sets the total number of records available.
    public var totalRecordCount: Int?

    public init(items: [BaseItemDto]? = nil, ownerID: String? = nil, startIndex: Int? = nil, totalRecordCount: Int? = nil) {
        self.items = items
        self.ownerID = ownerID
        self.startIndex = startIndex
        self.totalRecordCount = totalRecordCount
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.items = try values.decodeIfPresent([BaseItemDto].self, forKey: "Items")
        self.ownerID = try values.decodeIfPresent(String.self, forKey: "OwnerId")
        self.startIndex = try values.decodeIfPresent(Int.self, forKey: "StartIndex")
        self.totalRecordCount = try values.decodeIfPresent(Int.self, forKey: "TotalRecordCount")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(items, forKey: "Items")
        try values.encodeIfPresent(ownerID, forKey: "OwnerId")
        try values.encodeIfPresent(startIndex, forKey: "StartIndex")
        try values.encodeIfPresent(totalRecordCount, forKey: "TotalRecordCount")
    }
}
