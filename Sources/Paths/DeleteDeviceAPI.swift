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
    /// Deletes a device.
    static func deleteDevice(id: String) -> Request<Void> {
        Request(path: "/Devices", method: "DELETE", query: [("id", id)], id: "DeleteDevice")
    }
}
