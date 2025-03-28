//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// The quick connect request body.
public struct QuickConnectDto: Codable, Hashable {
    /// Gets or sets the quick connect secret.
    public var secret: String

    public init(secret: String) {
        self.secret = secret
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.secret = try values.decode(String.self, forKey: "Secret")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(secret, forKey: "Secret")
    }
}
