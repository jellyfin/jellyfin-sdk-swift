//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// The remote lyric info dto.
public struct RemoteLyricInfoDto: Codable, Hashable, Identifiable {
    /// Gets or sets the id for the lyric.
    public var id: String?
    /// Gets the lyrics.
    public var lyrics: LyricDto?
    /// Gets the provider name.
    public var providerName: String?

    public init(id: String? = nil, lyrics: LyricDto? = nil, providerName: String? = nil) {
        self.id = id
        self.lyrics = lyrics
        self.providerName = providerName
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.id = try values.decodeIfPresent(String.self, forKey: "Id")
        self.lyrics = try values.decodeIfPresent(LyricDto.self, forKey: "Lyrics")
        self.providerName = try values.decodeIfPresent(String.self, forKey: "ProviderName")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(id, forKey: "Id")
        try values.encodeIfPresent(lyrics, forKey: "Lyrics")
        try values.encodeIfPresent(providerName, forKey: "ProviderName")
    }
}
