//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct DeviceInfoQueryResult: Codable, Hashable {
    /// Gets or sets the items.
    public var items: [DeviceInfo]?
    /// Gets or sets the index of the first record in Items.
    public var startIndex: Int?
    /// Gets or sets the total number of records available.
    public var totalRecordCount: Int?

    public init(items: [DeviceInfo]? = nil, startIndex: Int? = nil, totalRecordCount: Int? = nil) {
        self.items = items
        self.startIndex = startIndex
        self.totalRecordCount = totalRecordCount
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.items = try values.decodeIfPresent([DeviceInfo].self, forKey: "Items")
        self.startIndex = try values.decodeIfPresent(Int.self, forKey: "StartIndex")
        self.totalRecordCount = try values.decodeIfPresent(Int.self, forKey: "TotalRecordCount")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(items, forKey: "Items")
        try values.encodeIfPresent(startIndex, forKey: "StartIndex")
        try values.encodeIfPresent(totalRecordCount, forKey: "TotalRecordCount")
    }
}
