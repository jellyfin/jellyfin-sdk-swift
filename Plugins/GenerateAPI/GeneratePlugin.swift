//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import Foundation
import PackagePlugin

@main
struct GenerateAPIPlugin: CommandPlugin {
    func performCommand(context: PluginContext, arguments: [String]) async throws {
        let tool = try context.tool(named: "openapi-generator")
        let process = Process()
        process.currentDirectoryURL = context.package.directoryURL
        process.executableURL = tool.url
        process.arguments = arguments.isEmpty ? [
            "Sources/jellyfin-openapi-stable.json",
            "--config",
            "Sources/openapi-generator.yaml",
        ] : arguments
        process.standardOutput = FileHandle.standardOutput
        process.standardError = FileHandle.standardError

        try process.run()
        process.waitUntilExit()

        if process.terminationReason != .exit || process.terminationStatus != 0 {
            Diagnostics.error("OpenAPI generation failed with exit code \(process.terminationStatus).")
        }
    }
}
