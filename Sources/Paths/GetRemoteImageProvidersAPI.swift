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
    /// Gets available remote image providers for an item.
    static func getRemoteImageProviders(itemID: String) -> Request<[JellyfinAPI.ImageProviderInfo]> {
        Request(path: "/Items/\(itemID)/RemoteImages/Providers", method: "GET", id: "GetRemoteImageProviders")
    }
}
