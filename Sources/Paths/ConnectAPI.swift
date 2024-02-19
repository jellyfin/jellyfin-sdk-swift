//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2024 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get
import URLQueryEncoder

public extension Paths {
    /// Attempts to retrieve authentication information.
    static func connect(secret: String) -> Request<JellyfinAPI.QuickConnectResult> {
        Request(path: "/QuickConnect/Connect", method: "GET", query: [("secret", secret)], id: "Connect")
    }
}
