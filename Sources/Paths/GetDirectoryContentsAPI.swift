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
    /// Gets the contents of a given directory in the file system.
    static func getDirectoryContents(parameters: GetDirectoryContentsParameters) -> Request<[JellyfinAPI.FileSystemEntryInfo]> {
        Request(path: "/Environment/DirectoryContents", method: "GET", query: parameters.asQuery, id: "GetDirectoryContents")
    }

    struct GetDirectoryContentsParameters {
        public var path: String
        public var isIncludeFiles: Bool?
        public var isIncludeDirectories: Bool?

        public init(path: String, isIncludeFiles: Bool? = nil, isIncludeDirectories: Bool? = nil) {
            self.path = path
            self.isIncludeFiles = isIncludeFiles
            self.isIncludeDirectories = isIncludeDirectories
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(path, forKey: "path")
            encoder.encode(isIncludeFiles, forKey: "includeFiles")
            encoder.encode(isIncludeDirectories, forKey: "includeDirectories")
            return encoder.items
        }
    }
}
