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
    /// Uploads a custom splashscreen.
    ///
    /// The body is expected to the image contents base64 encoded.
    static func uploadCustomSplashscreen(_ body: Data? = nil) -> Request<Void> {
        Request(path: "/Branding/Splashscreen", method: "POST", body: body, id: "UploadCustomSplashscreen")
    }
}
