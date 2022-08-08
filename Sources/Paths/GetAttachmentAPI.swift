//
// Swiftfin is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get
import URLQueryEncoder

public extension Paths {
    /// Get video attachment.
    static func getAttachment(videoID: String, mediaSourceID: String, index: Int) -> Request<Data> {
        Request(method: "GET", url: "/Videos/\(videoID)/\(mediaSourceID)/Attachments/\(index)", id: "GetAttachment")
    }
}
