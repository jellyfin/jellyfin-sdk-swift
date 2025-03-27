//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class ImageProviderInfo.
public struct ImageProviderInfo: Codable, Hashable {
    /// Gets the name.
    public var name: String?
    /// Gets the supported image types.
    public var supportedImages: [ImageType]?

    public init(name: String? = nil, supportedImages: [ImageType]? = nil) {
        self.name = name
        self.supportedImages = supportedImages
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.name = try values.decodeIfPresent(String.self, forKey: "Name")
        self.supportedImages = try values.decodeIfPresent([ImageType].self, forKey: "SupportedImages")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(name, forKey: "Name")
        try values.encodeIfPresent(supportedImages, forKey: "SupportedImages")
    }
}
