//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get

extension Paths {
    /// Gets all media segments based on an itemId.
    public static func getItemSegments(
        itemID: String,
        includeSegmentTypes: [MediaSegmentType]? = nil
    ) -> Request<MediaSegmentDtoQueryResult> {
        Request(
            path: "/MediaSegments/\(itemID)",
            method: "GET",
            query: makeGetItemSegmentsQuery(includeSegmentTypes),
            id: "GetItemSegments"
        )
    }

    private static func makeGetItemSegmentsQuery(_ includeSegmentTypes: [MediaSegmentType]?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(includeSegmentTypes, forKey: "includeSegmentTypes")
        return encoder.items
    }
}
