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

extension Paths {
    /// Discover tuners.
    public static func discoverTuners(isNewDevicesOnly: Bool? = nil) -> Request<[JellyfinAPI.TunerHostInfo]> {
        Request(path: "/LiveTv/Tuners/Discover", method: "GET", query: makeDiscoverTunersQuery(isNewDevicesOnly), id: "DiscoverTuners")
    }

    private static func makeDiscoverTunersQuery(_ isNewDevicesOnly: Bool?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(isNewDevicesOnly, forKey: "newDevicesOnly")
        return encoder.items
    }
}
