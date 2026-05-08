//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get

public extension Paths {
    /// Get guide info.
    static var getGuideInfo: Request<GuideInfo> {
        Request(path: "/LiveTv/GuideInfo", method: "GET", id: "GetGuideInfo")
    }
}
