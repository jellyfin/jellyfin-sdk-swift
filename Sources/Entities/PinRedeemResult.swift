//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct PinRedeemResult: Codable, Hashable {
    /// Gets or sets a value indicating whether this MediaBrowser.Model.Users.PinRedeemResult is success.
    public var isSuccess: Bool?
    /// Gets or sets the users reset.
    public var usersReset: [String]?

    public init(isSuccess: Bool? = nil, usersReset: [String]? = nil) {
        self.isSuccess = isSuccess
        self.usersReset = usersReset
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.isSuccess = try values.decodeIfPresent(Bool.self, forKey: "Success")
        self.usersReset = try values.decodeIfPresent([String].self, forKey: "UsersReset")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(isSuccess, forKey: "Success")
        try values.encodeIfPresent(usersReset, forKey: "UsersReset")
    }
}
