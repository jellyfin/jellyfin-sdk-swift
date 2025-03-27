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
    /// Adds a listings provider.
    static func addListingProvider(
        parameters: AddListingProviderParameters? = nil,
        _ body: JellyfinAPI.ListingsProviderInfo? = nil
    ) -> Request<JellyfinAPI.ListingsProviderInfo> {
        Request(path: "/LiveTv/ListingProviders", method: "POST", query: parameters?.asQuery, body: body, id: "AddListingProvider")
    }

    struct AddListingProviderParameters {
        public var pw: String?
        public var isValidateListings: Bool?
        public var isValidateLogin: Bool?

        public init(pw: String? = nil, isValidateListings: Bool? = nil, isValidateLogin: Bool? = nil) {
            self.pw = pw
            self.isValidateListings = isValidateListings
            self.isValidateLogin = isValidateLogin
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(pw, forKey: "pw")
            encoder.encode(isValidateListings, forKey: "validateListings")
            encoder.encode(isValidateLogin, forKey: "validateLogin")
            return encoder.items
        }
    }
}
