//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// LyricResponse model.
public struct LyricDto: Codable, Hashable {
    /// Gets or sets a collection of individual lyric lines.
    public var lyrics: [LyricLine]?
    /// Gets or sets Metadata for the lyrics.
    public var metadata: LyricMetadata?

    public init(lyrics: [LyricLine]? = nil, metadata: LyricMetadata? = nil) {
        self.lyrics = lyrics
        self.metadata = metadata
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.lyrics = try values.decodeIfPresent([LyricLine].self, forKey: "Lyrics")
        self.metadata = try values.decodeIfPresent(LyricMetadata.self, forKey: "Metadata")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(lyrics, forKey: "Lyrics")
        try values.encodeIfPresent(metadata, forKey: "Metadata")
    }
}
