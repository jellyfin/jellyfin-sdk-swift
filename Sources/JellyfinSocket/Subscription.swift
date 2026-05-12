//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import Foundation

public extension JellyfinSocket {

    /// High volume socket subscriptions
    enum Subscription: Hashable, Sendable {

        case activityLog
        case scheduledTasks
        case sessions

        func startMessage(data: String) -> InboundWebSocketMessage {
            switch self {
            case .activityLog:
                .activityLogEntryStartMessage(
                    .init(
                        data: data,
                        messageType: .activityLogEntryStart
                    )
                )
            case .scheduledTasks:
                .scheduledTasksInfoStartMessage(
                    .init(
                        data: data,
                        messageType: .scheduledTasksInfoStart
                    )
                )
            case .sessions:
                .sessionsStartMessage(
                    .init(
                        data: data,
                        messageType: .sessionsStart
                    )
                )
            }
        }

        var stopMessage: InboundWebSocketMessage {
            switch self {
            case .activityLog:
                .activityLogEntryStopMessage(.init(messageType: .activityLogEntryStop))
            case .scheduledTasks:
                .scheduledTasksInfoStopMessage(.init(messageType: .scheduledTasksInfoStop))
            case .sessions:
                .sessionsStopMessage(.init(messageType: .sessionsStop))
            }
        }
    }
}
