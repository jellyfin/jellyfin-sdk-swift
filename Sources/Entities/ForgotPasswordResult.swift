//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct ForgotPasswordResult: Codable {
    /// Gets or sets the action.
    public var action: ForgotPasswordAction?
    /// Gets or sets the pin expiration date.
    public var pinExpirationDate: Date?
    /// Gets or sets the pin file.
    public var pinFile: String?

    public init(action: ForgotPasswordAction? = nil, pinExpirationDate: Date? = nil, pinFile: String? = nil) {
        self.action = action
        self.pinExpirationDate = pinExpirationDate
        self.pinFile = pinFile
    }
}
