//
// Swiftfin is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get
import URLQueryEncoder

public extension Paths {
    /// Uploads a custom splashscreen.
    ///
    /// The body is expected to the image contents base64 encoded.
    static func uploadCustomSplashscreen(_ body: Data? = nil) -> Request<Void> {
        Request(method: "POST", url: "/Branding/Splashscreen", body: body, id: "UploadCustomSplashscreen")
    }
}
