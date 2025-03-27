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
    /// Gets the library options info.
    static func getLibraryOptionsInfo(parameters: GetLibraryOptionsInfoParameters? = nil) -> Request<JellyfinAPI.LibraryOptionsResultDto> {
        Request(path: "/Libraries/AvailableOptions", method: "GET", query: parameters?.asQuery, id: "GetLibraryOptionsInfo")
    }

    struct GetLibraryOptionsInfoParameters {
        public var libraryContentType: LibraryContentType?
        public var isNewLibrary: Bool?

        public typealias LibraryContentType = JellyfinAPI.CollectionType

        public init(libraryContentType: LibraryContentType? = nil, isNewLibrary: Bool? = nil) {
            self.libraryContentType = libraryContentType
            self.isNewLibrary = isNewLibrary
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(libraryContentType, forKey: "libraryContentType")
            encoder.encode(isNewLibrary, forKey: "isNewLibrary")
            return encoder.items
        }
    }
}
