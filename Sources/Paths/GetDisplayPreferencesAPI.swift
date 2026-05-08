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
    /// Get Display Preferences.
    public static func getDisplayPreferences(
        displayPreferencesID: String,
        userID: String? = nil,
        client: String
    ) -> Request<DisplayPreferencesDto> {
        Request(
            path: "/DisplayPreferences/\(displayPreferencesID)",
            method: "GET",
            query: makeGetDisplayPreferencesQuery(userID, client),
            id: "GetDisplayPreferences"
        )
    }

    private static func makeGetDisplayPreferencesQuery(_ userID: String?, _ client: String) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(userID, forKey: "userId")
        encoder.encode(client, forKey: "client")
        return encoder.items
    }
}
