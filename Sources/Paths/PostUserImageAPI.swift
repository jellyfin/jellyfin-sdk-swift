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
    /// Sets the user image.
    public static func postUserImage(userID: String, imageType: String, index: Int? = nil, _ body: Data? = nil) -> Request<Void> {
        Request(
            method: "POST",
            url: "/Users/\(userID)/Images/\(imageType)",
            query: makePostUserImageQuery(index),
            body: body,
            id: "PostUserImage"
        )
    }

    private static func makePostUserImageQuery(_ index: Int?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(index, forKey: "index")
        return encoder.items
    }
}
