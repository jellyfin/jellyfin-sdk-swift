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
    /// Issues a system command to a client.
    static func sendSystemCommand(sessionID: String, command: String) -> Request<Void> {
        Request(path: "/Sessions/\(sessionID)/System/\(command)", method: "POST", id: "SendSystemCommand")
    }
}
