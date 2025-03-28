//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// The create user by name request body.
public struct CreateUserByName: Codable, Hashable {
    /// Gets or sets the username.
    public var name: String
    /// Gets or sets the password.
    public var password: String?

    public init(name: String, password: String? = nil) {
        self.name = name
        self.password = password
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.name = try values.decode(String.self, forKey: "Name")
        self.password = try values.decodeIfPresent(String.self, forKey: "Password")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(name, forKey: "Name")
        try values.encodeIfPresent(password, forKey: "Password")
    }
}
