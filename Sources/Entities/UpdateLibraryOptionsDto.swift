//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Update library options dto.
public struct UpdateLibraryOptionsDto: Codable, Hashable, Identifiable {
    /// Gets or sets the library item id.
    public var id: String?
    /// Gets or sets library options.
    public var libraryOptions: LibraryOptions?

    public init(id: String? = nil, libraryOptions: LibraryOptions? = nil) {
        self.id = id
        self.libraryOptions = libraryOptions
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.id = try values.decodeIfPresent(String.self, forKey: "Id")
        self.libraryOptions = try values.decodeIfPresent(LibraryOptions.self, forKey: "LibraryOptions")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(id, forKey: "Id")
        try values.encodeIfPresent(libraryOptions, forKey: "LibraryOptions")
    }
}
