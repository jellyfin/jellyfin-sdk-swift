//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// An enum representing types of video ranges.
public enum VideoRangeType: String, Codable, CaseIterable {
    case unknown = "Unknown"
    case sdr = "SDR"
    case hdr10 = "HDR10"
    case hlg = "HLG"
    case dovi = "DOVI"
    case dOVIWithHDR10 = "DOVIWithHDR10"
    case dOVIWithHLG = "DOVIWithHLG"
    case dOVIWithSDR = "DOVIWithSDR"
    case hDR10Plus = "HDR10Plus"
}
