//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class PackageInfo.
public struct PackageInfo: Codable {
    /// Gets or sets the category.
    public var category: String?
    /// Gets or sets a long description of the plugin containing features or helpful explanations.
    public var description: String?
    /// Gets or sets the guid of the assembly associated with this plugin.
    /// 
    /// This is used to identify the proper item for automatic updates.
    public var guid: UUID?
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

    public init(category: String? = nil, description: String? = nil, guid: UUID? = nil, imageURL: String? = nil, name: String? = nil, overview: String? = nil, owner: String? = nil, versions: [VersionInfo]? = nil) {
        self.category = category
        self.description = description
        self.guid = guid
        self.imageURL = imageURL
        self.name = name
        self.overview = overview
        self.owner = owner
        self.versions = versions
    }
}
