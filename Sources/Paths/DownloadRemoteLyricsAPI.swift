//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get

public extension Paths {
    /// Downloads a remote lyric.
    static func downloadRemoteLyrics(itemID: String, lyricID: String) -> Request<LyricDto> {
        Request(path: "/Audio/\(itemID)/RemoteSearch/Lyrics/\(lyricID)", method: "POST", id: "DownloadRemoteLyrics")
    }
}
