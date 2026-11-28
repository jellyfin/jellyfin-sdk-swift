//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import Foundation

/// This is used by the api to get information about a Person within a BaseItem.
public struct BaseItemPerson: Codable, Hashable, Identifiable, Sendable {
    /// Gets or sets the identifier.
    public var id: String?
    /// Gets or sets the primary image blurhash.
    public var imageBlurHashes: ImageBlurHashes?
    /// Gets or sets the name.
    public var name: String?
    /// Gets or sets the primary image tag.
    public var primaryImageTag: String?
    /// Gets or sets the role.
    public var role: String?
    /// Gets or sets the type.
    public var type: PersonKind?

    public init(
        id: String? = nil,
        imageBlurHashes: ImageBlurHashes? = nil,
        name: String? = nil,
        primaryImageTag: String? = nil,
        role: String? = nil,
        type: PersonKind? = nil
    ) {
        self.id = id
        self.imageBlurHashes = imageBlurHashes
        self.name = name
        self.primaryImageTag = primaryImageTag
        self.role = role
        self.type = type
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.id = try values.decodeIfPresent(String.self, forKey: "Id")
        self.imageBlurHashes = try values.decodeIfPresent(ImageBlurHashes.self, forKey: "ImageBlurHashes")
        self.name = try values.decodeIfPresent(String.self, forKey: "Name")
        self.primaryImageTag = try values.decodeIfPresent(String.self, forKey: "PrimaryImageTag")
        self.role = try values.decodeIfPresent(String.self, forKey: "Role")
        self.type = try values.decodeIfPresent(PersonKind.self, forKey: "Type")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(id, forKey: "Id")
        try values.encodeIfPresent(imageBlurHashes, forKey: "ImageBlurHashes")
        try values.encodeIfPresent(name, forKey: "Name")
        try values.encodeIfPresent(primaryImageTag, forKey: "PrimaryImageTag")
        try values.encodeIfPresent(role, forKey: "Role")
        try values.encodeIfPresent(type, forKey: "Type")
    }
}
