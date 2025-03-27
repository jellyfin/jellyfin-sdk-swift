//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct QueryFilters: Codable, Hashable {
    public var genres: [NameGuidPair]?
    public var tags: [String]?

    public init(genres: [NameGuidPair]? = nil, tags: [String]? = nil) {
        self.genres = genres
        self.tags = tags
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.genres = try values.decodeIfPresent([NameGuidPair].self, forKey: "Genres")
        self.tags = try values.decodeIfPresent([String].self, forKey: "Tags")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(genres, forKey: "Genres")
        try values.encodeIfPresent(tags, forKey: "Tags")
    }
}
