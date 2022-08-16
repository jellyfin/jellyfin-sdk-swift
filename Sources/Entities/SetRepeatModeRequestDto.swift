//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class SetRepeatModeRequestDto.
public struct SetRepeatModeRequestDto: Codable {
    /// Enum GroupRepeatMode.
    public var mode: GroupRepeatMode?

    public init(mode: GroupRepeatMode? = nil) {
        self.mode = mode
    }
}
