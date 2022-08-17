//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation
import PackagePlugin

@main
struct Plugin: CommandPlugin {
    func performCommand(context: PluginContext, arguments: [String]) async throws {
        let createAPICommand = try context.tool(named: "create-api")
        let workingDirectory = context.package.directory.appending("Sources")

        let process = Process()
        process.currentDirectoryURL = URL(fileURLWithPath: workingDirectory.string)
        process.executableURL = URL(fileURLWithPath: createAPICommand.path.string)
        process.arguments = [
            "generate",
            "jellyfin-openapi-stable.json",
            "--config", "create-api-config.yaml",
            "--output", ".",
        ]

        try process.run()
        process.waitUntilExit()
    }
}
