//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Defines properties used to start a restore process.
public struct BackupRestoreRequestDto: Codable, Hashable {
    /// Gets or Sets the name of the backup archive to restore from. Must be present in
    /// MediaBrowser.Common.Configuration.IApplicationPaths.BackupPath.
    public var archiveFileName: String?

    public init(archiveFileName: String? = nil) {
        self.archiveFileName = archiveFileName
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.archiveFileName = try values.decodeIfPresent(String.self, forKey: "ArchiveFileName")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(archiveFileName, forKey: "ArchiveFileName")
    }
}
