//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class SessionUserInfo.
public struct SessionUserInfo: Codable, Hashable {
    /// Gets or sets the user identifier.
    public var userID: String?
    /// Gets or sets the name of the user.
    public var userName: String?

    public init(userID: String? = nil, userName: String? = nil) {
        self.userID = userID
        self.userName = userName
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.userID = try values.decodeIfPresent(String.self, forKey: "UserId")
        self.userName = try values.decodeIfPresent(String.self, forKey: "UserName")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(userID, forKey: "UserId")
        try values.encodeIfPresent(userName, forKey: "UserName")
    }
}
