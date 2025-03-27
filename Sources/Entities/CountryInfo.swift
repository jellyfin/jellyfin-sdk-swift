//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class CountryInfo.
public struct CountryInfo: Codable, Hashable {
    /// Gets or sets the display name.
    public var displayName: String?
    /// Gets or sets the name.
    public var name: String?
    /// Gets or sets the name of the three letter ISO region.
    public var threeLetterISORegionName: String?
    /// Gets or sets the name of the two letter ISO region.
    public var twoLetterISORegionName: String?

    public init(
        displayName: String? = nil,
        name: String? = nil,
        threeLetterISORegionName: String? = nil,
        twoLetterISORegionName: String? = nil
    ) {
        self.displayName = displayName
        self.name = name
        self.threeLetterISORegionName = threeLetterISORegionName
        self.twoLetterISORegionName = twoLetterISORegionName
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.displayName = try values.decodeIfPresent(String.self, forKey: "DisplayName")
        self.name = try values.decodeIfPresent(String.self, forKey: "Name")
        self.threeLetterISORegionName = try values.decodeIfPresent(String.self, forKey: "ThreeLetterISORegionName")
        self.twoLetterISORegionName = try values.decodeIfPresent(String.self, forKey: "TwoLetterISORegionName")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(displayName, forKey: "DisplayName")
        try values.encodeIfPresent(name, forKey: "Name")
        try values.encodeIfPresent(threeLetterISORegionName, forKey: "ThreeLetterISORegionName")
        try values.encodeIfPresent(twoLetterISORegionName, forKey: "TwoLetterISORegionName")
    }
}
