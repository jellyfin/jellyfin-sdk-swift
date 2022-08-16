//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Set channel mapping dto.
public struct SetChannelMappingDto: Codable {
    /// Gets or sets the provider channel id.
    public var providerChannelID: String
    /// Gets or sets the provider id.
    public var providerID: String
    /// Gets or sets the tuner channel id.
    public var tunerChannelID: String

    public init(providerChannelID: String, providerID: String, tunerChannelID: String) {
        self.providerChannelID = providerChannelID
        self.providerID = providerID
        self.tunerChannelID = tunerChannelID
    }
}
