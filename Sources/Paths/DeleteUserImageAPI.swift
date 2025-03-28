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
    /// Delete the user's image.
    public static func deleteUserImage(userID: String? = nil) -> Request<Void> {
        Request(path: "/UserImage", method: "DELETE", query: makeDeleteUserImageQuery(userID), id: "DeleteUserImage")
    }

    private static func makeDeleteUserImageQuery(_ userID: String?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(userID, forKey: "userId")
        return encoder.items
    }
}
