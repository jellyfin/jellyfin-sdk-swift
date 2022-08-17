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

extension Paths {
    /// Gets Dlna media receiver registrar xml.
    static public func getConnectionManager2(serverID: String) -> Request<String> {
        Request(method: "GET", url: "/Dlna/\(serverID)/ConnectionManager/ConnectionManager", id: "GetConnectionManager_2")
    }
}
