//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct AuthenticationInfo: Codable, Identifiable {
    /// Gets or sets the access token.
    public var accessToken: String?
    /// Gets or sets the name of the application.
    public var appName: String?
    /// Gets or sets the application version.
    public var appVersion: String?
    /// Gets or sets the date created.
    public var dateCreated: Date?
    public var dateLastActivity: Date?
    /// Gets or sets the date revoked.
    public var dateRevoked: Date?
    /// Gets or sets the device identifier.
    public var deviceID: String?
    /// Gets or sets the name of the device.
    public var deviceName: String?
    /// Gets or sets the identifier.
    public var id: Int?
    /// Gets or sets a value indicating whether this instance is active.
    public var isActive: Bool?
    /// Gets or sets the user identifier.
    public var userID: UUID?
    public var userName: String?

    public init(
        accessToken: String? = nil,
        appName: String? = nil,
        appVersion: String? = nil,
        dateCreated: Date? = nil,
        dateLastActivity: Date? = nil,
        dateRevoked: Date? = nil,
        deviceID: String? = nil,
        deviceName: String? = nil,
        id: Int? = nil,
        isActive: Bool? = nil,
        userID: UUID? = nil,
        userName: String? = nil
    ) {
        self.accessToken = accessToken
        self.appName = appName
        self.appVersion = appVersion
        self.dateCreated = dateCreated
        self.dateLastActivity = dateLastActivity
        self.dateRevoked = dateRevoked
        self.deviceID = deviceID
        self.deviceName = deviceName
        self.id = id
        self.isActive = isActive
        self.userID = userID
        self.userName = userName
    }
}
