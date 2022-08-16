//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Channel mapping options dto.
public struct ChannelMappingOptionsDto: Codable {
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
}
