//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Enum HardwareEncodingType.
public enum HardwareEncodingType: String, Codable, CaseIterable {
    case amf = "AMF"
    case qsv = "QSV"
    case nvenc = "NVENC"
    case v4l2m2m = "V4L2M2M"
    case vaapi = "VAAPI"
    case videoToolBox = "VideoToolBox"
    case rkmpp = "RKMPP"
}
