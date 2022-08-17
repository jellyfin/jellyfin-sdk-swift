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

public extension Paths {
    /// Generates or gets the splashscreen.
    static func getSplashscreen(parameters: GetSplashscreenParameters? = nil) -> Request<Data> {
        Request(method: "GET", url: "/Branding/Splashscreen", query: parameters?.asQuery, id: "GetSplashscreen")
    }

    struct GetSplashscreenParameters {
        public var tag: String?
        public var format: Format?
        public var maxWidth: Int32?
        public var maxHeight: Int32?
        public var width: Int32?
        public var height: Int32?
        public var fillWidth: Int32?
        public var fillHeight: Int32?
        public var blur: Int32?
        public var backgroundColor: String?
        public var foregroundLayer: String?
        public var quality: Int32?

        public typealias Format = JellyfinAPI.ImageFormat

        public init(
            tag: String? = nil,
            format: Format? = nil,
            maxWidth: Int32? = nil,
            maxHeight: Int32? = nil,
            width: Int32? = nil,
            height: Int32? = nil,
            fillWidth: Int32? = nil,
            fillHeight: Int32? = nil,
            blur: Int32? = nil,
            backgroundColor: String? = nil,
            foregroundLayer: String? = nil,
            quality: Int32? = nil
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
