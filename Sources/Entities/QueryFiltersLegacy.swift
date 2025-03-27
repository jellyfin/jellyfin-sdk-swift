//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct QueryFiltersLegacy: Codable, Hashable {
    public var genres: [String]?
    public var officialRatings: [String]?
    public var tags: [String]?
    public var years: [Int]?

    public init(genres: [String]? = nil, officialRatings: [String]? = nil, tags: [String]? = nil, years: [Int]? = nil) {
        self.genres = genres
        self.officialRatings = officialRatings
        self.tags = tags
        self.years = years
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.genres = try values.decodeIfPresent([String].self, forKey: "Genres")
        self.officialRatings = try values.decodeIfPresent([String].self, forKey: "OfficialRatings")
        self.tags = try values.decodeIfPresent([String].self, forKey: "Tags")
        self.years = try values.decodeIfPresent([Int].self, forKey: "Years")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(genres, forKey: "Genres")
        try values.encodeIfPresent(officialRatings, forKey: "OfficialRatings")
        try values.encodeIfPresent(tags, forKey: "Tags")
        try values.encodeIfPresent(years, forKey: "Years")
    }
}
