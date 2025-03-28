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
    /// Removes items from a collection.
    public static func removeFromCollection(collectionID: String, ids: [String]) -> Request<Void> {
        Request(
            path: "/Collections/\(collectionID)/Items",
            method: "DELETE",
            query: makeRemoveFromCollectionQuery(ids),
            id: "RemoveFromCollection"
        )
    }

    private static func makeRemoveFromCollectionQuery(_ ids: [String]) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(ids, forKey: "ids")
        return encoder.items
    }
}
