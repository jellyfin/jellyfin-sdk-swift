//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Represents the list of possible outbound websocket types
public enum OutboundWebSocketMessage: Codable, Hashable {
    case activityLogEntryMessage(ActivityLogEntryMessage)
    case forceKeepAliveMessage(ForceKeepAliveMessage)
    case generalCommandMessage(GeneralCommandMessage)
    case libraryChangedMessage(LibraryChangedMessage)
    case outboundKeepAliveMessage(OutboundKeepAliveMessage)
    case playMessage(PlayMessage)
    case playstateMessage(PlaystateMessage)
    case pluginInstallationCancelledMessage(PluginInstallationCancelledMessage)
    case pluginInstallationCompletedMessage(PluginInstallationCompletedMessage)
    case pluginInstallationFailedMessage(PluginInstallationFailedMessage)
    case pluginInstallingMessage(PluginInstallingMessage)
    case pluginUninstalledMessage(PluginUninstalledMessage)
    case refreshProgressMessage(RefreshProgressMessage)
    case restartRequiredMessage(RestartRequiredMessage)
    case scheduledTaskEndedMessage(ScheduledTaskEndedMessage)
    case scheduledTasksInfoMessage(ScheduledTasksInfoMessage)
    case seriesTimerCancelledMessage(SeriesTimerCancelledMessage)
    case seriesTimerCreatedMessage(SeriesTimerCreatedMessage)
    case serverRestartingMessage(ServerRestartingMessage)
    case serverShuttingDownMessage(ServerShuttingDownMessage)
    case sessionsMessage(SessionsMessage)
    case syncPlayCommandMessage(SyncPlayCommandMessage)
    case syncPlayGroupUpdateCommandMessage(SyncPlayGroupUpdateCommandMessage)
    case timerCancelledMessage(TimerCancelledMessage)
    case timerCreatedMessage(TimerCreatedMessage)
    case userDataChangedMessage(UserDataChangedMessage)
    case userDeletedMessage(UserDeletedMessage)
    case userUpdatedMessage(UserUpdatedMessage)

    public init(from decoder: Decoder) throws {

        struct Discriminator: Decodable {
            let MessageType: String
        }

        let container = try decoder.singleValueContainer()
        let discriminatorValue = try container.decode(Discriminator.self).MessageType

        switch discriminatorValue {
        case "ActivityLogEntry": self = try .activityLogEntryMessage(container.decode(ActivityLogEntryMessage.self))
        case "ForceKeepAlive": self = try .forceKeepAliveMessage(container.decode(ForceKeepAliveMessage.self))
        case "GeneralCommand": self = try .generalCommandMessage(container.decode(GeneralCommandMessage.self))
        case "LibraryChanged": self = try .libraryChangedMessage(container.decode(LibraryChangedMessage.self))
        case "KeepAlive": self = try .outboundKeepAliveMessage(container.decode(OutboundKeepAliveMessage.self))
        case "Play": self = try .playMessage(container.decode(PlayMessage.self))
        case "Playstate": self = try .playstateMessage(container.decode(PlaystateMessage.self))
        case "PackageInstallationCancelled": self = try .pluginInstallationCancelledMessage(container
                .decode(PluginInstallationCancelledMessage.self))
        case "PackageInstallationCompleted": self = try .pluginInstallationCompletedMessage(container
                .decode(PluginInstallationCompletedMessage.self))
        case "PackageInstallationFailed": self = try .pluginInstallationFailedMessage(container
                .decode(PluginInstallationFailedMessage.self))
        case "PackageInstalling": self = try .pluginInstallingMessage(container.decode(PluginInstallingMessage.self))
        case "PackageUninstalled": self = try .pluginUninstalledMessage(container.decode(PluginUninstalledMessage.self))
        case "RefreshProgress": self = try .refreshProgressMessage(container.decode(RefreshProgressMessage.self))
        case "RestartRequired": self = try .restartRequiredMessage(container.decode(RestartRequiredMessage.self))
        case "ScheduledTaskEnded": self = try .scheduledTaskEndedMessage(container.decode(ScheduledTaskEndedMessage.self))
        case "ScheduledTasksInfo": self = try .scheduledTasksInfoMessage(container.decode(ScheduledTasksInfoMessage.self))
        case "SeriesTimerCancelled": self = try .seriesTimerCancelledMessage(container.decode(SeriesTimerCancelledMessage.self))
        case "SeriesTimerCreated": self = try .seriesTimerCreatedMessage(container.decode(SeriesTimerCreatedMessage.self))
        case "ServerRestarting": self = try .serverRestartingMessage(container.decode(ServerRestartingMessage.self))
        case "ServerShuttingDown": self = try .serverShuttingDownMessage(container.decode(ServerShuttingDownMessage.self))
        case "Sessions": self = try .sessionsMessage(container.decode(SessionsMessage.self))
        case "SyncPlayCommand": self = try .syncPlayCommandMessage(container.decode(SyncPlayCommandMessage.self))
        case "SyncPlayGroupUpdate": self = try .syncPlayGroupUpdateCommandMessage(container.decode(SyncPlayGroupUpdateCommandMessage.self))
        case "TimerCancelled": self = try .timerCancelledMessage(container.decode(TimerCancelledMessage.self))
        case "TimerCreated": self = try .timerCreatedMessage(container.decode(TimerCreatedMessage.self))
        case "UserDataChanged": self = try .userDataChangedMessage(container.decode(UserDataChangedMessage.self))
        case "UserDeleted": self = try .userDeletedMessage(container.decode(UserDeletedMessage.self))
        case "UserUpdated": self = try .userUpdatedMessage(container.decode(UserUpdatedMessage.self))
        default:
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Discriminator value '\(discriminatorValue)' does not match any expected values (ActivityLogEntry, ForceKeepAlive, GeneralCommand, LibraryChanged, KeepAlive, Play, Playstate, PackageInstallationCancelled, PackageInstallationCompleted, PackageInstallationFailed, PackageInstalling, PackageUninstalled, RefreshProgress, RestartRequired, ScheduledTaskEnded, ScheduledTasksInfo, SeriesTimerCancelled, SeriesTimerCreated, ServerRestarting, ServerShuttingDown, Sessions, SyncPlayCommand, SyncPlayGroupUpdate, TimerCancelled, TimerCreated, UserDataChanged, UserDeleted, UserUpdated)."
            )
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .activityLogEntryMessage(value): try container.encode(value)
        case let .forceKeepAliveMessage(value): try container.encode(value)
        case let .generalCommandMessage(value): try container.encode(value)
        case let .libraryChangedMessage(value): try container.encode(value)
        case let .outboundKeepAliveMessage(value): try container.encode(value)
        case let .playMessage(value): try container.encode(value)
        case let .playstateMessage(value): try container.encode(value)
        case let .pluginInstallationCancelledMessage(value): try container.encode(value)
        case let .pluginInstallationCompletedMessage(value): try container.encode(value)
        case let .pluginInstallationFailedMessage(value): try container.encode(value)
        case let .pluginInstallingMessage(value): try container.encode(value)
        case let .pluginUninstalledMessage(value): try container.encode(value)
        case let .refreshProgressMessage(value): try container.encode(value)
        case let .restartRequiredMessage(value): try container.encode(value)
        case let .scheduledTaskEndedMessage(value): try container.encode(value)
        case let .scheduledTasksInfoMessage(value): try container.encode(value)
        case let .seriesTimerCancelledMessage(value): try container.encode(value)
        case let .seriesTimerCreatedMessage(value): try container.encode(value)
        case let .serverRestartingMessage(value): try container.encode(value)
        case let .serverShuttingDownMessage(value): try container.encode(value)
        case let .sessionsMessage(value): try container.encode(value)
        case let .syncPlayCommandMessage(value): try container.encode(value)
        case let .syncPlayGroupUpdateCommandMessage(value): try container.encode(value)
        case let .timerCancelledMessage(value): try container.encode(value)
        case let .timerCreatedMessage(value): try container.encode(value)
        case let .userDataChangedMessage(value): try container.encode(value)
        case let .userDeletedMessage(value): try container.encode(value)
        case let .userUpdatedMessage(value): try container.encode(value)
        }
    }
}
