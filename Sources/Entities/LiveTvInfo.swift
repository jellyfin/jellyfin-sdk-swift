//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct LiveTvInfo: Codable {
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
}
