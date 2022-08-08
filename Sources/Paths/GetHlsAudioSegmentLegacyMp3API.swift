//
// Swiftfin is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get
import URLQueryEncoder

public extension Paths {
    /// Gets the specified audio segment for an audio item.
    static func getHlsAudioSegmentLegacyMp3(itemID: String, segmentID: String) -> Request<Data> {
        Request(method: "GET", url: "/Audio/\(itemID)/hls/\(segmentID)/stream.mp3", id: "GetHlsAudioSegmentLegacyMp3")
    }
}
