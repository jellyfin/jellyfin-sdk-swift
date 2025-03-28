//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class MetadataOptions.
public struct MetadataOptions: Codable, Hashable {
    public var disabledImageFetchers: [String]?
    public var disabledMetadataFetchers: [String]?
    public var disabledMetadataSavers: [String]?
    public var imageFetcherOrder: [String]?
    public var itemType: String?
    public var localMetadataReaderOrder: [String]?
    public var metadataFetcherOrder: [String]?

    public init(
        disabledImageFetchers: [String]? = nil,
        disabledMetadataFetchers: [String]? = nil,
        disabledMetadataSavers: [String]? = nil,
        imageFetcherOrder: [String]? = nil,
        itemType: String? = nil,
        localMetadataReaderOrder: [String]? = nil,
        metadataFetcherOrder: [String]? = nil
    ) {
        self.disabledImageFetchers = disabledImageFetchers
        self.disabledMetadataFetchers = disabledMetadataFetchers
        self.disabledMetadataSavers = disabledMetadataSavers
        self.imageFetcherOrder = imageFetcherOrder
        self.itemType = itemType
        self.localMetadataReaderOrder = localMetadataReaderOrder
        self.metadataFetcherOrder = metadataFetcherOrder
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.disabledImageFetchers = try values.decodeIfPresent([String].self, forKey: "DisabledImageFetchers")
        self.disabledMetadataFetchers = try values.decodeIfPresent([String].self, forKey: "DisabledMetadataFetchers")
        self.disabledMetadataSavers = try values.decodeIfPresent([String].self, forKey: "DisabledMetadataSavers")
        self.imageFetcherOrder = try values.decodeIfPresent([String].self, forKey: "ImageFetcherOrder")
        self.itemType = try values.decodeIfPresent(String.self, forKey: "ItemType")
        self.localMetadataReaderOrder = try values.decodeIfPresent([String].self, forKey: "LocalMetadataReaderOrder")
        self.metadataFetcherOrder = try values.decodeIfPresent([String].self, forKey: "MetadataFetcherOrder")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(disabledImageFetchers, forKey: "DisabledImageFetchers")
        try values.encodeIfPresent(disabledMetadataFetchers, forKey: "DisabledMetadataFetchers")
        try values.encodeIfPresent(disabledMetadataSavers, forKey: "DisabledMetadataSavers")
        try values.encodeIfPresent(imageFetcherOrder, forKey: "ImageFetcherOrder")
        try values.encodeIfPresent(itemType, forKey: "ItemType")
        try values.encodeIfPresent(localMetadataReaderOrder, forKey: "LocalMetadataReaderOrder")
        try values.encodeIfPresent(metadataFetcherOrder, forKey: "MetadataFetcherOrder")
    }
}
