//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get
import URLQueryEncoder

extension Paths {
    /// Gets the item's image.
    static public func headItemImage2(itemID: String, imageType: String, maxWidth: Int, maxHeight: Int, tag: String, format: String, percentPlayed: String, unplayedCount: Int, imageIndex: Int, parameters: HeadItemImage2Parameters? = nil) -> Request<Data> {
        Request(method: "HEAD", url: "/Items/\(itemID)/Images/\(imageType)/\(imageIndex)/\(tag)/\(format)/\(maxWidth)/\(maxHeight)/\(percentPlayed)/\(unplayedCount)", query: parameters?.asQuery, id: "HeadItemImage2")
    }

    public struct HeadItemImage2Parameters {
        public var width: Int32?
        public var height: Int32?
        public var quality: Int32?
        public var fillWidth: Int32?
        public var fillHeight: Int32?
        public var isCropWhitespace: Bool?
        public var isAddPlayedIndicator: Bool?
        public var blur: Int32?
        public var backgroundColor: String?
        public var foregroundLayer: String?

        public init(width: Int32? = nil, height: Int32? = nil, quality: Int32? = nil, fillWidth: Int32? = nil, fillHeight: Int32? = nil, isCropWhitespace: Bool? = nil, isAddPlayedIndicator: Bool? = nil, blur: Int32? = nil, backgroundColor: String? = nil, foregroundLayer: String? = nil) {
            self.width = width
            self.height = height
            self.quality = quality
            self.fillWidth = fillWidth
            self.fillHeight = fillHeight
            self.isCropWhitespace = isCropWhitespace
            self.isAddPlayedIndicator = isAddPlayedIndicator
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
            encoder.encode(isCropWhitespace, forKey: "cropWhitespace")
            encoder.encode(isAddPlayedIndicator, forKey: "addPlayedIndicator")
            encoder.encode(blur, forKey: "blur")
            encoder.encode(backgroundColor, forKey: "backgroundColor")
            encoder.encode(foregroundLayer, forKey: "foregroundLayer")
            return encoder.items
        }
    }
}
