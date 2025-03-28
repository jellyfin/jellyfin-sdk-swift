//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct LiveTvInfo: Codable, Hashable {
    /// Gets or sets the enabled users.
    public var enabledUsers: [String]?
    /// Gets or sets a value indicating whether this instance is enabled.
    public var isEnabled: Bool?
    /// Gets or sets the services.
    public var services: [LiveTvServiceInfo]?

    public init(enabledUsers: [String]? = nil, isEnabled: Bool? = nil, services: [LiveTvServiceInfo]? = nil) {
        self.enabledUsers = enabledUsers
        self.isEnabled = isEnabled
        self.services = services
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.enabledUsers = try values.decodeIfPresent([String].self, forKey: "EnabledUsers")
        self.isEnabled = try values.decodeIfPresent(Bool.self, forKey: "IsEnabled")
        self.services = try values.decodeIfPresent([LiveTvServiceInfo].self, forKey: "Services")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(enabledUsers, forKey: "EnabledUsers")
        try values.encodeIfPresent(isEnabled, forKey: "IsEnabled")
        try values.encodeIfPresent(services, forKey: "Services")
    }
}
