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
    /// Sets the user image.
    public static func postUserImage(userID: String? = nil, _ body: Data? = nil) -> Request<Void> {
        Request(path: "/UserImage", method: "POST", query: makePostUserImageQuery(userID), body: body, id: "PostUserImage")
    }

    private static func makePostUserImageQuery(_ userID: String?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(userID, forKey: "userId")
        return encoder.items
    }
}
