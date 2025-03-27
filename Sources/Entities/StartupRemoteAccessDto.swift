//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Startup remote access dto.
public struct StartupRemoteAccessDto: Codable, Hashable {
    /// Gets or sets a value indicating whether enable automatic port mapping.
    public var enableAutomaticPortMapping: Bool
    /// Gets or sets a value indicating whether enable remote access.
    public var enableRemoteAccess: Bool

    public init(enableAutomaticPortMapping: Bool, enableRemoteAccess: Bool) {
        self.enableAutomaticPortMapping = enableAutomaticPortMapping
        self.enableRemoteAccess = enableRemoteAccess
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.enableAutomaticPortMapping = try values.decode(Bool.self, forKey: "EnableAutomaticPortMapping")
        self.enableRemoteAccess = try values.decode(Bool.self, forKey: "EnableRemoteAccess")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(enableAutomaticPortMapping, forKey: "EnableAutomaticPortMapping")
        try values.encode(enableRemoteAccess, forKey: "EnableRemoteAccess")
    }
}
