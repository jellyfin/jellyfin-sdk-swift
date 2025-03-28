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
    /// Updates a user.
    public static func updateUser(userID: String? = nil, _ body: JellyfinAPI.UserDto) -> Request<Void> {
        Request(path: "/Users", method: "POST", query: makeUpdateUserQuery(userID), body: body, id: "UpdateUser")
    }

    private static func makeUpdateUserQuery(_ userID: String?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(userID, forKey: "userId")
        return encoder.items
    }
}
