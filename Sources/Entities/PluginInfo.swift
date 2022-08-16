//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// This is a serializable stub class that is used by the api to provide information about installed plugins.
public struct PluginInfo: Codable, Identifiable {
    /// Gets or sets a value indicating whether the plugin can be uninstalled.
    public var canUninstall: Bool?
    /// Gets or sets the name of the configuration file.
    public var configurationFileName: String?
    /// Gets or sets the description.
    public var description: String?
    /// Gets or sets a value indicating whether this plugin has a valid image.
    public var hasImage: Bool?
    /// Gets or sets the unique id.
    public var id: UUID?
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
        id: UUID? = nil,
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
}
