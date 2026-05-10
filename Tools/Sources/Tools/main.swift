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

@main
struct JellyfinTools: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "tools",
        abstract: "Tools for testing JellyfinAPI features",
        subcommands: [
            Discover.self,
            QuickConnect.self,
            SignIn.self,
            Socket.self,
            Sessions.self,
            Playstate.self,
            Message.self,
            Command.self,
            PostCapabilities.self,
        ]
    )
}

struct Discover: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "discover",
        abstract: "Discover Jellyfin servers on the local network"
    )

    @Option(help: "Discovery duration in seconds")
    var duration: Double = 5

    func run() async throws {
        guard duration > 0 else {
            throw ValidationError("Duration must be greater than 0")
        }

        for try await response in JellyfinClient.discover(duration: .seconds(duration)) {
            print("\(response.name) - \(response.id) - \(response.url.absoluteString)")
        }
    }
}

struct QuickConnect: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "quickconnect",
        abstract: "Perform a Quick Connect authentication request"
    )

    @Option(help: "Jellyfin server URL")
    var server: String

    @Option(help: "Polling interval in seconds")
    var poll = 5

    @Option(help: "Maximum poll count")
    var max = 200

    @Flag(help: "Sign in with the authenticated Quick Connect secret and print the access token")
    var signIn = false

    func run() async throws {
        let client = try JellyfinClient.make(server: server)

        for try await state in client.quickConnect.connect(
            poll: poll,
            max: max
        ) {
            switch state {
            case let .polling(code):
                print("Code: \(code)")
            case let .authenticated(secret):
                print("Authenticated with secret: \(secret)")

                if signIn {
                    try await client.signIn(quickConnectSecret: secret)
                    print("Signed in with token: \(client.accessToken ?? "<missing>")")
                }
            }
        }
    }
}

struct SignIn: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "signin",
        abstract: "Sign in with username and password"
    )

    @Option(help: "Jellyfin server URL")
    var server: String

    @Option(help: "Username")
    var username: String

    @Option(help: "Password")
    var password: String

    func run() async throws {
        let client = try JellyfinClient.make(server: server)
        let result = try await client.signIn(username: username, password: password)

        guard let accessToken = result.accessToken else {
            throw ValidationError("No access token returned")
        }

        print("Signed in with access token: \(accessToken)")
    }
}

// MARK: - Register socket capabilities

struct PostCapabilities: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "post-capabilities",
        abstract: "Manually POST capabilities and print the URL + response status (debug)"
    )
    
    @OptionGroup var options: SocketOptions
    
    @Flag(help: "Use the JSON-body /Sessions/Capabilities/Full endpoint instead of the query-string one")
    var full = false
    
    func run() async throws {
        guard let url = URL(string: options.server) else {
            throw ValidationError("Invalid server URL")
        }
        
        let path = full ? "/Sessions/Capabilities/Full" : "/Sessions/Capabilities"
        var components = URLComponents(url: url.appendingPathComponent(path), resolvingAgainstBaseURL: false)!
        
        let supportedCommands = GeneralCommandType.allCases.map(\.rawValue).joined(separator: ",")
        let playable = "Video,Audio"
        
        if full {
            // JSON body
        } else {
            components.queryItems = [
                URLQueryItem(name: "supportsMediaControl", value: "true"),
                URLQueryItem(name: "supportsPersistentIdentifier", value: "false"),
                URLQueryItem(name: "playableMediaTypes", value: playable),
                URLQueryItem(name: "supportedCommands", value: supportedCommands),
            ]
        }
        
        var request = URLRequest(url: components.url!)
        request.httpMethod = "POST"
        request.addValue(
            "MediaBrowser DeviceId=jellyfin-sdk-swift-tools, Device=JPK-LAPTOP, Client=JellyfinAPI Tools, Version=1, Token=\(options.token)",
            forHTTPHeaderField: "Authorization"
        )
        
        if full {
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            let body: [String: Any] = [
                "SupportsMediaControl": true,
                "SupportsPersistentIdentifier": false,
                "PlayableMediaTypes": ["Video", "Audio"],
                "SupportedCommands": GeneralCommandType.allCases.map(\.rawValue),
            ]
            request.httpBody = try JSONSerialization.data(withJSONObject: body)
        }
        
        print("URL: \(request.url!.absoluteString)")
        print("Method: \(request.httpMethod ?? "?")")
        if let body = request.httpBody, let json = String(data: body, encoding: .utf8) {
            print("Body: \(json)")
        }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        if let http = response as? HTTPURLResponse {
            print("Status: \(http.statusCode)")
        }
        if !data.isEmpty, let body = String(data: data, encoding: .utf8) {
            print("Response: \(body)")
        }
    }
}

// MARK: - Socket

struct SocketOptions: ParsableArguments {

    @Option(help: "Jellyfin server URL")
    var server: String

    @Option(help: "Access token")
    var token: String
}

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

    @OptionGroup var options: SocketOptions

    @Flag(help: "Subscribe to session updates")
    var sessions = false

    @Flag(help: "Subscribe to scheduled tasks")
    var scheduledTasks = false

    @Flag(help: "Subscribe to activity log entries")
    var activityLog = false

    @Flag(help: "Listen for remote-control commands (Play, Playstate, GeneralCommand, SyncPlay) targeted at this device. Suppresses keep-alive output.")
    var listen = false

    @Option(help: "Initial delay in seconds for subscriptions (uses subscription default if omitted)")
    var delay: Int?

    @Option(help: "Update interval in seconds for subscriptions (uses subscription default if omitted)")
    var interval: Int?

    func run() async throws {
        let client = try JellyfinClient.make(server: options.server, token: options.token)
        let session = client.socket(supportsMediaControl: true).connect()

        let initialDelay = delay.map { Duration.seconds($0) }
        let interval = interval.map { Duration.seconds($0) }

        if sessions {
            session.subscribe(.sessions, initialDelay: initialDelay, interval: interval)
        }
        if scheduledTasks {
            session.subscribe(.scheduledTasks, initialDelay: initialDelay, interval: interval)
        }
        if activityLog {
            session.subscribe(.activityLog, initialDelay: initialDelay, interval: interval)
        }

        try await printEvents(from: session, filter: makeFilter())
    }

    private func makeFilter() -> (OutboundWebSocketMessage) -> Bool {
        { message in
            // --listen mode: only remote-control messages, no keep-alive
            if self.listen {
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
                return self.sessions
            case .scheduledTasksInfoMessage, .scheduledTaskEndedMessage:
                return self.scheduledTasks
            case .activityLogEntryMessage:
                return self.activityLog
            default:
                return false
            }
        }
    }
}

private func printEvents(
    from session: JellyfinSocket.Session,
    filter: ((OutboundWebSocketMessage) -> Bool)? = nil
) async throws {
    let encoder = JSONEncoder()
    encoder.outputFormatting = [.prettyPrinted, .sortedKeys]

    print("(Ctrl-C to disconnect)")

    for try await event in session.events {
        switch event {
        case .connecting:
            print("Connecting…")
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

// MARK: - Commands

struct SessionTargetOptions: ParsableArguments {

    @OptionGroup var auth: SocketOptions

    @Option(help: "Target session ID")
    var sessionID: String
}

struct Sessions: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "sessions",
        abstract: "List active sessions on the server"
    )

    @OptionGroup var options: SocketOptions

    @Flag(help: "Verbose: include capabilities and supported commands")
    var verbose = false

    func run() async throws {
        let client = try JellyfinClient.make(server: options.server, token: options.token)
        let sessions = try await client.send(Paths.getSessions()).value

        for session in sessions {
            let id = session.id ?? "<no id>"
            let device = session.deviceName ?? "—"
            let user = session.userName ?? "—"
            let nowPlaying = session.nowPlayingItem?.name ?? "—"
            print("\(id)\t\(device)\t\(user)\t\(nowPlaying)")

            if verbose {
                print("  SupportsMediaControl:  \(session.isSupportsMediaControl ?? false)")
                print("  SupportsRemoteControl: \(session.isSupportsRemoteControl ?? false)")
                print("  PlayableMediaTypes:    \(session.playableMediaTypes?.map(\.rawValue).joined(separator: ", ") ?? "—")")
                print("  SupportedCommands:     \(session.supportedCommands?.map(\.rawValue).joined(separator: ", ") ?? "—")")
                print("")
            }
        }
    }
}

struct Playstate: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "playstate",
        abstract: "Issue a playstate command (pause, unpause, stop, …) to a session"
    )

    @OptionGroup var target: SessionTargetOptions

    @Argument(help: "Playstate command (\(PlaystateCommand.allCases.map(\.rawValue).joined(separator: ", ")))")
    var command: PlaystateCommand

    @Option(help: "Seek position in ticks (Seek command only)")
    var seekPositionTicks: Int?

    func run() async throws {
        let client = try JellyfinClient.make(server: target.auth.server, token: target.auth.token)
        try await client.send(Paths.sendPlaystateCommand(
            sessionID: target.sessionID,
            command: command.rawValue,
            seekPositionTicks: seekPositionTicks
        ))
        print("Sent \(command.rawValue) to \(target.sessionID)")
    }
}

struct Message: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "message",
        abstract: "Display a message on a client session"
    )

    @OptionGroup var target: SessionTargetOptions

    @Option(help: "Message header")
    var header: String?

    @Option(help: "Display timeout in milliseconds")
    var timeoutMs: Int?

    @Argument(help: "Message text")
    var text: String

    func run() async throws {
        let client = try JellyfinClient.make(server: target.auth.server, token: target.auth.token)
        try await client.send(Paths.sendMessageCommand(
            sessionID: target.sessionID,
            .init(header: header, text: text, timeoutMs: timeoutMs)
        ))
        print("Sent message to \(target.sessionID)")
    }
}

struct Command: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "command",
        abstract: "Issue a general command (e.g. ToggleMute, DisplayContent) to a session"
    )

    @OptionGroup var target: SessionTargetOptions

    @Argument(help: "General command name")
    var command: GeneralCommandType

    func run() async throws {
        let client = try JellyfinClient.make(server: target.auth.server, token: target.auth.token)
        try await client.send(Paths.sendGeneralCommand(
            sessionID: target.sessionID,
            command: command.rawValue
        ))
        print("Sent \(command.rawValue) to \(target.sessionID)")
    }
}

extension PlaystateCommand: @retroactive ExpressibleByArgument {}
extension GeneralCommandType: @retroactive ExpressibleByArgument {}

// MARK: - Helpers

extension JellyfinClient {

    static func make(server: String, token: String? = nil, userID: String? = nil) throws -> JellyfinClient {
        guard let url = URL(string: server), url.scheme != nil else {
            throw ValidationError("Invalid server URL: \(server)")
        }

        return JellyfinClient(
            configuration: .init(
                url: url,
                accessToken: token,
                client: "JellyfinAPI Tools",
                deviceName: Host.current().localizedName ?? "Jellyfin Tools",
                deviceID: "jellyfin-sdk-swift-tools",
                version: "1"
            )
        )
    }
}
