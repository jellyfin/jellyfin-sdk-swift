//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import ArgumentParser
import JellyfinAPI

struct Sessions: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "sessions",
        abstract: "List active sessions on the server"
    )

    @OptionGroup
    var options: SocketOptions

    func run() async throws {
        let client = try JellyfinClient(
            server: options.server,
            token: options.token
        )

        let sessions = try await client.send(Paths.getSessions()).value

        for session in sessions {
            let id = session.id ?? "-"
            let device = session.deviceName ?? "—"
            let user = session.userName ?? "—"
            let nowPlaying = session.nowPlayingItem?.name ?? "—"

            print("""
            \(device) - \(user)
                ID:                    \(id)
                Now Playing:            \(nowPlaying)
                SupportsMediaControl:  \(session.isSupportsMediaControl ?? false)
                SupportsRemoteControl: \(session.isSupportsRemoteControl ?? false)
                PlayableMediaTypes:    \(session.playableMediaTypes?.map(\.rawValue).joined(separator: ", ") ?? "—")
                SupportedCommands:     \(session.supportedCommands?.map(\.rawValue).joined(separator: ", ") ?? "—")

            """)
        }
    }
}
