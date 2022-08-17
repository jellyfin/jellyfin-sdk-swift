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
    /// Authenticates a user by name.
    static public func authenticateUserByName(_ body: JellyfinAPI.AuthenticateUserByName) -> Request<JellyfinAPI.AuthenticationResult> {
        Request(method: "POST", url: "/Users/AuthenticateByName", body: body, id: "AuthenticateUserByName")
    }
}
