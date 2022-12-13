//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct MediaPathInfo: Codable, Hashable {
    public var networkPath: String?
    public var path: String?

    public init(networkPath: String? = nil, path: String? = nil) {
        self.networkPath = networkPath
        self.path = path
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.networkPath = try values.decodeIfPresent(String.self, forKey: "NetworkPath")
        self.path = try values.decodeIfPresent(String.self, forKey: "Path")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(networkPath, forKey: "NetworkPath")
        try values.encodeIfPresent(path, forKey: "Path")
    }
}
