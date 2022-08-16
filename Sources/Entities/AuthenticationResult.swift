//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct AuthenticationResult: Codable {
    public var accessToken: String?
    public var serverID: String?
    /// Class SessionInfo.
    public var sessionInfo: SessionInfo?
    /// Class UserDto.
    public var user: UserDto?

    public init(accessToken: String? = nil, serverID: String? = nil, sessionInfo: SessionInfo? = nil, user: UserDto? = nil) {
        self.accessToken = accessToken
        self.serverID = serverID
        self.sessionInfo = sessionInfo
        self.user = user
    }
}
