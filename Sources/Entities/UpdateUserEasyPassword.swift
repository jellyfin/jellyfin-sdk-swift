//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// The update user easy password request body.
public struct UpdateUserEasyPassword: Codable {
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
}
