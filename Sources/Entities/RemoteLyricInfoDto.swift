//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import Foundation

/// The remote lyric info dto.
public struct RemoteLyricInfoDto: Codable, Hashable, Identifiable, Sendable {
    /// Gets or sets the id for the lyric.
    public var id: String
    /// Gets the lyrics.
    public var lyrics: LyricDto
    /// Gets the provider name.
    public var providerName: String

    public init(id: String, lyrics: LyricDto, providerName: String) {
        self.id = id
        self.lyrics = lyrics
        self.providerName = providerName
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.id = try values.decode(String.self, forKey: "Id")
        self.lyrics = try values.decode(LyricDto.self, forKey: "Lyrics")
        self.providerName = try values.decode(String.self, forKey: "ProviderName")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(id, forKey: "Id")
        try values.encode(lyrics, forKey: "Lyrics")
        try values.encode(providerName, forKey: "ProviderName")
    }
}
