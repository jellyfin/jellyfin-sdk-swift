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
    /// Gets a dashboard configuration page.
    public static func getDashboardConfigurationPage(name: String? = nil) -> Request<String> {
        Request(
            path: "/web/ConfigurationPage",
            method: "GET",
            query: makeGetDashboardConfigurationPageQuery(name),
            id: "GetDashboardConfigurationPage"
        )
    }

    private static func makeGetDashboardConfigurationPageQuery(_ name: String?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(name, forKey: "name")
        return encoder.items
    }
}
