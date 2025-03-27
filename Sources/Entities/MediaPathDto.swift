//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Media Path dto.
public struct MediaPathDto: Codable, Hashable {
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

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.name = try values.decode(String.self, forKey: "Name")
        self.path = try values.decodeIfPresent(String.self, forKey: "Path")
        self.pathInfo = try values.decodeIfPresent(MediaPathInfo.self, forKey: "PathInfo")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(name, forKey: "Name")
        try values.encodeIfPresent(path, forKey: "Path")
        try values.encodeIfPresent(pathInfo, forKey: "PathInfo")
    }
}
