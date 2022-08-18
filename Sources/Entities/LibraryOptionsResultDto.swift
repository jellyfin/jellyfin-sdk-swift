//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Library options result dto.
public struct LibraryOptionsResultDto: Codable {
    /// Gets or sets the metadata readers.
    public var metadataReaders: [LibraryOptionInfoDto]?
    /// Gets or sets the metadata savers.
    public var metadataSavers: [LibraryOptionInfoDto]?
    /// Gets or sets the subtitle fetchers.
    public var subtitleFetchers: [LibraryOptionInfoDto]?
    /// Gets or sets the type options.
    public var typeOptions: [LibraryTypeOptionsDto]?

    public init(
        metadataReaders: [LibraryOptionInfoDto]? = nil,
        metadataSavers: [LibraryOptionInfoDto]? = nil,
        subtitleFetchers: [LibraryOptionInfoDto]? = nil,
        typeOptions: [LibraryTypeOptionsDto]? = nil
    ) {
        self.metadataReaders = metadataReaders
        self.metadataSavers = metadataSavers
        self.subtitleFetchers = subtitleFetchers
        self.typeOptions = typeOptions
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.metadataReaders = try values.decodeIfPresent([LibraryOptionInfoDto].self, forKey: "MetadataReaders")
        self.metadataSavers = try values.decodeIfPresent([LibraryOptionInfoDto].self, forKey: "MetadataSavers")
        self.subtitleFetchers = try values.decodeIfPresent([LibraryOptionInfoDto].self, forKey: "SubtitleFetchers")
        self.typeOptions = try values.decodeIfPresent([LibraryTypeOptionsDto].self, forKey: "TypeOptions")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(metadataReaders, forKey: "MetadataReaders")
        try values.encodeIfPresent(metadataSavers, forKey: "MetadataSavers")
        try values.encodeIfPresent(subtitleFetchers, forKey: "SubtitleFetchers")
        try values.encodeIfPresent(typeOptions, forKey: "TypeOptions")
    }
}
