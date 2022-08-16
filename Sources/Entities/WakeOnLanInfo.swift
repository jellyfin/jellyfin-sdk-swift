//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Provides the MAC address and port for wake-on-LAN functionality.
public struct WakeOnLanInfo: Codable {
    /// Gets the MAC address of the device.
    public var macAddress: String?
    /// Gets or sets the wake-on-LAN port.
    public var port: Int?

    public init(macAddress: String? = nil, port: Int? = nil) {
        self.macAddress = macAddress
        self.port = port
    }
}
