//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Forgot Password Pin enter request body DTO.
public struct ForgotPasswordPinDto: Codable, Hashable {
    /// Gets or sets the entered pin to have the password reset.
    public var pin: String

    public init(pin: String) {
        self.pin = pin
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.pin = try values.decode(String.self, forKey: "Pin")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(pin, forKey: "Pin")
    }
}
