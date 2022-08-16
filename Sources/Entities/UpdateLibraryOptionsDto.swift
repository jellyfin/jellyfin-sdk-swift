//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Update library options dto.
public struct UpdateLibraryOptionsDto: Codable, Identifiable {
    /// Gets or sets the library item id.
    public var id: UUID?
    /// Gets or sets library options.
    public var libraryOptions: LibraryOptions?

    public init(id: UUID? = nil, libraryOptions: LibraryOptions? = nil) {
        self.id = id
        self.libraryOptions = libraryOptions
    }
}
