//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get
import URLQueryEncoder

public extension Paths {
    /// Updates plugin configuration.
    ///
    /// Accepts plugin configuration as JSON body.
    static func updatePluginConfiguration(pluginID: String) -> Request<Void> {
        Request(path: "/Plugins/\(pluginID)/Configuration", method: "POST", id: "UpdatePluginConfiguration")
    }
}
