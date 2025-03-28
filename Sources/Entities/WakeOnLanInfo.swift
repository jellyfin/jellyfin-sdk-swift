//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Provides the MAC address and port for wake-on-LAN functionality.
public struct WakeOnLanInfo: Codable, Hashable {
    /// Gets the MAC address of the device.
    public var macAddress: String?
    /// Gets or sets the wake-on-LAN port.
    public var port: Int?

    public init(macAddress: String? = nil, port: Int? = nil) {
        self.macAddress = macAddress
        self.port = port
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.macAddress = try values.decodeIfPresent(String.self, forKey: "MacAddress")
        self.port = try values.decodeIfPresent(Int.self, forKey: "Port")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(macAddress, forKey: "MacAddress")
        try values.encodeIfPresent(port, forKey: "Port")
    }
}
