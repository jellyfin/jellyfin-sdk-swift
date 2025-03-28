//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Channel mapping options dto.
public struct ChannelMappingOptionsDto: Codable, Hashable {
    /// Gets or sets list of mappings.
    public var mappings: [NameValuePair]?
    /// Gets or sets list of provider channels.
    public var providerChannels: [NameIDPair]?
    /// Gets or sets provider name.
    public var providerName: String?
    /// Gets or sets list of tuner channels.
    public var tunerChannels: [TunerChannelMapping]?

    public init(
        mappings: [NameValuePair]? = nil,
        providerChannels: [NameIDPair]? = nil,
        providerName: String? = nil,
        tunerChannels: [TunerChannelMapping]? = nil
    ) {
        self.mappings = mappings
        self.providerChannels = providerChannels
        self.providerName = providerName
        self.tunerChannels = tunerChannels
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.mappings = try values.decodeIfPresent([NameValuePair].self, forKey: "Mappings")
        self.providerChannels = try values.decodeIfPresent([NameIDPair].self, forKey: "ProviderChannels")
        self.providerName = try values.decodeIfPresent(String.self, forKey: "ProviderName")
        self.tunerChannels = try values.decodeIfPresent([TunerChannelMapping].self, forKey: "TunerChannels")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(mappings, forKey: "Mappings")
        try values.encodeIfPresent(providerChannels, forKey: "ProviderChannels")
        try values.encodeIfPresent(providerName, forKey: "ProviderName")
        try values.encodeIfPresent(tunerChannels, forKey: "TunerChannels")
    }
}
