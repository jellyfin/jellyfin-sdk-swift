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

extension Paths {
    /// Gets a list of users.
    public static func getUsers(isHidden: Bool? = nil, isDisabled: Bool? = nil) -> Request<[JellyfinAPI.UserDto]> {
        Request(path: "/Users", method: "GET", query: makeGetUsersQuery(isHidden, isDisabled), id: "GetUsers")
    }

    private static func makeGetUsersQuery(_ isHidden: Bool?, _ isDisabled: Bool?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(isHidden, forKey: "isHidden")
        encoder.encode(isDisabled, forKey: "isDisabled")
        return encoder.items
    }
}
