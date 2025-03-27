//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class MediaAttachment.
public struct MediaAttachment: Codable, Hashable {
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
    public var index: Int?
    /// Gets or sets the MIME type.
    public var mimeType: String?

    public init(
        codec: String? = nil,
        codecTag: String? = nil,
        comment: String? = nil,
        deliveryURL: String? = nil,
        fileName: String? = nil,
        index: Int? = nil,
        mimeType: String? = nil
    ) {
        self.codec = codec
        self.codecTag = codecTag
        self.comment = comment
        self.deliveryURL = deliveryURL
        self.fileName = fileName
        self.index = index
        self.mimeType = mimeType
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.codec = try values.decodeIfPresent(String.self, forKey: "Codec")
        self.codecTag = try values.decodeIfPresent(String.self, forKey: "CodecTag")
        self.comment = try values.decodeIfPresent(String.self, forKey: "Comment")
        self.deliveryURL = try values.decodeIfPresent(String.self, forKey: "DeliveryUrl")
        self.fileName = try values.decodeIfPresent(String.self, forKey: "FileName")
        self.index = try values.decodeIfPresent(Int.self, forKey: "Index")
        self.mimeType = try values.decodeIfPresent(String.self, forKey: "MimeType")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(codec, forKey: "Codec")
        try values.encodeIfPresent(codecTag, forKey: "CodecTag")
        try values.encodeIfPresent(comment, forKey: "Comment")
        try values.encodeIfPresent(deliveryURL, forKey: "DeliveryUrl")
        try values.encodeIfPresent(fileName, forKey: "FileName")
        try values.encodeIfPresent(index, forKey: "Index")
        try values.encodeIfPresent(mimeType, forKey: "MimeType")
    }
}
