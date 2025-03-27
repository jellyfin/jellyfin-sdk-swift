//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// A class representing an authentication result.
public struct AuthenticationResult: Codable, Hashable {
    /// Gets or sets the access token.
    public var accessToken: String?
    /// Gets or sets the server id.
    public var serverID: String?
    /// Gets or sets the session info.
    public var sessionInfo: SessionInfoDto?
    /// Gets or sets the user.
    public var user: UserDto?

    public init(accessToken: String? = nil, serverID: String? = nil, sessionInfo: SessionInfoDto? = nil, user: UserDto? = nil) {
        self.accessToken = accessToken
        self.serverID = serverID
        self.sessionInfo = sessionInfo
        self.user = user
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.accessToken = try values.decodeIfPresent(String.self, forKey: "AccessToken")
        self.serverID = try values.decodeIfPresent(String.self, forKey: "ServerId")
        self.sessionInfo = try values.decodeIfPresent(SessionInfoDto.self, forKey: "SessionInfo")
        self.user = try values.decodeIfPresent(UserDto.self, forKey: "User")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(accessToken, forKey: "AccessToken")
        try values.encodeIfPresent(serverID, forKey: "ServerId")
        try values.encodeIfPresent(sessionInfo, forKey: "SessionInfo")
        try values.encodeIfPresent(user, forKey: "User")
    }
}
