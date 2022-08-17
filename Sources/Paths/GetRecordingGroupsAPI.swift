//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get
import URLQueryEncoder

extension Paths {
    /// Gets live tv recording groups.
    @available(*, deprecated, message: "Deprecated")
    static public func getRecordingGroups(userID: String? = nil) -> Request<JellyfinAPI.BaseItemDtoQueryResult> {
        Request(method: "GET", url: "/LiveTv/Recordings/Groups", query: makeGetRecordingGroupsQuery(userID), id: "GetRecordingGroups")
    }

    private static func makeGetRecordingGroupsQuery(_ userID: String?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(userID, forKey: "userId")
        return encoder.items
    }
}
