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
    /// Gets the contents of a given directory in the file system.
    static func getDirectoryContents(parameters: GetDirectoryContentsParameters) -> Request<[FileSystemEntryInfo]> {
        Request(path: "/Environment/DirectoryContents", method: "GET", query: parameters.asQuery, id: "GetDirectoryContents")
    }

    struct GetDirectoryContentsParameters {
        public var path: String
        public var isIncludefiles: Bool?
        public var isIncludedirectories: Bool?

        public init(path: String, isIncludefiles: Bool? = nil, isIncludedirectories: Bool? = nil) {
            self.path = path
            self.isIncludefiles = isIncludefiles
            self.isIncludedirectories = isIncludedirectories
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(path, forKey: "path")
            encoder.encode(isIncludefiles, forKey: "includeFiles")
            encoder.encode(isIncludedirectories, forKey: "includeDirectories")
            return encoder.items
        }
    }
}
