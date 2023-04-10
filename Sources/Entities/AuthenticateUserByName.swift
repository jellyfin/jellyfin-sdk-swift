//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation

/// The authenticate user by name request body.
public struct AuthenticateUserByName: Codable, Hashable {
    /// Gets or sets the sha1-hashed password.
    ///
    /// - warning: Deprecated.
    public var password: String?
    /// Gets or sets the plain text password.
    public var pw: String?
    /// Gets or sets the username.
    public var username: String?

    public init(password: String? = nil, pw: String? = nil, username: String? = nil) {
        self.password = password
        self.pw = pw
        self.username = username
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.password = try values.decodeIfPresent(String.self, forKey: "Password")
        self.pw = try values.decodeIfPresent(String.self, forKey: "Pw")
        self.username = try values.decodeIfPresent(String.self, forKey: "Username")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(password, forKey: "Password")
        try values.encodeIfPresent(pw, forKey: "Pw")
        try values.encodeIfPresent(username, forKey: "Username")
    }
}
