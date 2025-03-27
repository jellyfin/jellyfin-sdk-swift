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
    /// Delete listing provider.
    public static func deleteListingProvider(id: String? = nil) -> Request<Void> {
        Request(path: "/LiveTv/ListingProviders", method: "DELETE", query: makeDeleteListingProviderQuery(id), id: "DeleteListingProvider")
    }

    private static func makeDeleteListingProviderQuery(_ id: String?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(id, forKey: "id")
        return encoder.items
    }
}
