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
    /// Gets the item's image.
    static func headItemImage2(
        itemID: String,
        imageType: String,
        maxWidth: Int,
        maxHeight: Int,
        tag: String,
        format: String,
        percentPlayed: String,
        unplayedCount: Int,
        imageIndex: Int,
        parameters: HeadItemImage2Parameters? = nil
    ) -> Request<Data> {
        Request(
            path: "/Items/\(itemID)/Images/\(imageType)/\(imageIndex)/\(tag)/\(format)/\(maxWidth)/\(maxHeight)/\(percentPlayed)/\(unplayedCount)",
            method: "HEAD",
            query: parameters?.asQuery,
            id: "HeadItemImage2"
        )
    }

    struct HeadItemImage2Parameters {
        public var width: Int?
        public var height: Int?
        public var quality: Int?
        public var fillWidth: Int?
        public var fillHeight: Int?
        public var blur: Int?
        public var backgroundColor: String?
        public var foregroundLayer: String?

        public init(
            width: Int? = nil,
            height: Int? = nil,
            quality: Int? = nil,
            fillWidth: Int? = nil,
            fillHeight: Int? = nil,
            blur: Int? = nil,
            backgroundColor: String? = nil,
            foregroundLayer: String? = nil
        ) {
            self.width = width
            self.height = height
            self.quality = quality
            self.fillWidth = fillWidth
            self.fillHeight = fillHeight
            self.blur = blur
            self.backgroundColor = backgroundColor
            self.foregroundLayer = foregroundLayer
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(width, forKey: "width")
            encoder.encode(height, forKey: "height")
            encoder.encode(quality, forKey: "quality")
            encoder.encode(fillWidth, forKey: "fillWidth")
            encoder.encode(fillHeight, forKey: "fillHeight")
            encoder.encode(blur, forKey: "blur")
            encoder.encode(backgroundColor, forKey: "backgroundColor")
            encoder.encode(foregroundLayer, forKey: "foregroundLayer")
            return encoder.items
        }
    }
}
