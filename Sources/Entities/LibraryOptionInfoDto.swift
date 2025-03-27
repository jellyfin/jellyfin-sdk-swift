//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Library option info dto.
public struct LibraryOptionInfoDto: Codable, Hashable {
    /// Gets or sets a value indicating whether default enabled.
    public var isDefaultEnabled: Bool?
    /// Gets or sets name.
    public var name: String?

    public init(isDefaultEnabled: Bool? = nil, name: String? = nil) {
        self.isDefaultEnabled = isDefaultEnabled
        self.name = name
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.isDefaultEnabled = try values.decodeIfPresent(Bool.self, forKey: "DefaultEnabled")
        self.name = try values.decodeIfPresent(String.self, forKey: "Name")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(isDefaultEnabled, forKey: "DefaultEnabled")
        try values.encodeIfPresent(name, forKey: "Name")
    }
}
