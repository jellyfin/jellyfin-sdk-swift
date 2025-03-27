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
    /// Issues a full general command to a client.
    static func sendFullGeneralCommand(sessionID: String, _ body: JellyfinAPI.GeneralCommand) -> Request<Void> {
        Request(path: "/Sessions/\(sessionID)/Command", method: "POST", body: body, id: "SendFullGeneralCommand")
    }
}
