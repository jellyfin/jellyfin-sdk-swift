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

extension JellyfinClient {

    static func make(server: String) throws -> JellyfinClient {
        guard let url = URL(string: server), url.scheme != nil else {
            throw ValidationError("Invalid server URL: \(server)")
        }

        return JellyfinClient(
            configuration: .init(
                url: url,
                client: "JellyfinAPI Tools",
                deviceName: Host.current().localizedName ?? "Jellyfin Tools",
                deviceID: "jellyfin-sdk-swift-tools",
                version: "1"
            )
        )
    }
}
