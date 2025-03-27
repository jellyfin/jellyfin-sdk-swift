//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct AuthenticationInfo: Codable, Hashable, Identifiable {
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
    public var userID: String?
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
        userID: String? = nil,
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

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.accessToken = try values.decodeIfPresent(String.self, forKey: "AccessToken")
        self.appName = try values.decodeIfPresent(String.self, forKey: "AppName")
        self.appVersion = try values.decodeIfPresent(String.self, forKey: "AppVersion")
        self.dateCreated = try values.decodeIfPresent(Date.self, forKey: "DateCreated")
        self.dateLastActivity = try values.decodeIfPresent(Date.self, forKey: "DateLastActivity")
        self.dateRevoked = try values.decodeIfPresent(Date.self, forKey: "DateRevoked")
        self.deviceID = try values.decodeIfPresent(String.self, forKey: "DeviceId")
        self.deviceName = try values.decodeIfPresent(String.self, forKey: "DeviceName")
        self.id = try values.decodeIfPresent(Int.self, forKey: "Id")
        self.isActive = try values.decodeIfPresent(Bool.self, forKey: "IsActive")
        self.userID = try values.decodeIfPresent(String.self, forKey: "UserId")
        self.userName = try values.decodeIfPresent(String.self, forKey: "UserName")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(accessToken, forKey: "AccessToken")
        try values.encodeIfPresent(appName, forKey: "AppName")
        try values.encodeIfPresent(appVersion, forKey: "AppVersion")
        try values.encodeIfPresent(dateCreated, forKey: "DateCreated")
        try values.encodeIfPresent(dateLastActivity, forKey: "DateLastActivity")
        try values.encodeIfPresent(dateRevoked, forKey: "DateRevoked")
        try values.encodeIfPresent(deviceID, forKey: "DeviceId")
        try values.encodeIfPresent(deviceName, forKey: "DeviceName")
        try values.encodeIfPresent(id, forKey: "Id")
        try values.encodeIfPresent(isActive, forKey: "IsActive")
        try values.encodeIfPresent(userID, forKey: "UserId")
        try values.encodeIfPresent(userName, forKey: "UserName")
    }
}
