//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import ArgumentParser
import JellyfinAPI

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
        let client = try JellyfinClient(server: server)

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
