//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Specific high-volume sockets that must be opted into to receive data.
public enum SocketSubscription: Hashable, Sendable {

    case activityLog
    case scheduledTasks
    case sessions

    /// Default initial delay before the server starts sending updates.
    public var defaultInitialDelay: Duration {
        switch self {
        case .activityLog:
            .seconds(5)
        case .scheduledTasks, .sessions:
            .zero
        }
    }

    /// Default interval between updates.
    public var defaultInterval: Duration {
        switch self {
        case .activityLog, .scheduledTasks:
            .seconds(5)
        case .sessions:
            .seconds(2)
        }
    }

    func startMessage(initialDelay: Duration, interval: Duration) -> InboundWebSocketMessage {
        let data = "\(toMilliseconds(initialDelay)),\(toMilliseconds(interval))"

        switch self {
        case .activityLog:
            return .activityLogEntryStartMessage(
                ActivityLogEntryStartMessage(
                    data: data,
                    messageType: .activityLogEntryStart
                )
            )
        case .scheduledTasks:
            return .scheduledTasksInfoStartMessage(
                ScheduledTasksInfoStartMessage(
                    data: data,
                    messageType: .scheduledTasksInfoStart
                )
            )
        case .sessions:
            return .sessionsStartMessage(
                SessionsStartMessage(
                    data: data,
                    messageType: .sessionsStart
                )
            )
        }
    }

    var stopMessage: InboundWebSocketMessage {
        switch self {
        case .activityLog:
            .activityLogEntryStopMessage(ActivityLogEntryStopMessage(messageType: .activityLogEntryStop))
        case .scheduledTasks:
            .scheduledTasksInfoStopMessage(ScheduledTasksInfoStopMessage(messageType: .scheduledTasksInfoStop))
        case .sessions:
            .sessionsStopMessage(SessionsStopMessage(messageType: .sessionsStop))
        }
    }

    /// Jellyfin only accepts an Int as Milliseconds.
    private func toMilliseconds(_ duration: Duration) -> Int {
        Int(duration.components.seconds * 1000 + duration.components.attoseconds / 1_000_000_000_000_000)
    }
}
