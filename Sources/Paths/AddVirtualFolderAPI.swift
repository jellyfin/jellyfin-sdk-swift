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
    /// Adds a virtual folder.
    static func addVirtualFolder(parameters: AddVirtualFolderParameters? = nil, _ body: AddVirtualFolderDto? = nil) -> Request<Void> {
        Request(path: "/Library/VirtualFolders", method: "POST", query: parameters?.asQuery, body: body, id: "AddVirtualFolder")
    }

    struct AddVirtualFolderParameters {
        public var name: String?
        public var collectionType: CollectionTypeOptions?
        public var paths: [String]?
        public var isRefreshLibrary: Bool?

        public init(
            name: String? = nil,
            collectionType: CollectionTypeOptions? = nil,
            paths: [String]? = nil,
            isRefreshLibrary: Bool? = nil
        ) {
            self.name = name
            self.collectionType = collectionType
            self.paths = paths
            self.isRefreshLibrary = isRefreshLibrary
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(name, forKey: "name")
            encoder.encode(collectionType, forKey: "collectionType")
            encoder.encode(paths, forKey: "paths")
            encoder.encode(isRefreshLibrary, forKey: "refreshLibrary")
            return encoder.items
        }
    }
}
