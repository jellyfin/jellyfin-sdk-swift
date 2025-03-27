//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Library type options dto.
public struct LibraryTypeOptionsDto: Codable, Hashable {
    /// Gets or sets the default image options.
    public var defaultImageOptions: [ImageOption]?
    /// Gets or sets the image fetchers.
    public var imageFetchers: [LibraryOptionInfoDto]?
    /// Gets or sets the metadata fetchers.
    public var metadataFetchers: [LibraryOptionInfoDto]?
    /// Gets or sets the supported image types.
    public var supportedImageTypes: [ImageType]?
    /// Gets or sets the type.
    public var type: String?

    public init(
        defaultImageOptions: [ImageOption]? = nil,
        imageFetchers: [LibraryOptionInfoDto]? = nil,
        metadataFetchers: [LibraryOptionInfoDto]? = nil,
        supportedImageTypes: [ImageType]? = nil,
        type: String? = nil
    ) {
        self.defaultImageOptions = defaultImageOptions
        self.imageFetchers = imageFetchers
        self.metadataFetchers = metadataFetchers
        self.supportedImageTypes = supportedImageTypes
        self.type = type
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.defaultImageOptions = try values.decodeIfPresent([ImageOption].self, forKey: "DefaultImageOptions")
        self.imageFetchers = try values.decodeIfPresent([LibraryOptionInfoDto].self, forKey: "ImageFetchers")
        self.metadataFetchers = try values.decodeIfPresent([LibraryOptionInfoDto].self, forKey: "MetadataFetchers")
        self.supportedImageTypes = try values.decodeIfPresent([ImageType].self, forKey: "SupportedImageTypes")
        self.type = try values.decodeIfPresent(String.self, forKey: "Type")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(defaultImageOptions, forKey: "DefaultImageOptions")
        try values.encodeIfPresent(imageFetchers, forKey: "ImageFetchers")
        try values.encodeIfPresent(metadataFetchers, forKey: "MetadataFetchers")
        try values.encodeIfPresent(supportedImageTypes, forKey: "SupportedImageTypes")
        try values.encodeIfPresent(type, forKey: "Type")
    }
}
