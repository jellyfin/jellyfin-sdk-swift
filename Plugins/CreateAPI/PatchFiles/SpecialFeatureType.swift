//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2024 Jellyfin & Jellyfin Contributors
//

import Foundation

public enum SpecialFeatureType: String, Codable, CaseIterable {
    case unknown = "Unknown"
    case clip = "Clip"
    case trailer = "Trailer"
    case behindTheScenes = "BehindTheScenes"
    case deletedScene = "DeletedScene"
    case interview = "Interview"
    case scene = "Scene"
    case sample = "Sample"
    case themeSong = "ThemeSong"
    case themeVideo = "ThemeVideo"
}
