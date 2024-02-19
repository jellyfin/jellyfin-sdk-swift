//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2024 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get
import URLQueryEncoder

public extension Paths {
    /// Update Display Preferences.
    static func updateDisplayPreferences(
        displayPreferencesID: String,
        userID: String,
        client: String,
        _ body: JellyfinAPI.DisplayPreferencesDto
    ) -> Request<Void> {
        Request(
            path: "/DisplayPreferences/\(displayPreferencesID)",
            method: "POST",
            query: [("userId", userID), ("client", client)],
            body: body,
            id: "UpdateDisplayPreferences"
        )
    }
}
