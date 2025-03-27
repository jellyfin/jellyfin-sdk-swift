//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// The configuration page info.
public struct ConfigurationPageInfo: Codable, Hashable {
    /// Gets or sets the display name.
    public var displayName: String?
    /// Gets or sets a value indicating whether the configurations page is enabled in the main menu.
    public var enableInMainMenu: Bool?
    /// Gets or sets the menu icon.
    public var menuIcon: String?
    /// Gets or sets the menu section.
    public var menuSection: String?
    /// Gets or sets the name.
    public var name: String?
    /// Gets or sets the plugin id.
    public var pluginID: String?

    public init(
        displayName: String? = nil,
        enableInMainMenu: Bool? = nil,
        menuIcon: String? = nil,
        menuSection: String? = nil,
        name: String? = nil,
        pluginID: String? = nil
    ) {
        self.displayName = displayName
        self.enableInMainMenu = enableInMainMenu
        self.menuIcon = menuIcon
        self.menuSection = menuSection
        self.name = name
        self.pluginID = pluginID
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.displayName = try values.decodeIfPresent(String.self, forKey: "DisplayName")
        self.enableInMainMenu = try values.decodeIfPresent(Bool.self, forKey: "EnableInMainMenu")
        self.menuIcon = try values.decodeIfPresent(String.self, forKey: "MenuIcon")
        self.menuSection = try values.decodeIfPresent(String.self, forKey: "MenuSection")
        self.name = try values.decodeIfPresent(String.self, forKey: "Name")
        self.pluginID = try values.decodeIfPresent(String.self, forKey: "PluginId")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(displayName, forKey: "DisplayName")
        try values.encodeIfPresent(enableInMainMenu, forKey: "EnableInMainMenu")
        try values.encodeIfPresent(menuIcon, forKey: "MenuIcon")
        try values.encodeIfPresent(menuSection, forKey: "MenuSection")
        try values.encodeIfPresent(name, forKey: "Name")
        try values.encodeIfPresent(pluginID, forKey: "PluginId")
    }
}
