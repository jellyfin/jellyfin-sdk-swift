//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct HTTPHeaderInfo: Codable, Hashable {
    public var match: HeaderMatchType?
    public var name: String?
    public var value: String?

    public init(match: HeaderMatchType? = nil, name: String? = nil, value: String? = nil) {
        self.match = match
        self.name = name
        self.value = value
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.match = try values.decodeIfPresent(HeaderMatchType.self, forKey: "Match")
        self.name = try values.decodeIfPresent(String.self, forKey: "Name")
        self.value = try values.decodeIfPresent(String.self, forKey: "Value")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(match, forKey: "Match")
        try values.encodeIfPresent(name, forKey: "Name")
        try values.encodeIfPresent(value, forKey: "Value")
    }
}
