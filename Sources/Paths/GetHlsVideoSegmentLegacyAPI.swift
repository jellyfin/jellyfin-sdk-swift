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
    /// Gets a hls video segment.
    static func getHlsVideoSegmentLegacy(itemID: String, playlistID: String, segmentID: String, segmentContainer: String) -> Request<Data> {
        Request(path: "/Videos/\(itemID)/hls/\(playlistID)/\(segmentID).\(segmentContainer)", method: "GET", id: "GetHlsVideoSegmentLegacy")
    }
}
