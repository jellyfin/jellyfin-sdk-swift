//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Create new playlist dto.
public struct CreatePlaylistDto: Codable {
    /// Gets or sets item ids to add to the playlist.
    public var ids: [UUID]?
    /// Gets or sets the media type.
    public var mediaType: String?
    /// Gets or sets the name of the new playlist.
    public var name: String?
    /// Gets or sets the user id.
    public var userID: UUID?

    public init(ids: [UUID]? = nil, mediaType: String? = nil, name: String? = nil, userID: UUID? = nil) {
        self.ids = ids
        self.mediaType = mediaType
        self.name = name
        self.userID = userID
    }
}
