//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import ArgumentParser
import JellyfinAPI

struct Playstate: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "playstate",
        abstract: "Issue a playstate command (pause, unpause, stop, …) to a session"
    )

    @OptionGroup
    var target: SessionTargetOptions

    @Argument(help: "Playstate command (\(PlaystateCommand.allCases.map(\.rawValue).joined(separator: ", ")))")
    var command: PlaystateCommand

    @Option(help: "Seek position in ticks (Seek command only)")
    var seekPositionTicks: Int?

    func run() async throws {
        let client = try JellyfinClient(
            server: target.auth.server,
            token: target.auth.token
        )

        try await client.send(Paths.sendPlaystateCommand(
            sessionID: target.sessionID,
            command: command.rawValue,
            seekPositionTicks: seekPositionTicks
        ))
        print("Sent \(command.rawValue) to \(target.sessionID)")
    }
}
