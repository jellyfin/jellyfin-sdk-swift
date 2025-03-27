//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Enum containing hardware acceleration types.
public enum HardwareAccelerationType: String, Codable, CaseIterable {
    case none
    case amf
    case qsv
    case nvenc
    case v4l2m2m
    case vaapi
    case videotoolbox
    case rkmpp
}
