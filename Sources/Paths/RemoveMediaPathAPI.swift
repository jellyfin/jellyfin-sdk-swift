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
    /// Remove a media path.
    static func removeMediaPath(parameters: RemoveMediaPathParameters? = nil) -> Request<Void> {
        Request(path: "/Library/VirtualFolders/Paths", method: "DELETE", query: parameters?.asQuery, id: "RemoveMediaPath")
    }

    struct RemoveMediaPathParameters {
        public var name: String?
        public var path: String?
        public var isRefreshlibrary: Bool?

        public init(name: String? = nil, path: String? = nil, isRefreshlibrary: Bool? = nil) {
            self.name = name
            self.path = path
            self.isRefreshlibrary = isRefreshlibrary
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(name, forKey: "name")
            encoder.encode(path, forKey: "path")
            encoder.encode(isRefreshlibrary, forKey: "refreshLibrary")
            return encoder.items
        }
    }
}
