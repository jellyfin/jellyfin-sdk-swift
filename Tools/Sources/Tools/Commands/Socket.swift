//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import ArgumentParser
import Foundation
import JellyfinAPI

struct Socket: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "socket",
        abstract: """
        Open a WebSocket session.

        With no flags, prints only connection + keep-alive activity (proof the socket is alive).
        Add feed flags (--sessions, --scheduled-tasks, --activity-log) to subscribe and surface those messages.
        Use --listen to receive remote-control commands targeted at this device (suppresses keep-alive noise).
        """
    )

    @OptionGroup
    var options: SocketOptions

    @Flag(help: "Subscribe to session updates")
    var sessions = false

    @Flag(help: "Subscribe to scheduled tasks")
    var scheduledTasks = false

    @Flag(help: "Subscribe to activity log entries")
    var activityLog = false

    @Flag(
        help: "Listen for commands (Play, Playstate, GeneralCommand, SyncPlay) send to this device. Suppresses keep-alive output."
    )
    var listen = false

    @Option(help: "Delay in seconds for subscriptions")
    var delay: Int?

    @Option(help: "Update interval in seconds for subscriptions")
    var interval: Int?

    func run() async throws {
        let client = try JellyfinClient(
            server: options.server,
            token: options.token
        )

        let session = client.socket(supportsMediaControl: true).connect()

        let delay = delay.map { Duration.seconds($0) } ?? .seconds(5)
        let interval = interval.map { Duration.seconds($0) } ?? .seconds(5)

        if sessions {
            session.subscribe(
                .sessions,
                delay: delay,
                interval: interval
            )
        }

        if scheduledTasks {
            session.subscribe(
                .scheduledTasks,
                delay: delay,
                interval: interval
            )
        }

        if activityLog {
            session.subscribe(
                .activityLog,
                delay: delay,
                interval: interval
            )
        }

        try await printEvents(from: session, filter: filter)
    }

    private func filter(message: OutboundWebSocketMessage) -> Bool {
        // --listen mode: only remote-control messages, no keep-alive
        if listen {
            switch message {
            case .generalCommandMessage,
                 .playMessage,
                 .playstateMessage,
                 .syncPlayCommandMessage,
                 .syncPlayGroupUpdateMessage:
                return true
            default:
                return false
            }
        }

        // Otherwise: keep-alive is always shown. Plus any subscribed feeds.
        switch message {
        case .forceKeepAliveMessage, .outboundKeepAliveMessage:
            return true
        case .sessionsMessage:
            return sessions
        case .scheduledTasksInfoMessage, .scheduledTaskEndedMessage:
            return scheduledTasks
        case .activityLogEntryMessage:
            return activityLog
        default:
            return false
        }
    }
}

private func printEvents(
    from session: JellyfinSocket.Session,
    filter: ((OutboundWebSocketMessage) -> Bool)? = nil
) async throws {
    let encoder = JSONEncoder()
    encoder.outputFormatting = [.prettyPrinted, .sortedKeys]

    for try await event in session.events {
        switch event {
        case .connecting:
            print("Connecting...")
        case let .connected(url):
            print("Connected: \(url)")
        case let .message(message):
            guard filter?(message) ?? true else { continue }

            if let data = try? encoder.encode(message), let json = String(data: data, encoding: .utf8) {
                print(json)
            } else {
                print(message)
            }
        }
    }
}
