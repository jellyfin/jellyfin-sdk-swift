//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Enum containing encoder presets.
public enum EncoderPreset: String, Codable, CaseIterable {
    case auto
    case placebo
    case veryslow
    case slower
    case slow
    case medium
    case fast
    case faster
    case veryfast
    case superfast
    case ultrafast
}
