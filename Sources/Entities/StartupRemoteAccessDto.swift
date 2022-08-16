//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Startup remote access dto.
public struct StartupRemoteAccessDto: Codable {
    /// Gets or sets a value indicating whether enable automatic port mapping.
    public var enableAutomaticPortMapping: Bool
    /// Gets or sets a value indicating whether enable remote access.
    public var enableRemoteAccess: Bool

    public init(enableAutomaticPortMapping: Bool, enableRemoteAccess: Bool) {
        self.enableAutomaticPortMapping = enableAutomaticPortMapping
        self.enableRemoteAccess = enableRemoteAccess
    }
}
