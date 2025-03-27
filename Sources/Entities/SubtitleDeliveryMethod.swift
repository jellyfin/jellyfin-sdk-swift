//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Delivery method to use during playback of a specific subtitle format.
public enum SubtitleDeliveryMethod: String, Codable, CaseIterable {
    case encode = "Encode"
    case embed = "Embed"
    case external = "External"
    case hls = "Hls"
    case drop = "Drop"
}
