//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Media Path dto.
public struct MediaPathDto: Codable {
    /// Gets or sets the name of the library.
    public var name: String
    /// Gets or sets the path to add.
    public var path: String?
    /// Gets or sets the path info.
    public var pathInfo: MediaPathInfo?

    public init(name: String, path: String? = nil, pathInfo: MediaPathInfo? = nil) {
        self.name = name
        self.path = path
        self.pathInfo = pathInfo
    }
}
