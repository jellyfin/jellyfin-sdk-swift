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
    /// Updates a user's password.
    public static func updateUserPassword(userID: String? = nil, _ body: JellyfinAPI.UpdateUserPassword) -> Request<Void> {
        Request(path: "/Users/Password", method: "POST", query: makeUpdateUserPasswordQuery(userID), body: body, id: "UpdateUserPassword")
    }

    private static func makeUpdateUserPasswordQuery(_ userID: String?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(userID, forKey: "userId")
        return encoder.items
    }
}
