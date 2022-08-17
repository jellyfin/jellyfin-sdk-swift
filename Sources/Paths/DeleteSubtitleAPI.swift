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

public extension Paths {
    /// Deletes an external subtitle file.
    static func deleteSubtitle(itemID: String, index: Int) -> Request<Void> {
        Request(method: "DELETE", url: "/Videos/\(itemID)/Subtitles/\(index)", id: "DeleteSubtitle")
    }
}
