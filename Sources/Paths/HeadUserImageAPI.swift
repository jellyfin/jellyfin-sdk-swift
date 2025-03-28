//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get
import URLQueryEncoder

public extension Paths {
    /// Get user profile image.
    static func headUserImage(parameters: HeadUserImageParameters? = nil) -> Request<Data> {
        Request(path: "/UserImage", method: "HEAD", query: parameters?.asQuery, id: "HeadUserImage")
    }

    struct HeadUserImageParameters {
        public var userID: String?
        public var tag: String?
        public var format: Format?
        public var maxWidth: Int?
        public var maxHeight: Int?
        public var percentPlayed: Double?
        public var unplayedCount: Int?
        public var width: Int?
        public var height: Int?
        public var quality: Int?
        public var fillWidth: Int?
        public var fillHeight: Int?
        public var blur: Int?
        public var backgroundColor: String?
        public var foregroundLayer: String?
        public var imageIndex: Int?

        public typealias Format = JellyfinAPI.ImageFormat

        public init(
            userID: String? = nil,
            tag: String? = nil,
            format: Format? = nil,
            maxWidth: Int? = nil,
            maxHeight: Int? = nil,
            percentPlayed: Double? = nil,
            unplayedCount: Int? = nil,
            width: Int? = nil,
            height: Int? = nil,
            quality: Int? = nil,
            fillWidth: Int? = nil,
            fillHeight: Int? = nil,
            blur: Int? = nil,
            backgroundColor: String? = nil,
            foregroundLayer: String? = nil,
            imageIndex: Int? = nil
        ) {
            self.userID = userID
            self.tag = tag
            self.format = format
            self.maxWidth = maxWidth
            self.maxHeight = maxHeight
            self.percentPlayed = percentPlayed
            self.unplayedCount = unplayedCount
            self.width = width
            self.height = height
            self.quality = quality
            self.fillWidth = fillWidth
            self.fillHeight = fillHeight
            self.blur = blur
            self.backgroundColor = backgroundColor
            self.foregroundLayer = foregroundLayer
            self.imageIndex = imageIndex
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(userID, forKey: "userId")
            encoder.encode(tag, forKey: "tag")
            encoder.encode(format, forKey: "format")
            encoder.encode(maxWidth, forKey: "maxWidth")
            encoder.encode(maxHeight, forKey: "maxHeight")
            encoder.encode(percentPlayed, forKey: "percentPlayed")
            encoder.encode(unplayedCount, forKey: "unplayedCount")
            encoder.encode(width, forKey: "width")
            encoder.encode(height, forKey: "height")
            encoder.encode(quality, forKey: "quality")
            encoder.encode(fillWidth, forKey: "fillWidth")
            encoder.encode(fillHeight, forKey: "fillHeight")
            encoder.encode(blur, forKey: "blur")
            encoder.encode(backgroundColor, forKey: "backgroundColor")
            encoder.encode(foregroundLayer, forKey: "foregroundLayer")
            encoder.encode(imageIndex, forKey: "imageIndex")
            return encoder.items
        }
    }
}
