//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class UserDataChangeInfo.
public struct UserDataChangeInfo: Codable, Hashable {
    /// Gets or sets the user data list.
    public var userDataList: [UserItemDataDto]?
    /// Gets or sets the user id.
    public var userID: String?

    public init(userDataList: [UserItemDataDto]? = nil, userID: String? = nil) {
        self.userDataList = userDataList
        self.userID = userID
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.userDataList = try values.decodeIfPresent([UserItemDataDto].self, forKey: "UserDataList")
        self.userID = try values.decodeIfPresent(String.self, forKey: "UserId")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(userDataList, forKey: "UserDataList")
        try values.encodeIfPresent(userID, forKey: "UserId")
    }
}
