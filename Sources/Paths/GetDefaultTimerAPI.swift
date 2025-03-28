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
    /// Gets the default values for a new timer.
    public static func getDefaultTimer(programID: String? = nil) -> Request<JellyfinAPI.SeriesTimerInfoDto> {
        Request(path: "/LiveTv/Timers/Defaults", method: "GET", query: makeGetDefaultTimerQuery(programID), id: "GetDefaultTimer")
    }

    private static func makeGetDefaultTimerQuery(_ programID: String?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(programID, forKey: "programId")
        return encoder.items
    }
}
