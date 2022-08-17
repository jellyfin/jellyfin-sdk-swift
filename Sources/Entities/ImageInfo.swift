//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class ImageInfo.
public struct ImageInfo: Codable {
    /// Gets or sets the blurhash.
    public var blurHash: String?
    /// Gets or sets the height.
    public var height: Int32?
    /// Gets or sets the index of the image.
    public var imageIndex: Int32?
    /// Gets or sets the image tag.
    public var imageTag: String?
    /// Gets or sets the type of the image.
    public var imageType: ImageType?
    /// Gets or sets the path.
    public var path: String?
    /// Gets or sets the size.
    public var size: Int64?
    /// Gets or sets the width.
    public var width: Int32?

    public init(blurHash: String? = nil, height: Int32? = nil, imageIndex: Int32? = nil, imageTag: String? = nil, imageType: ImageType? = nil, path: String? = nil, size: Int64? = nil, width: Int32? = nil) {
        self.blurHash = blurHash
        self.height = height
        self.imageIndex = imageIndex
        self.imageTag = imageTag
        self.imageType = imageType
        self.path = path
        self.size = size
        self.width = width
    }
}
