//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import Foundation

/// DTO for playlists.
public struct PlaylistDto: Codable, Hashable, Sendable {
    /// Gets or sets a value indicating whether the playlist is publicly readable.
    public var isOpenAccess: Bool?
    /// Gets or sets the item ids.
    public var itemIDs: [String]?
    /// Gets or sets the share permissions.
    public var shares: [PlaylistUserPermissions]?

    public init(isOpenAccess: Bool? = nil, itemIDs: [String]? = nil, shares: [PlaylistUserPermissions]? = nil) {
        self.isOpenAccess = isOpenAccess
        self.itemIDs = itemIDs
        self.shares = shares
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.isOpenAccess = try values.decodeIfPresent(Bool.self, forKey: "OpenAccess")
        self.itemIDs = try values.decodeIfPresent([String].self, forKey: "ItemIds")
        self.shares = try values.decodeIfPresent([PlaylistUserPermissions].self, forKey: "Shares")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(isOpenAccess, forKey: "OpenAccess")
        try values.encodeIfPresent(itemIDs, forKey: "ItemIds")
        try values.encodeIfPresent(shares, forKey: "Shares")
    }
}
