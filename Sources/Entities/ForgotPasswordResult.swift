//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct ForgotPasswordResult: Codable, Hashable {
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

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.action = try values.decodeIfPresent(ForgotPasswordAction.self, forKey: "Action")
        self.pinExpirationDate = try values.decodeIfPresent(Date.self, forKey: "PinExpirationDate")
        self.pinFile = try values.decodeIfPresent(String.self, forKey: "PinFile")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(action, forKey: "Action")
        try values.encodeIfPresent(pinExpirationDate, forKey: "PinExpirationDate")
        try values.encodeIfPresent(pinFile, forKey: "PinFile")
    }
}
