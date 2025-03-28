//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class IgnoreWaitRequestDto.
public struct IgnoreWaitRequestDto: Codable, Hashable {
    /// Gets or sets a value indicating whether the client should be ignored.
    public var isIgnoreWait: Bool?

    public init(isIgnoreWait: Bool? = nil) {
        self.isIgnoreWait = isIgnoreWait
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.isIgnoreWait = try values.decodeIfPresent(Bool.self, forKey: "IgnoreWait")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(isIgnoreWait, forKey: "IgnoreWait")
    }
}
