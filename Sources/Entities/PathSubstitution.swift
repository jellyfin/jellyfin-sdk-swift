//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Defines the MediaBrowser.Model.Configuration.PathSubstitution.
public struct PathSubstitution: Codable, Hashable {
    /// Gets or sets the value to substitute.
    public var from: String?
    /// Gets or sets the value to substitution with.
    public var to: String?

    public init(from: String? = nil, to: String? = nil) {
        self.from = from
        self.to = to
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.from = try values.decodeIfPresent(String.self, forKey: "From")
        self.to = try values.decodeIfPresent(String.self, forKey: "To")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(from, forKey: "From")
        try values.encodeIfPresent(to, forKey: "To")
    }
}
