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
    /// Get Devices.
    static public func getDevices(isSupportsSync: Bool? = nil, userID: UUID? = nil) -> Request<JellyfinAPI.DeviceInfoQueryResult> {
        Request(method: "GET", url: "/Devices", query: makeGetDevicesQuery(isSupportsSync, userID), id: "GetDevices")
    }

    private static func makeGetDevicesQuery(_ isSupportsSync: Bool?, _ userID: UUID?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(isSupportsSync, forKey: "supportsSync")
        encoder.encode(userID, forKey: "userId")
        return encoder.items
    }
}
