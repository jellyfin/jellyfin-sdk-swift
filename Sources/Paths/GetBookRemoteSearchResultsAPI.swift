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
    /// Get book remote search.
    static func getBookRemoteSearchResults(_ body: BookInfoRemoteSearchQuery) -> Request<[RemoteSearchResult]> {
        Request(path: "/Items/RemoteSearch/Book", method: "POST", body: body, id: "GetBookRemoteSearchResults")
    }
}
