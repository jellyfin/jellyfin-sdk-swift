//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get
import URLQueryEncoder

public extension Paths {
    /// Gets information about the server.
    static var getSystemInfo: Request<JellyfinAPI.SystemInfo> {
        Request(method: "GET", url: "/System/Info", id: "GetSystemInfo")
    }
}
