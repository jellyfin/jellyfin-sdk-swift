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

public extension Paths {
    /// Set item image.
    static func setItemImageByIndex(itemID: String, imageType: String, imageIndex: Int, _ body: Data? = nil) -> Request<Void> {
        Request(path: "/Items/\(itemID)/Images/\(imageType)/\(imageIndex)", method: "POST", body: body, id: "SetItemImageByIndex")
    }
}
