//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Defines the optional contents of the backup archive.
public struct BackupOptionsDto: Codable, Hashable {
    /// Gets or sets a value indicating whether the archive contains the Database contents.
    public var isDatabase: Bool?
    /// Gets or sets a value indicating whether the archive contains the Metadata contents.
    public var isMetadata: Bool?
    /// Gets or sets a value indicating whether the archive contains the Subtitle contents.
    public var isSubtitles: Bool?
    /// Gets or sets a value indicating whether the archive contains the Trickplay contents.
    public var isTrickplay: Bool?

    public init(isDatabase: Bool? = nil, isMetadata: Bool? = nil, isSubtitles: Bool? = nil, isTrickplay: Bool? = nil) {
        self.isDatabase = isDatabase
        self.isMetadata = isMetadata
        self.isSubtitles = isSubtitles
        self.isTrickplay = isTrickplay
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.isDatabase = try values.decodeIfPresent(Bool.self, forKey: "Database")
        self.isMetadata = try values.decodeIfPresent(Bool.self, forKey: "Metadata")
        self.isSubtitles = try values.decodeIfPresent(Bool.self, forKey: "Subtitles")
        self.isTrickplay = try values.decodeIfPresent(Bool.self, forKey: "Trickplay")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(isDatabase, forKey: "Database")
        try values.encodeIfPresent(isMetadata, forKey: "Metadata")
        try values.encodeIfPresent(isSubtitles, forKey: "Subtitles")
        try values.encodeIfPresent(isTrickplay, forKey: "Trickplay")
    }
}
