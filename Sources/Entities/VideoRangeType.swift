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
    case doviWithHDR10 = "DOVIWithHDR10"
    case doviWithHLG = "DOVIWithHLG"
    case doviWithSDR = "DOVIWithSDR"
    case doviWithEL = "DOVIWithEL"
    case doviWithHDR10Plus = "DOVIWithHDR10Plus"
    case doviWithELHDR10Plus = "DOVIWithELHDR10Plus"
    case doviInvalid = "DOVIInvalid"
    case hdr10Plus = "HDR10Plus"
}
