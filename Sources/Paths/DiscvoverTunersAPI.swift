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

extension Paths {
    /// Discover tuners.
    public static func discvoverTuners(isNewDevicesOnly: Bool? = nil) -> Request<[JellyfinAPI.TunerHostInfo]> {
        Request(path: "/LiveTv/Tuners/Discvover", method: "GET", query: makeDiscvoverTunersQuery(isNewDevicesOnly), id: "DiscvoverTuners")
    }

    private static func makeDiscvoverTunersQuery(_ isNewDevicesOnly: Bool?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(isNewDevicesOnly, forKey: "newDevicesOnly")
        return encoder.items
    }
}
