//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// The startup configuration DTO.
public struct StartupConfigurationDto: Codable, Hashable {
    /// Gets or sets the metadata country code.
    public var metadataCountryCode: String?
    /// Gets or sets the preferred language for the metadata.
    public var preferredMetadataLanguage: String?
    /// Gets or sets UI language culture.
    public var uICulture: String?

    public init(metadataCountryCode: String? = nil, preferredMetadataLanguage: String? = nil, uICulture: String? = nil) {
        self.metadataCountryCode = metadataCountryCode
        self.preferredMetadataLanguage = preferredMetadataLanguage
        self.uICulture = uICulture
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.metadataCountryCode = try values.decodeIfPresent(String.self, forKey: "MetadataCountryCode")
        self.preferredMetadataLanguage = try values.decodeIfPresent(String.self, forKey: "PreferredMetadataLanguage")
        self.uICulture = try values.decodeIfPresent(String.self, forKey: "UICulture")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(metadataCountryCode, forKey: "MetadataCountryCode")
        try values.encodeIfPresent(preferredMetadataLanguage, forKey: "PreferredMetadataLanguage")
        try values.encodeIfPresent(uICulture, forKey: "UICulture")
    }
}
