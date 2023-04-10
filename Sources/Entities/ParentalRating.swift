//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class ParentalRating.
public struct ParentalRating: Codable, Hashable {
    /// Gets or sets the name.
    public var name: String?
    /// Gets or sets the value.
    public var value: Int?

    public init(name: String? = nil, value: Int? = nil) {
        self.name = name
        self.value = value
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.name = try values.decodeIfPresent(String.self, forKey: "Name")
        self.value = try values.decodeIfPresent(Int.self, forKey: "Value")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(name, forKey: "Name")
        try values.encodeIfPresent(value, forKey: "Value")
    }
}
