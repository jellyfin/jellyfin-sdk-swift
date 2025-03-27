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
    /// Gets live tv recording groups.
    @available(*, deprecated, message: "Deprecated")
    public static func getRecordingGroups(userID: String? = nil) -> Request<JellyfinAPI.BaseItemDtoQueryResult> {
        Request(path: "/LiveTv/Recordings/Groups", method: "GET", query: makeGetRecordingGroupsQuery(userID), id: "GetRecordingGroups")
    }

    private static func makeGetRecordingGroupsQuery(_ userID: String?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(userID, forKey: "userId")
        return encoder.items
    }
}
