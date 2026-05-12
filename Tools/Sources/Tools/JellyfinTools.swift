//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import ArgumentParser

@main
struct JellyfinTools: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "tools",
        abstract: "Tools for testing JellyfinAPI features",
        subcommands: [
            Command.self,
            Discover.self,
            Message.self,
            Playstate.self,
            PostCapabilities.self,
            QuickConnect.self,
            Sessions.self,
            SignIn.self,
            Socket.self,
        ]
    )
}
