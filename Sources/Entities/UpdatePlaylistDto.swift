//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Update existing playlist dto. Fields set to `null` will not be updated and keep their current values.
public struct UpdatePlaylistDto: Codable, Hashable {
    /// Gets or sets item ids of the playlist.
    public var ids: [String]?
    /// Gets or sets a value indicating whether the playlist is public.
    public var isPublic: Bool?
    /// Gets or sets the name of the new playlist.
    public var name: String?
    /// Gets or sets the playlist users.
    public var users: [PlaylistUserPermissions]?

    public init(ids: [String]? = nil, isPublic: Bool? = nil, name: String? = nil, users: [PlaylistUserPermissions]? = nil) {
        self.ids = ids
        self.isPublic = isPublic
        self.name = name
        self.users = users
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.ids = try values.decodeIfPresent([String].self, forKey: "Ids")
        self.isPublic = try values.decodeIfPresent(Bool.self, forKey: "IsPublic")
        self.name = try values.decodeIfPresent(String.self, forKey: "Name")
        self.users = try values.decodeIfPresent([PlaylistUserPermissions].self, forKey: "Users")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(ids, forKey: "Ids")
        try values.encodeIfPresent(isPublic, forKey: "IsPublic")
        try values.encodeIfPresent(name, forKey: "Name")
        try values.encodeIfPresent(users, forKey: "Users")
    }
}
