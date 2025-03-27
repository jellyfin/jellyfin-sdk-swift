//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// An enum representing the options to disable embedded subs.
public enum EmbeddedSubtitleOptions: String, Codable, CaseIterable {
    case allowAll = "AllowAll"
    case allowText = "AllowText"
    case allowImage = "AllowImage"
    case allowNone = "AllowNone"
}
