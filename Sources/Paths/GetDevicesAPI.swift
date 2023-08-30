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

extension Paths {
    /// Get Devices.
    public static func getDevices(isSupportsSync: Bool? = nil, userID: String? = nil) -> Request<JellyfinAPI.DeviceInfoQueryResult> {
        Request(path: "/Devices", method: "GET", query: makeGetDevicesQuery(isSupportsSync, userID), id: "GetDevices")
    }

    private static func makeGetDevicesQuery(_ isSupportsSync: Bool?, _ userID: String?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(isSupportsSync, forKey: "supportsSync")
        encoder.encode(userID, forKey: "userId")
        return encoder.items
    }
}
