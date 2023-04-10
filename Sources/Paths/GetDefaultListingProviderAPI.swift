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

public extension Paths {
    /// Gets default listings provider info.
    static var getDefaultListingProvider: Request<JellyfinAPI.ListingsProviderInfo> {
        Request(method: "GET", url: "/LiveTv/ListingProviders/Default", id: "GetDefaultListingProvider")
    }
}
