//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct PublicSystemInfo: Codable, Identifiable {
    /// Gets or sets the id.
    public var id: String?
    /// Gets or sets the local address.
    public var localAddress: String?
    /// Gets or sets the operating system.
    public var operatingSystem: String?
    /// Gets or sets the product name. This is the AssemblyProduct name.
    public var productName: String?
    /// Gets or sets the name of the server.
    public var serverName: String?
    /// Gets or sets a value indicating whether the startup wizard is completed.
    public var isStartupWizardCompleted: Bool?
    /// Gets or sets the server version.
    public var version: String?

    public init(id: String? = nil, localAddress: String? = nil, operatingSystem: String? = nil, productName: String? = nil, serverName: String? = nil, isStartupWizardCompleted: Bool? = nil, version: String? = nil) {
        self.id = id
        self.localAddress = localAddress
        self.operatingSystem = operatingSystem
        self.productName = productName
        self.serverName = serverName
        self.isStartupWizardCompleted = isStartupWizardCompleted
        self.version = version
    }
}
