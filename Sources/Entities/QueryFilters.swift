//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct QueryFilters: Codable, Hashable, Sendable {
    public var audioLanguages: [NameValuePair]?
    public var genres: [NameIDPair]?
    public var officialRatings: [String]?
    public var subtitleLanguages: [NameValuePair]?
    public var tags: [String]?
    public var years: [Int]?

    public init(
        audioLanguages: [NameValuePair]? = nil,
        genres: [NameIDPair]? = nil,
        officialRatings: [String]? = nil,
        subtitleLanguages: [NameValuePair]? = nil,
        tags: [String]? = nil,
        years: [Int]? = nil
    ) {
        self.audioLanguages = audioLanguages
        self.genres = genres
        self.officialRatings = officialRatings
        self.subtitleLanguages = subtitleLanguages
        self.tags = tags
        self.years = years
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.audioLanguages = try values.decodeIfPresent([NameValuePair].self, forKey: "AudioLanguages")
        self.genres = try values.decodeIfPresent([NameIDPair].self, forKey: "Genres")
        self.officialRatings = try values.decodeIfPresent([String].self, forKey: "OfficialRatings")
        self.subtitleLanguages = try values.decodeIfPresent([NameValuePair].self, forKey: "SubtitleLanguages")
        self.tags = try values.decodeIfPresent([String].self, forKey: "Tags")
        self.years = try values.decodeIfPresent([Int].self, forKey: "Years")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(audioLanguages, forKey: "AudioLanguages")
        try values.encodeIfPresent(genres, forKey: "Genres")
        try values.encodeIfPresent(officialRatings, forKey: "OfficialRatings")
        try values.encodeIfPresent(subtitleLanguages, forKey: "SubtitleLanguages")
        try values.encodeIfPresent(tags, forKey: "Tags")
        try values.encodeIfPresent(years, forKey: "Years")
    }
}
