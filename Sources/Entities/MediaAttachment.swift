//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class MediaAttachment.
public struct MediaAttachment: Codable {
    /// Gets or sets the codec.
    public var codec: String?
    /// Gets or sets the codec tag.
    public var codecTag: String?
    /// Gets or sets the comment.
    public var comment: String?
    /// Gets or sets the delivery URL.
    public var deliveryURL: String?
    /// Gets or sets the filename.
    public var fileName: String?
    /// Gets or sets the index.
    public var index: Int32?
    /// Gets or sets the MIME type.
    public var mimeType: String?

    public init(codec: String? = nil, codecTag: String? = nil, comment: String? = nil, deliveryURL: String? = nil, fileName: String? = nil, index: Int32? = nil, mimeType: String? = nil) {
        self.codec = codec
        self.codecTag = codecTag
        self.comment = comment
        self.deliveryURL = deliveryURL
        self.fileName = fileName
        self.index = index
        self.mimeType = mimeType
    }
}
