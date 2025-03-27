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

extension Paths {
    /// Gets the configuration pages.
    public static func getConfigurationPages(enableInMainMenu: Bool? = nil) -> Request<[JellyfinAPI.ConfigurationPageInfo]> {
        Request(
            path: "/web/ConfigurationPages",
            method: "GET",
            query: makeGetConfigurationPagesQuery(enableInMainMenu),
            id: "GetConfigurationPages"
        )
    }

    private static func makeGetConfigurationPagesQuery(_ enableInMainMenu: Bool?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(enableInMainMenu, forKey: "enableInMainMenu")
        return encoder.items
    }
}
