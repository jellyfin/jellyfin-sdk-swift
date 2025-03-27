//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class RepositoryInfo.
public struct RepositoryInfo: Codable, Hashable {
    /// Gets or sets a value indicating whether the repository is enabled.
    public var isEnabled: Bool?
    /// Gets or sets the name.
    public var name: String?
    /// Gets or sets the URL.
    public var url: String?

    public init(isEnabled: Bool? = nil, name: String? = nil, url: String? = nil) {
        self.isEnabled = isEnabled
        self.name = name
        self.url = url
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.isEnabled = try values.decodeIfPresent(Bool.self, forKey: "Enabled")
        self.name = try values.decodeIfPresent(String.self, forKey: "Name")
        self.url = try values.decodeIfPresent(String.self, forKey: "Url")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(isEnabled, forKey: "Enabled")
        try values.encodeIfPresent(name, forKey: "Name")
        try values.encodeIfPresent(url, forKey: "Url")
    }
}
