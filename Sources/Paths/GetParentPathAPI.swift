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
    /// Gets the parent path of a given path.
    static func getParentPath(path: String) -> Request<String> {
        Request(method: "GET", url: "/Environment/ParentPath", query: [("path", path)], id: "GetParentPath")
    }
}
