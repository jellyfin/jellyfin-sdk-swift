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
    /// Creates a new playlist.
    ///
    /// For backwards compatibility parameters can be sent via Query or Body, with Query having higher precedence.
    ///
    /// Query parameters are obsolete.
    static func createPlaylist(
        parameters: CreatePlaylistParameters? = nil,
        _ body: JellyfinAPI.CreatePlaylistDto? = nil
    ) -> Request<JellyfinAPI.PlaylistCreationResult> {
        Request(path: "/Playlists", method: "POST", query: parameters?.asQuery, body: body, id: "CreatePlaylist")
    }

    struct CreatePlaylistParameters {
        public var name: String?
        public var ids: [String]?
        public var userID: String?
        public var mediaType: MediaType?

        public typealias MediaType = JellyfinAPI.MediaType

        public init(name: String? = nil, ids: [String]? = nil, userID: String? = nil, mediaType: MediaType? = nil) {
            self.name = name
            self.ids = ids
            self.userID = userID
            self.mediaType = mediaType
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(name, forKey: "name")
            encoder.encode(ids, forKey: "ids")
            encoder.encode(userID, forKey: "userId")
            encoder.encode(mediaType, forKey: "mediaType")
            return encoder.items
        }
    }
}
