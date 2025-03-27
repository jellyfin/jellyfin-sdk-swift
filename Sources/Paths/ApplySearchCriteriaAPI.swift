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

extension Paths {
    /// Applies search criteria to an item and refreshes metadata.
    public static func applySearchCriteria(
        itemID: String,
        isReplaceAllImages: Bool? = nil,
        _ body: JellyfinAPI.RemoteSearchResult
    ) -> Request<Void> {
        Request(
            path: "/Items/RemoteSearch/Apply/\(itemID)",
            method: "POST",
            query: makeApplySearchCriteriaQuery(isReplaceAllImages),
            body: body,
            id: "ApplySearchCriteria"
        )
    }

    private static func makeApplySearchCriteriaQuery(_ isReplaceAllImages: Bool?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(isReplaceAllImages, forKey: "replaceAllImages")
        return encoder.items
    }
}
