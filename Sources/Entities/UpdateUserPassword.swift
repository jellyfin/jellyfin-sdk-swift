//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// The update user password request body.
public struct UpdateUserPassword: Codable, Hashable {
    /// Gets or sets the current sha1-hashed password.
    public var currentPassword: String?
    /// Gets or sets the current plain text password.
    public var currentPw: String?
    /// Gets or sets the new plain text password.
    public var newPw: String?
    /// Gets or sets a value indicating whether to reset the password.
    public var isResetPassword: Bool?

    public init(currentPassword: String? = nil, currentPw: String? = nil, newPw: String? = nil, isResetPassword: Bool? = nil) {
        self.currentPassword = currentPassword
        self.currentPw = currentPw
        self.newPw = newPw
        self.isResetPassword = isResetPassword
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.currentPassword = try values.decodeIfPresent(String.self, forKey: "CurrentPassword")
        self.currentPw = try values.decodeIfPresent(String.self, forKey: "CurrentPw")
        self.newPw = try values.decodeIfPresent(String.self, forKey: "NewPw")
        self.isResetPassword = try values.decodeIfPresent(Bool.self, forKey: "ResetPassword")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(currentPassword, forKey: "CurrentPassword")
        try values.encodeIfPresent(currentPw, forKey: "CurrentPw")
        try values.encodeIfPresent(newPw, forKey: "NewPw")
        try values.encodeIfPresent(isResetPassword, forKey: "ResetPassword")
    }
}
