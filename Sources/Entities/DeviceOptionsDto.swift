//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// A dto representing custom options for a device.
public struct DeviceOptionsDto: Codable, Identifiable {
    /// Gets or sets the custom name.
    public var customName: String?
    /// Gets or sets the device id.
    public var deviceID: String?
    /// Gets or sets the id.
    public var id: Int?

    public init(customName: String? = nil, deviceID: String? = nil, id: Int? = nil) {
        self.customName = customName
        self.deviceID = deviceID
        self.id = id
    }
}
