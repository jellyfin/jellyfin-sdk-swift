//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get
import URLQueryEncoder

extension Paths {
    /// Deletes items from the library and filesystem.
    static public func deleteItems(ids: [String]? = nil) -> Request<Void> {
        Request(method: "DELETE", url: "/Items", query: makeDeleteItemsQuery(ids), id: "DeleteItems")
    }

    private static func makeDeleteItemsQuery(_ ids: [String]?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(ids, forKey: "ids")
        return encoder.items
    }
}
