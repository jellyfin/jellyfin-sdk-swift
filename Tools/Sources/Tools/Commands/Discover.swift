//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import ArgumentParser
import JellyfinAPI

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

        try await Task.sleep(for: .seconds(duration))
    }
}
