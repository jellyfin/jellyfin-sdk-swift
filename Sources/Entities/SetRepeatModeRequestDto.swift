//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class SetRepeatModeRequestDto.
public struct SetRepeatModeRequestDto: Codable, Hashable {
    /// Enum GroupRepeatMode.
    public var mode: GroupRepeatMode?

    public init(mode: GroupRepeatMode? = nil) {
        self.mode = mode
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.mode = try values.decodeIfPresent(GroupRepeatMode.self, forKey: "Mode")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(mode, forKey: "Mode")
    }
}
