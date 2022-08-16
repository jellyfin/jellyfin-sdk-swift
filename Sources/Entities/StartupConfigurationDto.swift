//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// The startup configuration DTO.
public struct StartupConfigurationDto: Codable {
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
}
