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

public extension Paths {
    /// Get music video remote search.
    static func getMusicVideoRemoteSearchResults(
        _ body: JellyfinAPI
            .MusicVideoInfoRemoteSearchQuery
    ) -> Request<[JellyfinAPI.RemoteSearchResult]> {
        Request(method: "POST", url: "/Items/RemoteSearch/MusicVideo", body: body, id: "GetMusicVideoRemoteSearchResults")
    }
}
