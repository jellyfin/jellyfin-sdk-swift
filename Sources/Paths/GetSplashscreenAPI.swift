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
    /// Generates or gets the splashscreen.
    static func getSplashscreen(parameters: GetSplashscreenParameters? = nil) -> Request<Data> {
        Request(path: "/Branding/Splashscreen", method: "GET", query: parameters?.asQuery, id: "GetSplashscreen")
    }

    struct GetSplashscreenParameters {
        public var tag: String?
        public var format: Format?

        public typealias Format = JellyfinAPI.ImageFormat

        public init(tag: String? = nil, format: Format? = nil) {
            self.tag = tag
            self.format = format
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(tag, forKey: "tag")
            encoder.encode(format, forKey: "format")
            return encoder.items
        }
    }
}
