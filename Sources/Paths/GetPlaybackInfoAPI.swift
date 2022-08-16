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
    /// Gets live playback media info for an item.
    public static func getPlaybackInfo(itemID: String, userID: UUID) -> Request<JellyfinAPI.PlaybackInfoResponse> {
        Request(method: "GET", url: "/Items/\(itemID)/PlaybackInfo", query: makeGetPlaybackInfoQuery(userID), id: "GetPlaybackInfo")
    }

    private static func makeGetPlaybackInfoQuery(_ userID: UUID) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(userID, forKey: "userId")
        return encoder.items
    }
}
