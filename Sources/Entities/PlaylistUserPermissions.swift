//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class to hold data on user permissions for playlists.
public struct PlaylistUserPermissions: Codable, Hashable {
    /// Gets or sets a value indicating whether the user has edit permissions.
    public var canEdit: Bool?
    /// Gets or sets the user id.
    public var userID: String?

    public init(canEdit: Bool? = nil, userID: String? = nil) {
        self.canEdit = canEdit
        self.userID = userID
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.canEdit = try values.decodeIfPresent(Bool.self, forKey: "CanEdit")
        self.userID = try values.decodeIfPresent(String.self, forKey: "UserId")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(canEdit, forKey: "CanEdit")
        try values.encodeIfPresent(userID, forKey: "UserId")
    }
}
