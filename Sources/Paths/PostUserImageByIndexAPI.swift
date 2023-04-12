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

public extension Paths {
    /// Sets the user image.
    static func postUserImageByIndex(userID: String, imageType: String, index: Int, _ body: Data? = nil) -> Request<Void> {
        Request(method: "POST", url: "/Users/\(userID)/Images/\(imageType)/\(index)", body: body, id: "PostUserImageByIndex")
    }
}
