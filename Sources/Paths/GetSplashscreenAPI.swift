//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get

extension Paths {
    /// Generates or gets the splashscreen.
    public static func getSplashscreen(tag: String? = nil, format: ImageFormat? = nil) -> Request<Data> {
        Request(path: "/Branding/Splashscreen", method: "GET", query: makeGetSplashscreenQuery(tag, format), id: "GetSplashscreen")
    }

    private static func makeGetSplashscreenQuery(_ tag: String?, _ format: ImageFormat?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(tag, forKey: "tag")
        encoder.encode(format, forKey: "format")
        return encoder.items
    }
}
