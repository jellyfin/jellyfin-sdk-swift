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
    /// Upload an external subtitle file.
    static func uploadSubtitle(itemID: String, _ body: JellyfinAPI.UploadSubtitleDto) -> Request<Void> {
        Request(method: "POST", url: "/Videos/\(itemID)/Subtitles", body: body, id: "UploadSubtitle")
    }
}
