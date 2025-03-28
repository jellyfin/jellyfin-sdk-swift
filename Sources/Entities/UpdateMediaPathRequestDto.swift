//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Update library options dto.
public struct UpdateMediaPathRequestDto: Codable, Hashable {
    /// Gets or sets the library name.
    public var name: String
    /// Gets or sets library folder path information.
    public var pathInfo: MediaPathInfo

    public init(name: String, pathInfo: MediaPathInfo) {
        self.name = name
        self.pathInfo = pathInfo
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.name = try values.decode(String.self, forKey: "Name")
        self.pathInfo = try values.decode(MediaPathInfo.self, forKey: "PathInfo")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(name, forKey: "Name")
        try values.encode(pathInfo, forKey: "PathInfo")
    }
}
