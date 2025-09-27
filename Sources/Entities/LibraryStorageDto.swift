//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Contains informations about a libraries storage informations.
public struct LibraryStorageDto: Codable, Hashable, Identifiable {
    /// Gets or sets the storage informations about the folders used in a library.
    public var folders: [FolderStorageDto]?
    /// Gets or sets the Library Id.
    public var id: String?
    /// Gets or sets the name of the library.
    public var name: String?

    public init(folders: [FolderStorageDto]? = nil, id: String? = nil, name: String? = nil) {
        self.folders = folders
        self.id = id
        self.name = name
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.folders = try values.decodeIfPresent([FolderStorageDto].self, forKey: "Folders")
        self.id = try values.decodeIfPresent(String.self, forKey: "Id")
        self.name = try values.decodeIfPresent(String.self, forKey: "Name")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(folders, forKey: "Folders")
        try values.encodeIfPresent(id, forKey: "Id")
        try values.encodeIfPresent(name, forKey: "Name")
    }
}
