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

extension Paths {
    /// Get Display Preferences.
    public static func getDisplayPreferences(
        displayPreferencesID: String,
        userID: UUID,
        client: String
    ) -> Request<JellyfinAPI.DisplayPreferencesDto> {
        Request(
            method: "GET",
            url: "/DisplayPreferences/\(displayPreferencesID)",
            query: makeGetDisplayPreferencesQuery(userID, client),
            id: "GetDisplayPreferences"
        )
    }

    private static func makeGetDisplayPreferencesQuery(_ userID: UUID, _ client: String) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(userID, forKey: "userId")
        encoder.encode(client, forKey: "client")
        return encoder.items
    }
}
