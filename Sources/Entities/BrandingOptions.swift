//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// The branding options.
public struct BrandingOptions: Codable {
    /// Gets or sets the custom CSS.
    public var customCss: String?
    /// Gets or sets the login disclaimer.
    public var loginDisclaimer: String?
    /// Gets or sets a value indicating whether to enable the splashscreen.
    public var isSplashscreenEnabled: Bool?

    public init(customCss: String? = nil, loginDisclaimer: String? = nil, isSplashscreenEnabled: Bool? = nil) {
        self.customCss = customCss
        self.loginDisclaimer = loginDisclaimer
        self.isSplashscreenEnabled = isSplashscreenEnabled
    }
}
