//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2024 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Enum ImageResolution.
public enum ImageResolution: String, Codable, CaseIterable {
    case matchSource = "MatchSource"
    case p144 = "P144"
    case p240 = "P240"
    case p360 = "P360"
    case p480 = "P480"
    case p720 = "P720"
    case p1080 = "P1080"
    case p1440 = "P1440"
    case p2160 = "P2160"
}
