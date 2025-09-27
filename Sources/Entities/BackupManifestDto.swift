//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Manifest type for backups internal structure.
public struct BackupManifestDto: Codable, Hashable {
    /// Gets or sets the backup engine version this backup was created with.
    public var backupEngineVersion: String?
    /// Gets or sets the date this backup was created with.
    public var dateCreated: Date?
    /// Gets or sets the contents of the backup archive.
    public var options: BackupOptionsDto?
    /// Gets or sets the path to the backup on the system.
    public var path: String?
    /// Gets or sets the jellyfin version this backup was created with.
    public var serverVersion: String?

    public init(
        backupEngineVersion: String? = nil,
        dateCreated: Date? = nil,
        options: BackupOptionsDto? = nil,
        path: String? = nil,
        serverVersion: String? = nil
    ) {
        self.backupEngineVersion = backupEngineVersion
        self.dateCreated = dateCreated
        self.options = options
        self.path = path
        self.serverVersion = serverVersion
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.backupEngineVersion = try values.decodeIfPresent(String.self, forKey: "BackupEngineVersion")
        self.dateCreated = try values.decodeIfPresent(Date.self, forKey: "DateCreated")
        self.options = try values.decodeIfPresent(BackupOptionsDto.self, forKey: "Options")
        self.path = try values.decodeIfPresent(String.self, forKey: "Path")
        self.serverVersion = try values.decodeIfPresent(String.self, forKey: "ServerVersion")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(backupEngineVersion, forKey: "BackupEngineVersion")
        try values.encodeIfPresent(dateCreated, forKey: "DateCreated")
        try values.encodeIfPresent(options, forKey: "Options")
        try values.encodeIfPresent(path, forKey: "Path")
        try values.encodeIfPresent(serverVersion, forKey: "ServerVersion")
    }
}
