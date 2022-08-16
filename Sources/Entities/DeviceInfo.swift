//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct DeviceInfo: Codable, Identifiable {
    /// Gets or sets the access token.
    public var accessToken: String?
    /// Gets or sets the name of the application.
    public var appName: String?
    /// Gets or sets the application version.
    public var appVersion: String?
    /// Gets or sets the capabilities.
    public var capabilities: ClientCapabilities?
    /// Gets or sets the date last modified.
    public var dateLastActivity: Date?
    public var iconURL: String?
    /// Gets or sets the identifier.
    public var id: String?
    /// Gets or sets the last user identifier.
    public var lastUserID: UUID?
    /// Gets or sets the last name of the user.
    public var lastUserName: String?
    public var name: String?

    public init(
        accessToken: String? = nil,
        appName: String? = nil,
        appVersion: String? = nil,
        capabilities: ClientCapabilities? = nil,
        dateLastActivity: Date? = nil,
        iconURL: String? = nil,
        id: String? = nil,
        lastUserID: UUID? = nil,
        lastUserName: String? = nil,
        name: String? = nil
    ) {
        self.accessToken = accessToken
        self.appName = appName
        self.appVersion = appVersion
        self.capabilities = capabilities
        self.dateLastActivity = dateLastActivity
        self.iconURL = iconURL
        self.id = id
        self.lastUserID = lastUserID
        self.lastUserName = lastUserName
        self.name = name
    }
}
