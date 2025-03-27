//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class PackageInfo.
public struct PackageInfo: Codable, Hashable {
    /// Gets or sets the category.
    public var category: String?
    /// Gets or sets a long description of the plugin containing features or helpful explanations.
    public var description: String?
    /// Gets or sets the guid of the assembly associated with this plugin.
    ///
    /// This is used to identify the proper item for automatic updates.
    public var guid: String?
    /// Gets or sets the image url for the package.
    public var imageURL: String?
    /// Gets or sets the name.
    public var name: String?
    /// Gets or sets a short overview of what the plugin does.
    public var overview: String?
    /// Gets or sets the owner.
    public var owner: String?
    /// Gets or sets the versions.
    public var versions: [VersionInfo]?

    public init(
        category: String? = nil,
        description: String? = nil,
        guid: String? = nil,
        imageURL: String? = nil,
        name: String? = nil,
        overview: String? = nil,
        owner: String? = nil,
        versions: [VersionInfo]? = nil
    ) {
        self.category = category
        self.description = description
        self.guid = guid
        self.imageURL = imageURL
        self.name = name
        self.overview = overview
        self.owner = owner
        self.versions = versions
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.category = try values.decodeIfPresent(String.self, forKey: "category")
        self.description = try values.decodeIfPresent(String.self, forKey: "description")
        self.guid = try values.decodeIfPresent(String.self, forKey: "guid")
        self.imageURL = try values.decodeIfPresent(String.self, forKey: "imageUrl")
        self.name = try values.decodeIfPresent(String.self, forKey: "name")
        self.overview = try values.decodeIfPresent(String.self, forKey: "overview")
        self.owner = try values.decodeIfPresent(String.self, forKey: "owner")
        self.versions = try values.decodeIfPresent([VersionInfo].self, forKey: "versions")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(category, forKey: "category")
        try values.encodeIfPresent(description, forKey: "description")
        try values.encodeIfPresent(guid, forKey: "guid")
        try values.encodeIfPresent(imageURL, forKey: "imageUrl")
        try values.encodeIfPresent(name, forKey: "name")
        try values.encodeIfPresent(overview, forKey: "overview")
        try values.encodeIfPresent(owner, forKey: "owner")
        try values.encodeIfPresent(versions, forKey: "versions")
    }
}
