//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2024 Jellyfin & Jellyfin Contributors
//

import Foundation

/// An enum representing the axis that should be scrolled.
public enum ScrollDirection: String, Codable, CaseIterable {
    case horizontal = "Horizontal"
    case vertical = "Vertical"
}
