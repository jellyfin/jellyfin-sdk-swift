//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Stores the state of an quick connect request.
public struct QuickConnectResult: Codable {
    /// Gets the requesting app name.
    public var appName: String?
    /// Gets the requesting app version.
    public var appVersion: String?
    /// Gets or sets a value indicating whether this request is authorized.
    public var isAuthenticated: Bool?
    /// Gets the user facing code used so the user can quickly differentiate this request from others.
    public var code: String?
    /// Gets or sets the DateTime that this request was created.
    public var dateAdded: Date?
    /// Gets the requesting device id.
    public var deviceID: String?
    /// Gets the requesting device name.
    public var deviceName: String?
    /// Gets the secret value used to uniquely identify this request. Can be used to retrieve authentication information.
    public var secret: String?

    public init(
        appName: String? = nil,
        appVersion: String? = nil,
        isAuthenticated: Bool? = nil,
        code: String? = nil,
        dateAdded: Date? = nil,
        deviceID: String? = nil,
        deviceName: String? = nil,
        secret: String? = nil
    ) {
        self.appName = appName
        self.appVersion = appVersion
        self.isAuthenticated = isAuthenticated
        self.code = code
        self.dateAdded = dateAdded
        self.deviceID = deviceID
        self.deviceName = deviceName
        self.secret = secret
    }
}
