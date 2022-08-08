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
    /// Gets a year.
    public static func getYear(year: Int, userID: String? = nil) -> Request<JellyfinAPI.BaseItemDto> {
        Request(method: "GET", url: "/Years/\(year)", query: makeGetYearQuery(userID), id: "GetYear")
    }

    private static func makeGetYearQuery(_ userID: String?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(userID, forKey: "userId")
        return encoder.items
    }
}
