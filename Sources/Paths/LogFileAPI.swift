//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2024 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get
import URLQueryEncoder

public extension Paths {
    /// Upload a document.
    static func logFile(_ body: String? = nil) -> Request<JellyfinAPI.ClientLogDocumentResponseDto> {
        Request(path: "/ClientLog/Document", method: "POST", body: body, id: "LogFile")
    }
}
