//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// The different kinds of messages that are used in the WebSocket api.
public enum SessionMessageType: String, Codable, CaseIterable {
    case forceKeepAlive = "ForceKeepAlive"
    case generalCommand = "GeneralCommand"
    case userDataChanged = "UserDataChanged"
    case sessions = "Sessions"
    case play = "Play"
    case syncPlayCommand = "SyncPlayCommand"
    case syncPlayGroupUpdate = "SyncPlayGroupUpdate"
    case playstate = "Playstate"
    case restartRequired = "RestartRequired"
    case serverShuttingDown = "ServerShuttingDown"
    case serverRestarting = "ServerRestarting"
    case libraryChanged = "LibraryChanged"
    case userDeleted = "UserDeleted"
    case userUpdated = "UserUpdated"
    case seriesTimerCreated = "SeriesTimerCreated"
    case timerCreated = "TimerCreated"
    case seriesTimerCancelled = "SeriesTimerCancelled"
    case timerCancelled = "TimerCancelled"
    case refreshProgress = "RefreshProgress"
    case scheduledTaskEnded = "ScheduledTaskEnded"
    case packageInstallationCancelled = "PackageInstallationCancelled"
    case packageInstallationFailed = "PackageInstallationFailed"
    case packageInstallationCompleted = "PackageInstallationCompleted"
    case packageInstalling = "PackageInstalling"
    case packageUninstalled = "PackageUninstalled"
    case activityLogEntry = "ActivityLogEntry"
    case scheduledTasksInfo = "ScheduledTasksInfo"
    case activityLogEntryStart = "ActivityLogEntryStart"
    case activityLogEntryStop = "ActivityLogEntryStop"
    case sessionsStart = "SessionsStart"
    case sessionsStop = "SessionsStop"
    case scheduledTasksInfoStart = "ScheduledTasksInfoStart"
    case scheduledTasksInfoStop = "ScheduledTasksInfoStop"
    case keepAlive = "KeepAlive"
}
