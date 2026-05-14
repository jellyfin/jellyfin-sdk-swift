//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Represents the list of possible outbound websocket types
public enum OutboundWebSocketMessage: Codable, Hashable, Sendable {
    case activityLogEntryMessage(ActivityLogEntryMessage)
    case forceKeepAliveMessage(ForceKeepAliveMessage)
    case generalCommandMessage(GeneralCommandMessage)
    case libraryChangedMessage(LibraryChangedMessage)
    case outboundKeepAliveMessage(WebSocketMessageIDInfo)
    case playMessage(PlayMessage)
    case playstateMessage(PlaystateMessage)
    case pluginInstallationCancelledMessage(PluginInstallationMessageInfo)
    case pluginInstallationCompletedMessage(PluginInstallationMessageInfo)
    case pluginInstallationFailedMessage(PluginInstallationMessageInfo)
    case pluginInstallingMessage(PluginInstallationMessageInfo)
    case pluginUninstalledMessage(PluginUninstalledMessage)
    case refreshProgressMessage(RefreshProgressMessage)
    case restartRequiredMessage(WebSocketMessageIDInfo)
    case scheduledTaskEndedMessage(ScheduledTaskEndedMessage)
    case scheduledTasksInfoMessage(ScheduledTasksInfoMessage)
    case seriesTimerCancelledMessage(TimerMessageInfo)
    case seriesTimerCreatedMessage(TimerMessageInfo)
    case serverRestartingMessage(WebSocketMessageIDInfo)
    case serverShuttingDownMessage(WebSocketMessageIDInfo)
    case sessionsMessage(SessionsMessage)
    case syncPlayCommandMessage(SyncPlayCommandMessage)
    case timerCancelledMessage(TimerMessageInfo)
    case timerCreatedMessage(TimerMessageInfo)
    case userDataChangedMessage(UserDataChangedMessage)
    case userDeletedMessage(UserDeletedMessage)
    case userUpdatedMessage(UserUpdatedMessage)
    case syncPlayGroupUpdateMessage(SyncPlayGroupUpdateMessage)

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
        case "KeepAlive": self = try .outboundKeepAliveMessage(container.decode(WebSocketMessageIDInfo.self))
        case "LibraryChanged": self = try .libraryChangedMessage(container.decode(LibraryChangedMessage.self))
        case "PackageInstallationCancelled": self = try .pluginInstallationCancelledMessage(container
                .decode(PluginInstallationMessageInfo.self))
        case "PackageInstallationCompleted": self = try .pluginInstallationCompletedMessage(container
                .decode(PluginInstallationMessageInfo.self))
        case "PackageInstallationFailed": self = try .pluginInstallationFailedMessage(container.decode(PluginInstallationMessageInfo.self))
        case "PackageInstalling": self = try .pluginInstallingMessage(container.decode(PluginInstallationMessageInfo.self))
        case "PackageUninstalled": self = try .pluginUninstalledMessage(container.decode(PluginUninstalledMessage.self))
        case "Play": self = try .playMessage(container.decode(PlayMessage.self))
        case "Playstate": self = try .playstateMessage(container.decode(PlaystateMessage.self))
        case "RefreshProgress": self = try .refreshProgressMessage(container.decode(RefreshProgressMessage.self))
        case "RestartRequired": self = try .restartRequiredMessage(container.decode(WebSocketMessageIDInfo.self))
        case "ScheduledTaskEnded": self = try .scheduledTaskEndedMessage(container.decode(ScheduledTaskEndedMessage.self))
        case "ScheduledTasksInfo": self = try .scheduledTasksInfoMessage(container.decode(ScheduledTasksInfoMessage.self))
        case "SeriesTimerCancelled": self = try .seriesTimerCancelledMessage(container.decode(TimerMessageInfo.self))
        case "SeriesTimerCreated": self = try .seriesTimerCreatedMessage(container.decode(TimerMessageInfo.self))
        case "ServerRestarting": self = try .serverRestartingMessage(container.decode(WebSocketMessageIDInfo.self))
        case "ServerShuttingDown": self = try .serverShuttingDownMessage(container.decode(WebSocketMessageIDInfo.self))
        case "Sessions": self = try .sessionsMessage(container.decode(SessionsMessage.self))
        case "SyncPlayCommand": self = try .syncPlayCommandMessage(container.decode(SyncPlayCommandMessage.self))
        case "SyncPlayGroupUpdate": self = try .syncPlayGroupUpdateMessage(container.decode(SyncPlayGroupUpdateMessage.self))
        case "TimerCancelled": self = try .timerCancelledMessage(container.decode(TimerMessageInfo.self))
        case "TimerCreated": self = try .timerCreatedMessage(container.decode(TimerMessageInfo.self))
        case "UserDataChanged": self = try .userDataChangedMessage(container.decode(UserDataChangedMessage.self))
        case "UserDeleted": self = try .userDeletedMessage(container.decode(UserDeletedMessage.self))
        case "UserUpdated": self = try .userUpdatedMessage(container.decode(UserUpdatedMessage.self))
        default:
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Discriminator value '\(discriminatorValue)' does not match any expected values (ActivityLogEntry, ForceKeepAlive, GeneralCommand, KeepAlive, LibraryChanged, PackageInstallationCancelled, PackageInstallationCompleted, PackageInstallationFailed, PackageInstalling, PackageUninstalled, Play, Playstate, RefreshProgress, RestartRequired, ScheduledTaskEnded, ScheduledTasksInfo, SeriesTimerCancelled, SeriesTimerCreated, ServerRestarting, ServerShuttingDown, Sessions, SyncPlayCommand, SyncPlayGroupUpdate, TimerCancelled, TimerCreated, UserDataChanged, UserDeleted, UserUpdated)."
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
        case let .timerCancelledMessage(value): try container.encode(value)
        case let .timerCreatedMessage(value): try container.encode(value)
        case let .userDataChangedMessage(value): try container.encode(value)
        case let .userDeletedMessage(value): try container.encode(value)
        case let .userUpdatedMessage(value): try container.encode(value)
        case let .syncPlayGroupUpdateMessage(value): try container.encode(value)
        }
    }
}
