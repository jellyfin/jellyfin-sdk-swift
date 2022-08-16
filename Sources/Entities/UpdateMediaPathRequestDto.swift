//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Update library options dto.
public struct UpdateMediaPathRequestDto: Codable {
    /// Gets or sets the library name.
    public var name: String
    /// Gets or sets library folder path information.
    public var pathInfo: MediaPathInfo

    public init(name: String, pathInfo: MediaPathInfo) {
        self.name = name
        self.pathInfo = pathInfo
    }
}
