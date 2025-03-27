//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Enum MediaStreamType.
public enum MediaStreamType: String, Codable, CaseIterable {
    case audio = "Audio"
    case video = "Video"
    case subtitle = "Subtitle"
    case embeddedImage = "EmbeddedImage"
    case data = "Data"
    case lyric = "Lyric"
}
