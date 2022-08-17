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
    public var ids: [String]?
    /// Gets or sets the media type.
    public var mediaType: String?
    /// Gets or sets the name of the new playlist.
    public var name: String?
    /// Gets or sets the user id.
    public var userID: String?

    public init(ids: [String]? = nil, mediaType: String? = nil, name: String? = nil, userID: String? = nil) {
        self.ids = ids
        self.mediaType = mediaType
        self.name = name
        self.userID = userID
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.ids = try values.decodeIfPresent([String].self, forKey: "Ids")
        self.mediaType = try values.decodeIfPresent(String.self, forKey: "MediaType")
        self.name = try values.decodeIfPresent(String.self, forKey: "Name")
        self.userID = try values.decodeIfPresent(String.self, forKey: "UserId")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(ids, forKey: "Ids")
        try values.encodeIfPresent(mediaType, forKey: "MediaType")
        try values.encodeIfPresent(name, forKey: "Name")
        try values.encodeIfPresent(userID, forKey: "UserId")
    }
}
