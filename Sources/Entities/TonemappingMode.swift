//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Enum containing tonemapping modes.
public enum TonemappingMode: String, Codable, CaseIterable {
    case auto
    case max
    case rgb
    case lum
    case itp
}
