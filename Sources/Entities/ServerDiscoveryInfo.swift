//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// The server discovery info model.
public struct ServerDiscoveryInfo: Codable, Identifiable {
    /// Gets the address.
    public var address: String?
    /// Gets the endpoint address.
    public var endpointAddress: String?
    /// Gets the server identifier.
    public var id: String?
    /// Gets the name.
    public var name: String?

    public init(address: String? = nil, endpointAddress: String? = nil, id: String? = nil, name: String? = nil) {
        self.address = address
        self.endpointAddress = endpointAddress
        self.id = id
        self.name = name
    }
}
