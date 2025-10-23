//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation
import PackagePlugin

// Declared to build
public struct JellyfinClient {}

@main
struct Plugin: CommandPlugin {

    func performCommand(context: PluginContext, arguments: [String]) async throws {

        // Apply schema pre patches
        try await patchTaskTriggerInfoSchema(context: context)

        try await generate(context: context)

        // Apply post patches
        try await patchRemoteSearchResult(context: context)
        try await patchAnyJSON(context: context)
        try await patchGroupUpdateDiscriminator(context: context)

        // Create the version SDK
        try await generateVersionFile(context: context)

        try await lint(context: context)

        try await deletePatchedSchema(context: context)
    }

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

    private func generate(context: PluginContext) async throws {
        try runProcess(
            "create-api generate jellyfin-openapi-stable-patched.json --config create-api-config.yaml --output .",
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

    private func parseOriginalSchema(context: PluginContext) async throws -> AnyJSON {
        let filePath = context
            .package
            .directory
            .appending(["Sources", "jellyfin-openapi-stable.json"])

        let decoder = JSONDecoder()
        let data = try Data(referencing: NSData(contentsOfFile: filePath.string))
        return try decoder.decode(AnyJSON.self, from: data)
    }

    private func savePatchedSchema(context: PluginContext, json: AnyJSON) async throws {
        let filePath = context
            .package
            .directory
            .appending(["Sources", "jellyfin-openapi-stable-patched.json"])

        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .withoutEscapingSlashes]
        let data = try encoder.encode(json)

        try data.write(to: URL(fileURLWithPath: filePath.string))
    }

    private func deletePatchedSchema(context: PluginContext) async throws {
        let filePath = context
            .package
            .directory
            .appending(["Sources", "jellyfin-openapi-stable-patched.json"])

        if FileManager.default.fileExists(atPath: filePath.string) {
            try FileManager.default.removeItem(atPath: filePath.string)
        }
    }

    private func patchTaskTriggerInfoSchema(context: PluginContext) async throws {
        let contents = try await parseOriginalSchema(context: context)

        guard case var .object(file) = contents else { return }

        guard case var .object(components) = file["components"] else { return }
        guard case var .object(schemas) = components["schemas"] else { return }

        /// Leaving this in place as an example to use if anything needs to be patched in the future.
        /// - This was used to replace TaskTriggerType Strings with a custom type in a Patch File

        //     guard case var .object(taskTriggerInfo) = schemas["TaskTriggerInfo"] else { return }
        //     guard case var .object(properties) = taskTriggerInfo["properties"] else { return }

        //     properties["Type"] = AnyJSON.object([
        //         "type": .string("string"),
        //         "format": .string("TaskTriggerType"),
        //         "nullable": .bool(true),
        //     ])

        //     taskTriggerInfo["properties"] = .object(properties)
        //     schemas["TaskTriggerInfo"] = .object(taskTriggerInfo)

        components["schemas"] = .object(schemas)
        file["components"] = .object(components)

        try await savePatchedSchema(context: context, json: .object(file))
    }

    // Entities/RemoteSearchResult.swift: remove `Hashable`
    private func patchRemoteSearchResult(context: PluginContext) async throws {
        let filePath = context
            .package
            .directory
            .appending(["Sources", "Entities", "RemoteSearchResult.swift"])

        let contents = try String(contentsOfFile: filePath.string, encoding: .utf8)
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

        let contents = try String(contentsOfFile: filePath.string, encoding: .utf8)
        var lines = contents
            .split(separator: "\n")
            .map { String($0) }

        lines[8] = "\npublic enum AnyJSON: Hashable, Codable {"

        try lines
            .joined(separator: "\n")
            .data(using: .utf8)?
            .write(to: URL(fileURLWithPath: filePath.string))
    }

    // TODO: Remove if/when fixed within CreateAPI
    // Entities/GroupUpdate.swift: change generated `Type` name to `_Type`
    private func patchGroupUpdateDiscriminator(context: PluginContext) async throws {
        let filePath = context
            .package
            .directory
            .appending(["Sources", "Entities", "GroupUpdate.swift"])

        let contents = try String(contentsOfFile: filePath.string, encoding: .utf8)
            .replacingOccurrences(of: "Type", with: "_Type")

        try contents
            .data(using: .utf8)?
            .write(to: URL(fileURLWithPath: filePath.string))
    }

    // TODO: Remove if/when fixed within CreateAPI
    // Adds JellyfinClient.sdkVersion
    private func generateVersionFile(context: PluginContext) async throws {
        let schema = try await parseOriginalSchema(context: context)

        guard case let .object(file) = schema else { return }
        guard case let .object(info) = file["info"] else { return }
        guard let version = info["version"]?.value as? String else { return }

        let sourceFilePath = context
            .package
            .directory
            .appending(["Plugins", "CreateAPI", "PatchFiles", "JellyfinClient+Version.swift"])

        var contents = try String(contentsOfFile: sourceFilePath.string, encoding: .utf8)

        contents.replace(#/<SDK_VERSION>/#, with: version)

        let destinationFilePath = context
            .package
            .directory
            .appending(["Sources", "Extensions", "JellyfinClient+Version.swift"])

        try contents
            .data(using: .utf8)?
            .write(to: URL(fileURLWithPath: destinationFilePath.string))
    }
}
