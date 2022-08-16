//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// The configuration page info.
public struct ConfigurationPageInfo: Codable {
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
    public var pluginID: UUID?

    public init(
        displayName: String? = nil,
        enableInMainMenu: Bool? = nil,
        menuIcon: String? = nil,
        menuSection: String? = nil,
        name: String? = nil,
        pluginID: UUID? = nil
    ) {
        self.displayName = displayName
        self.enableInMainMenu = enableInMainMenu
        self.menuIcon = menuIcon
        self.menuSection = menuSection
        self.name = name
        self.pluginID = pluginID
    }
}
