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
    /// Updates a user configuration.
    public static func updateUserConfiguration(userID: String? = nil, _ body: JellyfinAPI.UserConfiguration) -> Request<Void> {
        Request(
            path: "/Users/Configuration",
            method: "POST",
            query: makeUpdateUserConfigurationQuery(userID),
            body: body,
            id: "UpdateUserConfiguration"
        )
    }

    private static func makeUpdateUserConfigurationQuery(_ userID: String?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(userID, forKey: "userId")
        return encoder.items
    }
}
