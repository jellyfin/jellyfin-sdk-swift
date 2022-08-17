//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get
import URLQueryEncoder

extension Paths {
    /// Sets the user name and password.
    static public func updateStartupUser(_ body: JellyfinAPI.StartupUserDto? = nil) -> Request<Void> {
        Request(method: "POST", url: "/Startup/User", body: body, id: "UpdateStartupUser")
    }
}
