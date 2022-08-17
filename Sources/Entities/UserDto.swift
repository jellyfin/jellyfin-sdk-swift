//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class UserDto.
public struct UserDto: Codable, Identifiable {
    /// Gets or sets the configuration.
    public var configuration: UserConfiguration?
    /// Gets or sets whether async login is enabled or not.
    public var enableAutoLogin: Bool?
    /// Gets or sets a value indicating whether this instance has configured easy password.
    public var hasConfiguredEasyPassword: Bool?
    /// Gets or sets a value indicating whether this instance has configured password.
    public var hasConfiguredPassword: Bool?
    /// Gets or sets a value indicating whether this instance has password.
    public var hasPassword: Bool?
    /// Gets or sets the id.
    public var id: UUID?
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

    public init(configuration: UserConfiguration? = nil, enableAutoLogin: Bool? = nil, hasConfiguredEasyPassword: Bool? = nil, hasConfiguredPassword: Bool? = nil, hasPassword: Bool? = nil, id: UUID? = nil, lastActivityDate: Date? = nil, lastLoginDate: Date? = nil, name: String? = nil, policy: UserPolicy? = nil, primaryImageAspectRatio: Double? = nil, primaryImageTag: String? = nil, serverID: String? = nil, serverName: String? = nil) {
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
}
