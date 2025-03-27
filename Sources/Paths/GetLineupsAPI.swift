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
    /// Gets available lineups.
    static func getLineups(parameters: GetLineupsParameters? = nil) -> Request<[JellyfinAPI.NameIDPair]> {
        Request(path: "/LiveTv/ListingProviders/Lineups", method: "GET", query: parameters?.asQuery, id: "GetLineups")
    }

    struct GetLineupsParameters {
        public var id: String?
        public var type: String?
        public var location: String?
        public var country: String?

        public init(id: String? = nil, type: String? = nil, location: String? = nil, country: String? = nil) {
            self.id = id
            self.type = type
            self.location = location
            self.country = country
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(id, forKey: "id")
            encoder.encode(type, forKey: "type")
            encoder.encode(location, forKey: "location")
            encoder.encode(country, forKey: "country")
            return encoder.items
        }
    }
}
