//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class PingRequestDto.
public struct PingRequestDto: Codable, Hashable {
    /// Gets or sets the ping time.
    public var ping: Int?

    public init(ping: Int? = nil) {
        self.ping = ping
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.ping = try values.decodeIfPresent(Int.self, forKey: "Ping")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(ping, forKey: "Ping")
    }
}
