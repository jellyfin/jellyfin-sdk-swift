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
    /// Adds a listings provider.
    static func addListingProvider(
        parameters: AddListingProviderParameters? = nil,
        _ body: ListingsProviderInfo? = nil
    ) -> Request<ListingsProviderInfo> {
        Request(path: "/LiveTv/ListingProviders", method: "POST", query: parameters?.asQuery, body: body, id: "AddListingProvider")
    }

    struct AddListingProviderParameters {
        public var pw: String?
        public var isValidatelistings: Bool?
        public var isValidatelogin: Bool?

        public init(pw: String? = nil, isValidatelistings: Bool? = nil, isValidatelogin: Bool? = nil) {
            self.pw = pw
            self.isValidatelistings = isValidatelistings
            self.isValidatelogin = isValidatelogin
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(pw, forKey: "pw")
            encoder.encode(isValidatelistings, forKey: "validateListings")
            encoder.encode(isValidatelogin, forKey: "validateLogin")
            return encoder.items
        }
    }
}
