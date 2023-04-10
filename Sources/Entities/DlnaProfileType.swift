//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation

public enum DlnaProfileType: String, Codable, CaseIterable {
    case audio = "Audio"
    case video = "Video"
    case photo = "Photo"
    case subtitle = "Subtitle"
}
