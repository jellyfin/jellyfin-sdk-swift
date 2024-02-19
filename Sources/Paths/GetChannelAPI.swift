//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2024 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get
import URLQueryEncoder

extension Paths {
    /// Gets a live tv channel.
    public static func getChannel(channelID: String, userID: String? = nil) -> Request<JellyfinAPI.BaseItemDto> {
        Request(path: "/LiveTv/Channels/\(channelID)", method: "GET", query: makeGetChannelQuery(userID), id: "GetChannel")
    }

    private static func makeGetChannelQuery(_ userID: String?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(userID, forKey: "userId")
        return encoder.items
    }
}
