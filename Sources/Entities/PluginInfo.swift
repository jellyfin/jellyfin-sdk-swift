//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// This is a serializable stub class that is used by the api to provide information about installed plugins.
public struct PluginInfo: Codable, Hashable, Identifiable {
    /// Gets or sets a value indicating whether the plugin can be uninstalled.
    public var canUninstall: Bool?
    /// Gets or sets the name of the configuration file.
    public var configurationFileName: String?
    /// Gets or sets the description.
    public var description: String?
    /// Gets or sets a value indicating whether this plugin has a valid image.
    public var hasImage: Bool?
    /// Gets or sets the unique id.
    public var id: String?
    /// Gets or sets the name.
    public var name: String?
    /// Gets or sets a value indicating the status of the plugin.
    public var status: PluginStatus?
    /// Gets or sets the version.
    public var version: String?

    public init(
        canUninstall: Bool? = nil,
        configurationFileName: String? = nil,
        description: String? = nil,
        hasImage: Bool? = nil,
        id: String? = nil,
        name: String? = nil,
        status: PluginStatus? = nil,
        version: String? = nil
    ) {
        self.canUninstall = canUninstall
        self.configurationFileName = configurationFileName
        self.description = description
        self.hasImage = hasImage
        self.id = id
        self.name = name
        self.status = status
        self.version = version
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.canUninstall = try values.decodeIfPresent(Bool.self, forKey: "CanUninstall")
        self.configurationFileName = try values.decodeIfPresent(String.self, forKey: "ConfigurationFileName")
        self.description = try values.decodeIfPresent(String.self, forKey: "Description")
        self.hasImage = try values.decodeIfPresent(Bool.self, forKey: "HasImage")
        self.id = try values.decodeIfPresent(String.self, forKey: "Id")
        self.name = try values.decodeIfPresent(String.self, forKey: "Name")
        self.status = try values.decodeIfPresent(PluginStatus.self, forKey: "Status")
        self.version = try values.decodeIfPresent(String.self, forKey: "Version")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(canUninstall, forKey: "CanUninstall")
        try values.encodeIfPresent(configurationFileName, forKey: "ConfigurationFileName")
        try values.encodeIfPresent(description, forKey: "Description")
        try values.encodeIfPresent(hasImage, forKey: "HasImage")
        try values.encodeIfPresent(id, forKey: "Id")
        try values.encodeIfPresent(name, forKey: "Name")
        try values.encodeIfPresent(status, forKey: "Status")
        try values.encodeIfPresent(version, forKey: "Version")
    }
}
