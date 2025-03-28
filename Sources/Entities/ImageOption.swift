//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct ImageOption: Codable, Hashable {
    /// Gets or sets the limit.
    public var limit: Int?
    /// Gets or sets the minimum width.
    public var minWidth: Int?
    /// Gets or sets the type.
    public var type: ImageType?

    public init(limit: Int? = nil, minWidth: Int? = nil, type: ImageType? = nil) {
        self.limit = limit
        self.minWidth = minWidth
        self.type = type
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.limit = try values.decodeIfPresent(Int.self, forKey: "Limit")
        self.minWidth = try values.decodeIfPresent(Int.self, forKey: "MinWidth")
        self.type = try values.decodeIfPresent(ImageType.self, forKey: "Type")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(limit, forKey: "Limit")
        try values.encodeIfPresent(minWidth, forKey: "MinWidth")
        try values.encodeIfPresent(type, forKey: "Type")
    }
}
