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
    /// Creates a new collection.
    static func createCollection(parameters: CreateCollectionParameters? = nil) -> Request<JellyfinAPI.CollectionCreationResult> {
        Request(path: "/Collections", method: "POST", query: parameters?.asQuery, id: "CreateCollection")
    }

    struct CreateCollectionParameters {
        public var name: String?
        public var ids: [String]?
        public var parentID: String?
        public var isLocked: Bool?

        public init(name: String? = nil, ids: [String]? = nil, parentID: String? = nil, isLocked: Bool? = nil) {
            self.name = name
            self.ids = ids
            self.parentID = parentID
            self.isLocked = isLocked
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(name, forKey: "name")
            encoder.encode(ids, forKey: "ids")
            encoder.encode(parentID, forKey: "parentId")
            encoder.encode(isLocked, forKey: "isLocked")
            return encoder.items
        }
    }
}
