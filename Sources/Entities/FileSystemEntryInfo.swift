//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class FileSystemEntryInfo.
public struct FileSystemEntryInfo: Codable {
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
}
