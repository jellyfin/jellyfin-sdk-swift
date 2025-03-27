//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Set channel mapping dto.
public struct SetChannelMappingDto: Codable, Hashable {
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

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.providerChannelID = try values.decode(String.self, forKey: "ProviderChannelId")
        self.providerID = try values.decode(String.self, forKey: "ProviderId")
        self.tunerChannelID = try values.decode(String.self, forKey: "TunerChannelId")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(providerChannelID, forKey: "ProviderChannelId")
        try values.encode(providerID, forKey: "ProviderId")
        try values.encode(tunerChannelID, forKey: "TunerChannelId")
    }
}
