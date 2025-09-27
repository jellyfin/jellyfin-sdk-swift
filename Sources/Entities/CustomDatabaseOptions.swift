//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Defines the options for a custom database connector.
public struct CustomDatabaseOptions: Codable, Hashable {
    /// Gets or sets the connection string for the custom database provider.
    public var connectionString: String?
    /// Gets or sets the list of extra options for the custom provider.
    public var options: [CustomDatabaseOption]?
    /// Gets or sets the plugin assembly to search for providers.
    public var pluginAssembly: String?
    /// Gets or sets the Plugin name to search for database providers.
    public var pluginName: String?

    public init(
        connectionString: String? = nil,
        options: [CustomDatabaseOption]? = nil,
        pluginAssembly: String? = nil,
        pluginName: String? = nil
    ) {
        self.connectionString = connectionString
        self.options = options
        self.pluginAssembly = pluginAssembly
        self.pluginName = pluginName
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.connectionString = try values.decodeIfPresent(String.self, forKey: "ConnectionString")
        self.options = try values.decodeIfPresent([CustomDatabaseOption].self, forKey: "Options")
        self.pluginAssembly = try values.decodeIfPresent(String.self, forKey: "PluginAssembly")
        self.pluginName = try values.decodeIfPresent(String.self, forKey: "PluginName")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(connectionString, forKey: "ConnectionString")
        try values.encodeIfPresent(options, forKey: "Options")
        try values.encodeIfPresent(pluginAssembly, forKey: "PluginAssembly")
        try values.encodeIfPresent(pluginName, forKey: "PluginName")
    }
}
