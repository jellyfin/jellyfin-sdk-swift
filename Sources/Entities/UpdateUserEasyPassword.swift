//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// The update user easy password request body.
public struct UpdateUserEasyPassword: Codable, Hashable {
    /// Gets or sets the new sha1-hashed password.
    public var newPassword: String?
    /// Gets or sets the new password.
    public var newPw: String?
    /// Gets or sets a value indicating whether to reset the password.
    public var isResetPassword: Bool?

    public init(newPassword: String? = nil, newPw: String? = nil, isResetPassword: Bool? = nil) {
        self.newPassword = newPassword
        self.newPw = newPw
        self.isResetPassword = isResetPassword
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.newPassword = try values.decodeIfPresent(String.self, forKey: "NewPassword")
        self.newPw = try values.decodeIfPresent(String.self, forKey: "NewPw")
        self.isResetPassword = try values.decodeIfPresent(Bool.self, forKey: "ResetPassword")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(newPassword, forKey: "NewPassword")
        try values.encodeIfPresent(newPw, forKey: "NewPw")
        try values.encodeIfPresent(isResetPassword, forKey: "ResetPassword")
    }
}
