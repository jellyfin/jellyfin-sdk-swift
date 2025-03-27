//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Forgot Password request body DTO.
public struct ForgotPasswordDto: Codable, Hashable {
    /// Gets or sets the entered username to have its password reset.
    public var enteredUsername: String

    public init(enteredUsername: String) {
        self.enteredUsername = enteredUsername
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.enteredUsername = try values.decode(String.self, forKey: "EnteredUsername")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(enteredUsername, forKey: "EnteredUsername")
    }
}
