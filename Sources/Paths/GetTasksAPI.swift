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

extension Paths {
    /// Get tasks.
    public static func getTasks(isHidden: Bool? = nil, isEnabled: Bool? = nil) -> Request<[JellyfinAPI.TaskInfo]> {
        Request(method: "GET", url: "/ScheduledTasks", query: makeGetTasksQuery(isHidden, isEnabled), id: "GetTasks")
    }

    private static func makeGetTasksQuery(_ isHidden: Bool?, _ isEnabled: Bool?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(isHidden, forKey: "isHidden")
        encoder.encode(isEnabled, forKey: "isEnabled")
        return encoder.items
    }
}
