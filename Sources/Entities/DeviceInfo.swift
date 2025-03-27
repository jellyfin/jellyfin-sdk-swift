//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct DeviceInfo: Codable, Hashable, Identifiable {
    /// Gets or sets the access token.
    public var accessToken: String?
    /// Gets or sets the name of the application.
    public var appName: String?
    /// Gets or sets the application version.
    public var appVersion: String?
    /// Gets or sets the capabilities.
    public var capabilities: ClientCapabilities?
    public var customName: String?
    /// Gets or sets the date last modified.
    public var dateLastActivity: Date?
    public var iconURL: String?
    /// Gets or sets the identifier.
    public var id: String?
    /// Gets or sets the last user identifier.
    public var lastUserID: String?
    /// Gets or sets the last name of the user.
    public var lastUserName: String?
    public var name: String?

    public init(
        accessToken: String? = nil,
        appName: String? = nil,
        appVersion: String? = nil,
        capabilities: ClientCapabilities? = nil,
        customName: String? = nil,
        dateLastActivity: Date? = nil,
        iconURL: String? = nil,
        id: String? = nil,
        lastUserID: String? = nil,
        lastUserName: String? = nil,
        name: String? = nil
    ) {
        self.accessToken = accessToken
        self.appName = appName
        self.appVersion = appVersion
        self.capabilities = capabilities
        self.customName = customName
        self.dateLastActivity = dateLastActivity
        self.iconURL = iconURL
        self.id = id
        self.lastUserID = lastUserID
        self.lastUserName = lastUserName
        self.name = name
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.accessToken = try values.decodeIfPresent(String.self, forKey: "AccessToken")
        self.appName = try values.decodeIfPresent(String.self, forKey: "AppName")
        self.appVersion = try values.decodeIfPresent(String.self, forKey: "AppVersion")
        self.capabilities = try values.decodeIfPresent(ClientCapabilities.self, forKey: "Capabilities")
        self.customName = try values.decodeIfPresent(String.self, forKey: "CustomName")
        self.dateLastActivity = try values.decodeIfPresent(Date.self, forKey: "DateLastActivity")
        self.iconURL = try values.decodeIfPresent(String.self, forKey: "IconUrl")
        self.id = try values.decodeIfPresent(String.self, forKey: "Id")
        self.lastUserID = try values.decodeIfPresent(String.self, forKey: "LastUserId")
        self.lastUserName = try values.decodeIfPresent(String.self, forKey: "LastUserName")
        self.name = try values.decodeIfPresent(String.self, forKey: "Name")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(accessToken, forKey: "AccessToken")
        try values.encodeIfPresent(appName, forKey: "AppName")
        try values.encodeIfPresent(appVersion, forKey: "AppVersion")
        try values.encodeIfPresent(capabilities, forKey: "Capabilities")
        try values.encodeIfPresent(customName, forKey: "CustomName")
        try values.encodeIfPresent(dateLastActivity, forKey: "DateLastActivity")
        try values.encodeIfPresent(iconURL, forKey: "IconUrl")
        try values.encodeIfPresent(id, forKey: "Id")
        try values.encodeIfPresent(lastUserID, forKey: "LastUserId")
        try values.encodeIfPresent(lastUserName, forKey: "LastUserName")
        try values.encodeIfPresent(name, forKey: "Name")
    }
}
