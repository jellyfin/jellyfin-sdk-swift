//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

extension InboundWebSocketMessage {
    /// Returns the message type for the inbound message
    var sessionMessageType: SessionMessageType? {
        switch self {
        case .activityLogEntryStartMessage(let message):
            return message.messageType
        case .activityLogEntryStopMessage(let message):
            return message.messageType
        case .inboundKeepAliveMessage(let message):
            return message.messageType
        case .scheduledTasksInfoStartMessage(let message):
            return message.messageType
        case .scheduledTasksInfoStopMessage(let message):
            return message.messageType
        case .sessionsStartMessage(let message):
            return message.messageType
        case .sessionsStopMessage(let message):
            return message.messageType
        }
    }
}

extension OutboundWebSocketMessage {
    /// Returns the message type for the outbound message
    var sessionMessageType: SessionMessageType? {
        switch self {
        case .activityLogEntryMessage(let message):
            return message.messageType
        case .forceKeepAliveMessage(let message):
            return message.messageType
        case .generalCommandMessage(let message):
            return message.messageType
        case .libraryChangedMessage(let message):
            return message.messageType
        case .outboundKeepAliveMessage(let message):
            return message.messageType
        case .playMessage(let message):
            return message.messageType
        case .playstateMessage(let message):
            return message.messageType
        case .pluginInstallationCancelledMessage(let message):
            return message.messageType
        case .pluginInstallationCompletedMessage(let message):
            return message.messageType
        case .pluginInstallationFailedMessage(let message):
            return message.messageType
        case .pluginInstallingMessage(let message):
            return message.messageType
        case .pluginUninstalledMessage(let message):
            return message.messageType
        case .refreshProgressMessage(let message):
            return message.messageType
        case .restartRequiredMessage(let message):
            return message.messageType
        case .scheduledTaskEndedMessage(let message):
            return message.messageType
        case .scheduledTasksInfoMessage(let message):
            return message.messageType
        case .seriesTimerCancelledMessage(let message):
            return message.messageType
        case .seriesTimerCreatedMessage(let message):
            return message.messageType
        case .serverRestartingMessage(let message):
            return message.messageType
        case .serverShuttingDownMessage(let message):
            return message.messageType
        case .sessionsMessage(let message):
            return message.messageType
        case .syncPlayCommandMessage(let message):
            return message.messageType
        case .syncPlayGroupUpdateCommandMessage(let message):
            return message.messageType
        case .timerCancelledMessage(let message):
            return message.messageType
        case .timerCreatedMessage(let message):
            return message.messageType
        case .userDataChangedMessage(let message):
            return message.messageType
        case .userDeletedMessage(let message):
            return message.messageType
        case .userUpdatedMessage(let message):
            return message.messageType
        }
    }
}
