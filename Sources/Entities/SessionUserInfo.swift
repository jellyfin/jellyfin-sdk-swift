//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class SessionUserInfo.
public struct SessionUserInfo: Codable {
    /// Gets or sets the user identifier.
    public var userID: UUID?
    /// Gets or sets the name of the user.
    public var userName: String?

    public init(userID: UUID? = nil, userName: String? = nil) {
        self.userID = userID
        self.userName = userName
    }
}
