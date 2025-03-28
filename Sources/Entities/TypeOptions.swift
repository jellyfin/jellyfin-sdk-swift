//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct TypeOptions: Codable, Hashable {
    public var imageFetcherOrder: [String]?
    public var imageFetchers: [String]?
    public var imageOptions: [ImageOption]?
    public var metadataFetcherOrder: [String]?
    public var metadataFetchers: [String]?
    public var type: String?

    public init(
        imageFetcherOrder: [String]? = nil,
        imageFetchers: [String]? = nil,
        imageOptions: [ImageOption]? = nil,
        metadataFetcherOrder: [String]? = nil,
        metadataFetchers: [String]? = nil,
        type: String? = nil
    ) {
        self.imageFetcherOrder = imageFetcherOrder
        self.imageFetchers = imageFetchers
        self.imageOptions = imageOptions
        self.metadataFetcherOrder = metadataFetcherOrder
        self.metadataFetchers = metadataFetchers
        self.type = type
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.imageFetcherOrder = try values.decodeIfPresent([String].self, forKey: "ImageFetcherOrder")
        self.imageFetchers = try values.decodeIfPresent([String].self, forKey: "ImageFetchers")
        self.imageOptions = try values.decodeIfPresent([ImageOption].self, forKey: "ImageOptions")
        self.metadataFetcherOrder = try values.decodeIfPresent([String].self, forKey: "MetadataFetcherOrder")
        self.metadataFetchers = try values.decodeIfPresent([String].self, forKey: "MetadataFetchers")
        self.type = try values.decodeIfPresent(String.self, forKey: "Type")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(imageFetcherOrder, forKey: "ImageFetcherOrder")
        try values.encodeIfPresent(imageFetchers, forKey: "ImageFetchers")
        try values.encodeIfPresent(imageOptions, forKey: "ImageOptions")
        try values.encodeIfPresent(metadataFetcherOrder, forKey: "MetadataFetcherOrder")
        try values.encodeIfPresent(metadataFetchers, forKey: "MetadataFetchers")
        try values.encodeIfPresent(type, forKey: "Type")
    }
}
