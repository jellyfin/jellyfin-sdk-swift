//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import ArgumentParser
import JellyfinAPI

struct Message: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "message",
        abstract: "Display a message on a client session"
    )

    @OptionGroup
    var target: SessionTargetOptions

    @Option(help: "Message header")
    var header: String?

    @Option(help: "Display timeout in milliseconds")
    var timeout: Int?

    @Argument(help: "Message text")
    var text: String

    func run() async throws {
        let client = try JellyfinClient(
            server: target.auth.server,
            token: target.auth.token
        )

        try await client.send(Paths.sendMessageCommand(
            sessionID: target.sessionID,
            .init(header: header, text: text, timeoutMs: timeout)
        ))

        print("Sent message to \(target.sessionID)")
    }
}
