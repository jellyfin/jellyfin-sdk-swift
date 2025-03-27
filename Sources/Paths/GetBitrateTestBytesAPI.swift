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
    /// Tests the network with a request with the size of the bitrate.
    public static func getBitrateTestBytes(size: Int? = nil) -> Request<Data> {
        Request(path: "/Playback/BitrateTest", method: "GET", query: makeGetBitrateTestBytesQuery(size), id: "GetBitrateTestBytes")
    }

    private static func makeGetBitrateTestBytesQuery(_ size: Int?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(size, forKey: "size")
        return encoder.items
    }
}
