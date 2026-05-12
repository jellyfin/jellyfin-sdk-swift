//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import ArgumentParser
import JellyfinAPI

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
        let client = try JellyfinClient(server: server)

        let result = try await client.signIn(
            username: username,
            password: password
        )

        guard let accessToken = result.accessToken else {
            throw ValidationError("No access token returned")
        }

        print("Signed in with access token: \(accessToken)")
    }
}
