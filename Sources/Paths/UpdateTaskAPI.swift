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
    /// Update specified task triggers.
    static public func updateTask(taskID: String, _ body: [JellyfinAPI.TaskTriggerInfo]) -> Request<Void> {
        Request(method: "POST", url: "/ScheduledTasks/\(taskID)/Triggers", body: body, id: "UpdateTask")
    }
}
