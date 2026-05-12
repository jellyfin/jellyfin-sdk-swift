//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import ArgumentParser
import JellyfinAPI

struct Command: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "command",
        abstract: "Issue a general command (e.g. ToggleMute, DisplayContent) to a session"
    )

    @OptionGroup
    var target: SessionTargetOptions

    @Argument(help: "General command name")
    var command: GeneralCommandType

    func run() async throws {
        let client = try JellyfinClient(
            server: target.auth.server,
            token: target.auth.token
        )

        try await client.send(Paths.sendGeneralCommand(
            sessionID: target.sessionID,
            command: command.rawValue
        ))

        print("Sent \(command.rawValue) to \(target.sessionID)")
    }
}
