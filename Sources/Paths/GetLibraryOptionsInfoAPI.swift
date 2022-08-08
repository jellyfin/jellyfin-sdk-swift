//
// Swiftfin is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get
import URLQueryEncoder

extension Paths {
    /// Gets the library options info.
    public static func getLibraryOptionsInfo(
        libraryContentType: String? = nil,
        isNewLibrary: Bool? = nil
    ) -> Request<JellyfinAPI.LibraryOptionsResultDto> {
        Request(
            method: "GET",
            url: "/Libraries/AvailableOptions",
            query: makeGetLibraryOptionsInfoQuery(libraryContentType, isNewLibrary),
            id: "GetLibraryOptionsInfo"
        )
    }

    private static func makeGetLibraryOptionsInfoQuery(_ libraryContentType: String?, _ isNewLibrary: Bool?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(libraryContentType, forKey: "libraryContentType")
        encoder.encode(isNewLibrary, forKey: "isNewLibrary")
        return encoder.items
    }
}
