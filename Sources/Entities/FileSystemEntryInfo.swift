//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class FileSystemEntryInfo.
public struct FileSystemEntryInfo: Codable, Hashable {
    /// Gets the name.
    public var name: String?
    /// Gets the path.
    public var path: String?
    /// Gets the type.
    public var type: FileSystemEntryType?

    public init(name: String? = nil, path: String? = nil, type: FileSystemEntryType? = nil) {
        self.name = name
        self.path = path
        self.type = type
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.name = try values.decodeIfPresent(String.self, forKey: "Name")
        self.path = try values.decodeIfPresent(String.self, forKey: "Path")
        self.type = try values.decodeIfPresent(FileSystemEntryType.self, forKey: "Type")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(name, forKey: "Name")
        try values.encodeIfPresent(path, forKey: "Path")
        try values.encodeIfPresent(type, forKey: "Type")
    }
}
