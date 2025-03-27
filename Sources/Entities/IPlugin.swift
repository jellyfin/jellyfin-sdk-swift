//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Defines the MediaBrowser.Common.Plugins.IPlugin.
public struct IPlugin: Codable, Hashable, Identifiable {
    /// Gets the path to the assembly file.
    public var assemblyFilePath: String?
    /// Gets a value indicating whether the plugin can be uninstalled.
    public var canUninstall: Bool?
    /// Gets the full path to the data folder, where the plugin can store any miscellaneous files needed.
    public var dataFolderPath: String?
    /// Gets the Description.
    public var description: String?
    /// Gets the unique id.
    public var id: String?
    /// Gets the name of the plugin.
    public var name: String?
    /// Gets the plugin version.
    public var version: String?

    public init(
        assemblyFilePath: String? = nil,
        canUninstall: Bool? = nil,
        dataFolderPath: String? = nil,
        description: String? = nil,
        id: String? = nil,
        name: String? = nil,
        version: String? = nil
    ) {
        self.assemblyFilePath = assemblyFilePath
        self.canUninstall = canUninstall
        self.dataFolderPath = dataFolderPath
        self.description = description
        self.id = id
        self.name = name
        self.version = version
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.assemblyFilePath = try values.decodeIfPresent(String.self, forKey: "AssemblyFilePath")
        self.canUninstall = try values.decodeIfPresent(Bool.self, forKey: "CanUninstall")
        self.dataFolderPath = try values.decodeIfPresent(String.self, forKey: "DataFolderPath")
        self.description = try values.decodeIfPresent(String.self, forKey: "Description")
        self.id = try values.decodeIfPresent(String.self, forKey: "Id")
        self.name = try values.decodeIfPresent(String.self, forKey: "Name")
        self.version = try values.decodeIfPresent(String.self, forKey: "Version")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(assemblyFilePath, forKey: "AssemblyFilePath")
        try values.encodeIfPresent(canUninstall, forKey: "CanUninstall")
        try values.encodeIfPresent(dataFolderPath, forKey: "DataFolderPath")
        try values.encodeIfPresent(description, forKey: "Description")
        try values.encodeIfPresent(id, forKey: "Id")
        try values.encodeIfPresent(name, forKey: "Name")
        try values.encodeIfPresent(version, forKey: "Version")
    }
}
