//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Add virtual folder dto.
public struct AddVirtualFolderDto: Codable, Hashable {
    /// Gets or sets library options.
    public var libraryOptions: LibraryOptions?

    public init(libraryOptions: LibraryOptions? = nil) {
        self.libraryOptions = libraryOptions
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.libraryOptions = try values.decodeIfPresent(LibraryOptions.self, forKey: "LibraryOptions")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(libraryOptions, forKey: "LibraryOptions")
    }
}
