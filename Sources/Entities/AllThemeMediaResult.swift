//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct AllThemeMediaResult: Codable {
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
}
