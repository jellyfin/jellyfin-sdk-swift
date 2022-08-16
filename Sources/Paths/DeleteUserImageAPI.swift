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
    /// Delete the user's image.
    public static func deleteUserImage(userID: String, imageType: String, index: Int? = nil) -> Request<Void> {
        Request(
            method: "DELETE",
            url: "/Users/\(userID)/Images/\(imageType)",
            query: makeDeleteUserImageQuery(index),
            id: "DeleteUserImage"
        )
    }

    private static func makeDeleteUserImageQuery(_ index: Int?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(index, forKey: "index")
        return encoder.items
    }
}
