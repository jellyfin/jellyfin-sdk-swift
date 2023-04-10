//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation
import PackagePlugin

@main
struct Plugin: CommandPlugin {

    private func runProcess(_ commandLine: String, context: PluginContext, workingDirectory: String? = nil) throws {

        var arguments = commandLine.split(separator: " ").map { String($0) }
        let commandName = arguments.removeFirst()

        let command = try context.tool(named: commandName)

        let actualWorkingDirectory: Path

        if let workingDirectory {
            actualWorkingDirectory = context.package.directory.appending(workingDirectory)
        } else {
            actualWorkingDirectory = context.package.directory
        }

        let process = Process()
        process.currentDirectoryURL = URL(fileURLWithPath: actualWorkingDirectory.string)
        process.executableURL = URL(fileURLWithPath: command.path.string)
        process.arguments = arguments

        try process.run()
        process.waitUntilExit()
    }

    func performCommand(context: PluginContext, arguments: [String]) async throws {

        try await generate(context: context)

        // Apply patches
        try await patchRemoteSearchResult(context: context)
        try await patchAnyJSON(context: context)

        try await lint(context: context)
    }

    private func generate(context: PluginContext) async throws {
        try runProcess(
            "create-api generate jellyfin-openapi-stable.json --config create-api-config.yaml --output .",
            context: context,
            workingDirectory: "Sources"
        )
    }

    private func lint(context: PluginContext) async throws {
        try runProcess(
            "swiftformat .",
            context: context
        )
    }

    // Entities/RemoteSearchResult.swift: remove `Hashable`
    private func patchRemoteSearchResult(context: PluginContext) async throws {
        let filePath = context
            .package
            .directory
            .appending(["Sources", "Entities", "RemoteSearchResult.swift"])

        let contents = try String(contentsOfFile: filePath.string)
        var lines = contents
            .split(separator: "\n")
            .map { String($0) }

        lines[8] = "\npublic final class RemoteSearchResult: Codable {"

        try lines
            .joined(separator: "\n")
            .data(using: .utf8)?
            .write(to: URL(fileURLWithPath: filePath.string))
    }

    // Extensions/AnyJSON.swift: replace `Equatable` with `Hashable`
    private func patchAnyJSON(context: PluginContext) async throws {
        let filePath = context
            .package
            .directory
            .appending(["Sources", "Extensions", "AnyJSON.swift"])

        let contents = try String(contentsOfFile: filePath.string)
        var lines = contents
            .split(separator: "\n")
            .map { String($0) }

        lines[8] = "\npublic enum AnyJSON: Hashable, Codable {"

        try lines
            .joined(separator: "\n")
            .data(using: .utf8)?
            .write(to: URL(fileURLWithPath: filePath.string))
    }
}
