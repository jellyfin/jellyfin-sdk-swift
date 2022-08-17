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
    /// Tests the network with a request with the size of the bitrate.
    static public func getBitrateTestBytes(size: Int32? = nil) -> Request<Data> {
        Request(method: "GET", url: "/Playback/BitrateTest", query: makeGetBitrateTestBytesQuery(size), id: "GetBitrateTestBytes")
    }

    private static func makeGetBitrateTestBytesQuery(_ size: Int32?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(size, forKey: "size")
        return encoder.items
    }
}
