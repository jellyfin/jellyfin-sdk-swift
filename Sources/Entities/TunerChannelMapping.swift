//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct TunerChannelMapping: Codable, Hashable, Identifiable {
    public var id: String?
    public var name: String?
    public var providerChannelID: String?
    public var providerChannelName: String?

    public init(id: String? = nil, name: String? = nil, providerChannelID: String? = nil, providerChannelName: String? = nil) {
        self.id = id
        self.name = name
        self.providerChannelID = providerChannelID
        self.providerChannelName = providerChannelName
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.id = try values.decodeIfPresent(String.self, forKey: "Id")
        self.name = try values.decodeIfPresent(String.self, forKey: "Name")
        self.providerChannelID = try values.decodeIfPresent(String.self, forKey: "ProviderChannelId")
        self.providerChannelName = try values.decodeIfPresent(String.self, forKey: "ProviderChannelName")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(id, forKey: "Id")
        try values.encodeIfPresent(name, forKey: "Name")
        try values.encodeIfPresent(providerChannelID, forKey: "ProviderChannelId")
        try values.encodeIfPresent(providerChannelName, forKey: "ProviderChannelName")
    }
}
