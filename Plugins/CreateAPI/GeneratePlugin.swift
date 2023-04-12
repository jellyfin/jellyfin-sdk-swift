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

    func performCommand(context: PluginContext, arguments: [String]) async throws {

        // Apply schema pre patches
        try await patchBaseItemDtoSchema(context: context)

        try await generate(context: context)

        // Apply post patches
        try await patchRemoteSearchResult(context: context)
        try await patchAnyJSON(context: context)

        // Move patch files
        try await addSpecialFeatureType(context: context)

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
        let data = Data(referencing: try NSData(contentsOfFile: filePath.string))
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

        try FileManager.default.removeItem(atPath: filePath.string)
    }

    // BaseItemDto: add SpecialFeatureType string format and CollectionTypeOptions
    //              object reference to properties prior to generation
    private func patchBaseItemDtoSchema(context: PluginContext) async throws {
        let contents = try await parseOriginalSchema(context: context)

        guard case var .object(file) = contents else { return }
        guard case var .object(components) = file["components"] else { return }
        guard case var .object(schemas) = components["schemas"] else { return }
        guard case var .object(baseItemDto) = schemas["BaseItemDto"] else { return }
        guard case var .object(properties) = baseItemDto["properties"] else { return }

        properties["ExtraType"] = AnyJSON.object(
            [
                "type": .string("string"),
                "format": .string("SpecialFeatureType"),
                "nullable": .bool(true),
            ]
        )

        // TODO: Uncomment once Swiftfin has refactored how it uses the existing CollectionType
        //       property for library management
//        properties["CollectionType"] = AnyJSON.object(
//            [
//                "allOf": .array([.object(["$ref": .string("#/components/schemas/CollectionTypeOptions")])]),
//                "nullable": .bool(true),
//                "description": .string("Gets or sets the type of the collection."),
//            ]
//        )

        baseItemDto["properties"] = .object(properties)
        schemas["BaseItemDto"] = .object(baseItemDto)
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

    private func addSpecialFeatureType(context: PluginContext) async throws {
        let sourceFilePath = context
            .package
            .directory
            .appending(["Plugins", "CreateAPI", "PatchFiles", "SpecialFeatureType.swift"])

        let sourceData = Data(referencing: try NSData(contentsOfFile: sourceFilePath.string))

        let finalFilePath = context
            .package
            .directory
            .appending(["Sources", "Entities", "SpecialFeatureType.swift"])

        try sourceData.write(to: URL(fileURLWithPath: finalFilePath.string))
    }
}
