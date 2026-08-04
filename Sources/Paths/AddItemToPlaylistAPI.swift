//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get

public extension Paths {
    /// Adds items to a playlist.
    static func addItemToPlaylist(playlistID: String, parameters: AddItemToPlaylistParameters? = nil) -> Request<Void> {
        Request(path: "/Playlists/\(playlistID)/Items", method: "POST", query: parameters?.asQuery, id: "AddItemToPlaylist")
    }

    struct AddItemToPlaylistParameters {
        public var ids: [String]?
        public var position: Int?
        public var userID: String?

        public init(ids: [String]? = nil, position: Int? = nil, userID: String? = nil) {
            self.ids = ids
            self.position = position
            self.userID = userID
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(ids, forKey: "ids")
            encoder.encode(position, forKey: "position")
            encoder.encode(userID, forKey: "userId")
            return encoder.items
        }
    }
}
