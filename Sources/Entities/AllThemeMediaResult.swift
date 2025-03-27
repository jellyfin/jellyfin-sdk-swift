//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct AllThemeMediaResult: Codable, Hashable {
    /// Class ThemeMediaResult.
    public var soundtrackSongsResult: ThemeMediaResult?
    /// Class ThemeMediaResult.
    public var themeSongsResult: ThemeMediaResult?
    /// Class ThemeMediaResult.
    public var themeVideosResult: ThemeMediaResult?

    public init(
        soundtrackSongsResult: ThemeMediaResult? = nil,
        themeSongsResult: ThemeMediaResult? = nil,
        themeVideosResult: ThemeMediaResult? = nil
    ) {
        self.soundtrackSongsResult = soundtrackSongsResult
        self.themeSongsResult = themeSongsResult
        self.themeVideosResult = themeVideosResult
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.soundtrackSongsResult = try values.decodeIfPresent(ThemeMediaResult.self, forKey: "SoundtrackSongsResult")
        self.themeSongsResult = try values.decodeIfPresent(ThemeMediaResult.self, forKey: "ThemeSongsResult")
        self.themeVideosResult = try values.decodeIfPresent(ThemeMediaResult.self, forKey: "ThemeVideosResult")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(soundtrackSongsResult, forKey: "SoundtrackSongsResult")
        try values.encodeIfPresent(themeSongsResult, forKey: "ThemeSongsResult")
        try values.encodeIfPresent(themeVideosResult, forKey: "ThemeVideosResult")
    }
}
