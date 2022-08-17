//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class SeekRequestDto.
public struct SeekRequestDto: Codable {
    /// Gets or sets the position ticks.
    public var positionTicks: Int64?

    public init(positionTicks: Int64? = nil) {
        self.positionTicks = positionTicks
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.positionTicks = try values.decodeIfPresent(Int64.self, forKey: "PositionTicks")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(positionTicks, forKey: "PositionTicks")
    }
}
