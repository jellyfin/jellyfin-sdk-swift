//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Manifest type for backups internal structure.
public struct BackupManifestDto: Codable, Hashable, Sendable {
    /// Gets or sets the backup engine version this backup was created with.
    public var backupEngineVersion: String
    /// Gets or sets the date this backup was created with.
    public var dateCreated: Date
    /// Gets or sets the contents of the backup archive.
    public var options: BackupOptionsDto
    /// Gets or sets the path to the backup on the system.
    public var path: String
    /// Gets or sets the jellyfin version this backup was created with.
    public var serverVersion: String

    public init(backupEngineVersion: String, dateCreated: Date, options: BackupOptionsDto, path: String, serverVersion: String) {
        self.backupEngineVersion = backupEngineVersion
        self.dateCreated = dateCreated
        self.options = options
        self.path = path
        self.serverVersion = serverVersion
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.backupEngineVersion = try values.decode(String.self, forKey: "BackupEngineVersion")
        self.dateCreated = try values.decode(Date.self, forKey: "DateCreated")
        self.options = try values.decode(BackupOptionsDto.self, forKey: "Options")
        self.path = try values.decode(String.self, forKey: "Path")
        self.serverVersion = try values.decode(String.self, forKey: "ServerVersion")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(backupEngineVersion, forKey: "BackupEngineVersion")
        try values.encode(dateCreated, forKey: "DateCreated")
        try values.encode(options, forKey: "Options")
        try values.encode(path, forKey: "Path")
        try values.encode(serverVersion, forKey: "ServerVersion")
    }
}
