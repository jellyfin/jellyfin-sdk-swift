//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class ImageInfo.
public struct ImageInfo: Codable, Hashable {
    /// Gets or sets the blurhash.
    public var blurHash: String?
    /// Gets or sets the height.
    public var height: Int?
    /// Gets or sets the index of the image.
    public var imageIndex: Int?
    /// Gets or sets the image tag.
    public var imageTag: String?
    /// Gets or sets the type of the image.
    public var imageType: ImageType?
    /// Gets or sets the path.
    public var path: String?
    /// Gets or sets the size.
    public var size: Int?
    /// Gets or sets the width.
    public var width: Int?

    public init(
        blurHash: String? = nil,
        height: Int? = nil,
        imageIndex: Int? = nil,
        imageTag: String? = nil,
        imageType: ImageType? = nil,
        path: String? = nil,
        size: Int? = nil,
        width: Int? = nil
    ) {
        self.blurHash = blurHash
        self.height = height
        self.imageIndex = imageIndex
        self.imageTag = imageTag
        self.imageType = imageType
        self.path = path
        self.size = size
        self.width = width
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.blurHash = try values.decodeIfPresent(String.self, forKey: "BlurHash")
        self.height = try values.decodeIfPresent(Int.self, forKey: "Height")
        self.imageIndex = try values.decodeIfPresent(Int.self, forKey: "ImageIndex")
        self.imageTag = try values.decodeIfPresent(String.self, forKey: "ImageTag")
        self.imageType = try values.decodeIfPresent(ImageType.self, forKey: "ImageType")
        self.path = try values.decodeIfPresent(String.self, forKey: "Path")
        self.size = try values.decodeIfPresent(Int.self, forKey: "Size")
        self.width = try values.decodeIfPresent(Int.self, forKey: "Width")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(blurHash, forKey: "BlurHash")
        try values.encodeIfPresent(height, forKey: "Height")
        try values.encodeIfPresent(imageIndex, forKey: "ImageIndex")
        try values.encodeIfPresent(imageTag, forKey: "ImageTag")
        try values.encodeIfPresent(imageType, forKey: "ImageType")
        try values.encodeIfPresent(path, forKey: "Path")
        try values.encodeIfPresent(size, forKey: "Size")
        try values.encodeIfPresent(width, forKey: "Width")
    }
}
