//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct PublicSystemInfo: Codable, Hashable, Identifiable, Sendable {
    /// Gets or sets the id.
    public var id: String?
    /// Gets or sets a value indicating whether the startup wizard is completed.
    public var isStartupWizardCompleted: Bool?
    /// Gets or sets the local address.
    public var localAddress: String?
    /// Gets or sets the operating system.
    @available(*, deprecated, message: "Deprecated")
    public var operatingSystem: String?
    /// Gets or sets the product name. This is the AssemblyProduct name.
    public var productName: String?
    /// Gets or sets the name of the server.
    public var serverName: String?
    /// Gets or sets the server version.
    public var version: String?

    public init(
        id: String? = nil,
        isStartupWizardCompleted: Bool? = nil,
        localAddress: String? = nil,
        operatingSystem: String? = nil,
        productName: String? = nil,
        serverName: String? = nil,
        version: String? = nil
    ) {
        self.id = id
        self.isStartupWizardCompleted = isStartupWizardCompleted
        self.localAddress = localAddress
        self.operatingSystem = operatingSystem
        self.productName = productName
        self.serverName = serverName
        self.version = version
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.id = try values.decodeIfPresent(String.self, forKey: "Id")
        self.isStartupWizardCompleted = try values.decodeIfPresent(Bool.self, forKey: "StartupWizardCompleted")
        self.localAddress = try values.decodeIfPresent(String.self, forKey: "LocalAddress")
        self.operatingSystem = try values.decodeIfPresent(String.self, forKey: "OperatingSystem")
        self.productName = try values.decodeIfPresent(String.self, forKey: "ProductName")
        self.serverName = try values.decodeIfPresent(String.self, forKey: "ServerName")
        self.version = try values.decodeIfPresent(String.self, forKey: "Version")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(id, forKey: "Id")
        try values.encodeIfPresent(isStartupWizardCompleted, forKey: "StartupWizardCompleted")
        try values.encodeIfPresent(localAddress, forKey: "LocalAddress")
        try values.encodeIfPresent(operatingSystem, forKey: "OperatingSystem")
        try values.encodeIfPresent(productName, forKey: "ProductName")
        try values.encodeIfPresent(serverName, forKey: "ServerName")
        try values.encodeIfPresent(version, forKey: "Version")
    }
}
