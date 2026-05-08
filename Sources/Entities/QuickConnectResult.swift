//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Stores the state of an quick connect request.
public struct QuickConnectResult: Codable, Hashable, Sendable {
    /// Gets the requesting app name.
    public var appName: String?
    /// Gets the requesting app version.
    public var appVersion: String?
    /// Gets the user facing code used so the user can quickly differentiate this request from others.
    public var code: String?
    /// Gets or sets the DateTime that this request was created.
    public var dateAdded: Date?
    /// Gets the requesting device id.
    public var deviceID: String?
    /// Gets the requesting device name.
    public var deviceName: String?
    /// Gets or sets a value indicating whether this request is authorized.
    public var isAuthenticated: Bool?
    /// Gets the secret value used to uniquely identify this request. Can be used to retrieve authentication information.
    public var secret: String?

    public init(
        appName: String? = nil,
        appVersion: String? = nil,
        code: String? = nil,
        dateAdded: Date? = nil,
        deviceID: String? = nil,
        deviceName: String? = nil,
        isAuthenticated: Bool? = nil,
        secret: String? = nil
    ) {
        self.appName = appName
        self.appVersion = appVersion
        self.code = code
        self.dateAdded = dateAdded
        self.deviceID = deviceID
        self.deviceName = deviceName
        self.isAuthenticated = isAuthenticated
        self.secret = secret
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.appName = try values.decodeIfPresent(String.self, forKey: "AppName")
        self.appVersion = try values.decodeIfPresent(String.self, forKey: "AppVersion")
        self.code = try values.decodeIfPresent(String.self, forKey: "Code")
        self.dateAdded = try values.decodeIfPresent(Date.self, forKey: "DateAdded")
        self.deviceID = try values.decodeIfPresent(String.self, forKey: "DeviceId")
        self.deviceName = try values.decodeIfPresent(String.self, forKey: "DeviceName")
        self.isAuthenticated = try values.decodeIfPresent(Bool.self, forKey: "Authenticated")
        self.secret = try values.decodeIfPresent(String.self, forKey: "Secret")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(appName, forKey: "AppName")
        try values.encodeIfPresent(appVersion, forKey: "AppVersion")
        try values.encodeIfPresent(code, forKey: "Code")
        try values.encodeIfPresent(dateAdded, forKey: "DateAdded")
        try values.encodeIfPresent(deviceID, forKey: "DeviceId")
        try values.encodeIfPresent(deviceName, forKey: "DeviceName")
        try values.encodeIfPresent(isAuthenticated, forKey: "Authenticated")
        try values.encodeIfPresent(secret, forKey: "Secret")
    }
}
