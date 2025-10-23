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
    /// Gets information about the server.
    static var getSystemStorage: Request<JellyfinAPI.SystemStorageDto> {
        Request(path: "/System/Info/Storage", method: "GET", id: "GetSystemStorage")
    }
}
