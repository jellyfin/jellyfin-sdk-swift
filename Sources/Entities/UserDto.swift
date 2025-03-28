//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class UserDto.
public struct UserDto: Codable, Hashable, Identifiable {
    /// Gets or sets the configuration.
    public var configuration: UserConfiguration?
    /// Gets or sets whether async login is enabled or not.
    public var enableAutoLogin: Bool?
    /// Gets or sets a value indicating whether this instance has configured easy password.
    ///
    /// - warning: Deprecated.
    public var hasConfiguredEasyPassword: Bool?
    /// Gets or sets a value indicating whether this instance has configured password.
    public var hasConfiguredPassword: Bool?
    /// Gets or sets a value indicating whether this instance has password.
    public var hasPassword: Bool?
    /// Gets or sets the id.
    public var id: String?
    /// Gets or sets the last activity date.
    public var lastActivityDate: Date?
    /// Gets or sets the last login date.
    public var lastLoginDate: Date?
    /// Gets or sets the name.
    public var name: String?
    /// Gets or sets the policy.
    public var policy: UserPolicy?
    /// Gets or sets the primary image aspect ratio.
    public var primaryImageAspectRatio: Double?
    /// Gets or sets the primary image tag.
    public var primaryImageTag: String?
    /// Gets or sets the server identifier.
    public var serverID: String?
    /// Gets or sets the name of the server.
    ///
    /// This is not used by the server and is for client-side usage only.
    public var serverName: String?

    public init(
        configuration: UserConfiguration? = nil,
        enableAutoLogin: Bool? = nil,
        hasConfiguredEasyPassword: Bool? = nil,
        hasConfiguredPassword: Bool? = nil,
        hasPassword: Bool? = nil,
        id: String? = nil,
        lastActivityDate: Date? = nil,
        lastLoginDate: Date? = nil,
        name: String? = nil,
        policy: UserPolicy? = nil,
        primaryImageAspectRatio: Double? = nil,
        primaryImageTag: String? = nil,
        serverID: String? = nil,
        serverName: String? = nil
    ) {
        self.configuration = configuration
        self.enableAutoLogin = enableAutoLogin
        self.hasConfiguredEasyPassword = hasConfiguredEasyPassword
        self.hasConfiguredPassword = hasConfiguredPassword
        self.hasPassword = hasPassword
        self.id = id
        self.lastActivityDate = lastActivityDate
        self.lastLoginDate = lastLoginDate
        self.name = name
        self.policy = policy
        self.primaryImageAspectRatio = primaryImageAspectRatio
        self.primaryImageTag = primaryImageTag
        self.serverID = serverID
        self.serverName = serverName
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.configuration = try values.decodeIfPresent(UserConfiguration.self, forKey: "Configuration")
        self.enableAutoLogin = try values.decodeIfPresent(Bool.self, forKey: "EnableAutoLogin")
        self.hasConfiguredEasyPassword = try values.decodeIfPresent(Bool.self, forKey: "HasConfiguredEasyPassword")
        self.hasConfiguredPassword = try values.decodeIfPresent(Bool.self, forKey: "HasConfiguredPassword")
        self.hasPassword = try values.decodeIfPresent(Bool.self, forKey: "HasPassword")
        self.id = try values.decodeIfPresent(String.self, forKey: "Id")
        self.lastActivityDate = try values.decodeIfPresent(Date.self, forKey: "LastActivityDate")
        self.lastLoginDate = try values.decodeIfPresent(Date.self, forKey: "LastLoginDate")
        self.name = try values.decodeIfPresent(String.self, forKey: "Name")
        self.policy = try values.decodeIfPresent(UserPolicy.self, forKey: "Policy")
        self.primaryImageAspectRatio = try values.decodeIfPresent(Double.self, forKey: "PrimaryImageAspectRatio")
        self.primaryImageTag = try values.decodeIfPresent(String.self, forKey: "PrimaryImageTag")
        self.serverID = try values.decodeIfPresent(String.self, forKey: "ServerId")
        self.serverName = try values.decodeIfPresent(String.self, forKey: "ServerName")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(configuration, forKey: "Configuration")
        try values.encodeIfPresent(enableAutoLogin, forKey: "EnableAutoLogin")
        try values.encodeIfPresent(hasConfiguredEasyPassword, forKey: "HasConfiguredEasyPassword")
        try values.encodeIfPresent(hasConfiguredPassword, forKey: "HasConfiguredPassword")
        try values.encodeIfPresent(hasPassword, forKey: "HasPassword")
        try values.encodeIfPresent(id, forKey: "Id")
        try values.encodeIfPresent(lastActivityDate, forKey: "LastActivityDate")
        try values.encodeIfPresent(lastLoginDate, forKey: "LastLoginDate")
        try values.encodeIfPresent(name, forKey: "Name")
        try values.encodeIfPresent(policy, forKey: "Policy")
        try values.encodeIfPresent(primaryImageAspectRatio, forKey: "PrimaryImageAspectRatio")
        try values.encodeIfPresent(primaryImageTag, forKey: "PrimaryImageTag")
        try values.encodeIfPresent(serverID, forKey: "ServerId")
        try values.encodeIfPresent(serverName, forKey: "ServerName")
    }
}
