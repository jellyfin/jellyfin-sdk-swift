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

extension Paths {
    /// Authenticates a user.
    public static func authenticateUser(userID: String, pw: String, password: String? = nil) -> Request<JellyfinAPI.AuthenticationResult> {
        Request(
            path: "/Users/\(userID)/Authenticate",
            method: "POST",
            query: makeAuthenticateUserQuery(pw, password),
            id: "AuthenticateUser"
        )
    }

    private static func makeAuthenticateUserQuery(_ pw: String, _ password: String?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(pw, forKey: "pw")
        encoder.encode(password, forKey: "password")
        return encoder.items
    }
}
