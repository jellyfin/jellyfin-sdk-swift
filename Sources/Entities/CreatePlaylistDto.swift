//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Create new playlist dto.
public struct CreatePlaylistDto: Codable, Hashable {
    /// Gets or sets item ids to add to the playlist.
    public var ids: [String]?
    /// Gets or sets a value indicating whether the playlist is public.
    public var isPublic: Bool?
    /// Gets or sets the media type.
    public var mediaType: MediaType?
    /// Gets or sets the name of the new playlist.
    public var name: String?
    /// Gets or sets the user id.
    public var userID: String?
    /// Gets or sets the playlist users.
    public var users: [PlaylistUserPermissions]?

    public init(
        ids: [String]? = nil,
        isPublic: Bool? = nil,
        mediaType: MediaType? = nil,
        name: String? = nil,
        userID: String? = nil,
        users: [PlaylistUserPermissions]? = nil
    ) {
        self.ids = ids
        self.isPublic = isPublic
        self.mediaType = mediaType
        self.name = name
        self.userID = userID
        self.users = users
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.ids = try values.decodeIfPresent([String].self, forKey: "Ids")
        self.isPublic = try values.decodeIfPresent(Bool.self, forKey: "IsPublic")
        self.mediaType = try values.decodeIfPresent(MediaType.self, forKey: "MediaType")
        self.name = try values.decodeIfPresent(String.self, forKey: "Name")
        self.userID = try values.decodeIfPresent(String.self, forKey: "UserId")
        self.users = try values.decodeIfPresent([PlaylistUserPermissions].self, forKey: "Users")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(ids, forKey: "Ids")
        try values.encodeIfPresent(isPublic, forKey: "IsPublic")
        try values.encodeIfPresent(mediaType, forKey: "MediaType")
        try values.encodeIfPresent(name, forKey: "Name")
        try values.encodeIfPresent(userID, forKey: "UserId")
        try values.encodeIfPresent(users, forKey: "Users")
    }
}
