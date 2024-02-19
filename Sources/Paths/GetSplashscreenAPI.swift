//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2024 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get
import URLQueryEncoder

public extension Paths {
    /// Generates or gets the splashscreen.
    static func getSplashscreen(parameters: GetSplashscreenParameters? = nil) -> Request<Data> {
        Request(path: "/Branding/Splashscreen", method: "GET", query: parameters?.asQuery, id: "GetSplashscreen")
    }

    struct GetSplashscreenParameters {
        public var tag: String?
        public var format: Format?
        public var maxWidth: Int?
        public var maxHeight: Int?
        public var width: Int?
        public var height: Int?
        public var fillWidth: Int?
        public var fillHeight: Int?
        public var blur: Int?
        public var backgroundColor: String?
        public var foregroundLayer: String?
        public var quality: Int?

        public typealias Format = JellyfinAPI.ImageFormat

        public init(
            tag: String? = nil,
            format: Format? = nil,
            maxWidth: Int? = nil,
            maxHeight: Int? = nil,
            width: Int? = nil,
            height: Int? = nil,
            fillWidth: Int? = nil,
            fillHeight: Int? = nil,
            blur: Int? = nil,
            backgroundColor: String? = nil,
            foregroundLayer: String? = nil,
            quality: Int? = nil
        ) {
            self.tag = tag
            self.format = format
            self.maxWidth = maxWidth
            self.maxHeight = maxHeight
            self.width = width
            self.height = height
            self.fillWidth = fillWidth
            self.fillHeight = fillHeight
            self.blur = blur
            self.backgroundColor = backgroundColor
            self.foregroundLayer = foregroundLayer
            self.quality = quality
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(tag, forKey: "tag")
            encoder.encode(format, forKey: "format")
            encoder.encode(maxWidth, forKey: "maxWidth")
            encoder.encode(maxHeight, forKey: "maxHeight")
            encoder.encode(width, forKey: "width")
            encoder.encode(height, forKey: "height")
            encoder.encode(fillWidth, forKey: "fillWidth")
            encoder.encode(fillHeight, forKey: "fillHeight")
            encoder.encode(blur, forKey: "blur")
            encoder.encode(backgroundColor, forKey: "backgroundColor")
            encoder.encode(foregroundLayer, forKey: "foregroundLayer")
            encoder.encode(quality, forKey: "quality")
            return encoder.items
        }
    }
}
