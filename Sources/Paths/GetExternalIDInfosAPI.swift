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
    /// Get the item's external id info.
    static func getExternalIDInfos(itemID: String) -> Request<[JellyfinAPI.ExternalIDInfo]> {
        Request(path: "/Items/\(itemID)/ExternalIdInfos", method: "GET", id: "GetExternalIdInfos")
    }
}
