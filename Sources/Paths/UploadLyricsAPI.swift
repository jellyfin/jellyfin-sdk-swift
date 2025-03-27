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
    /// Upload an external lyric file.
    static func uploadLyrics(itemID: String, fileName: String, _ body: String? = nil) -> Request<JellyfinAPI.LyricDto> {
        Request(path: "/Audio/\(itemID)/Lyrics", method: "POST", query: [("fileName", fileName)], body: body, id: "UploadLyrics")
    }
}
