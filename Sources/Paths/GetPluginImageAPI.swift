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
    /// Gets a plugin's image.
    static func getPluginImage(pluginID: String, version: String) -> Request<Data> {
        Request(path: "/Plugins/\(pluginID)/\(version)/Image", method: "GET", id: "GetPluginImage")
    }
}
