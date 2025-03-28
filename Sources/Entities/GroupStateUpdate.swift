//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class GroupStateUpdate.
public struct GroupStateUpdate: Codable, Hashable {
    /// Gets the reason of the state change.
    public var reason: PlaybackRequestType?
    /// Gets the state of the group.
    public var state: GroupStateType?

    public init(reason: PlaybackRequestType? = nil, state: GroupStateType? = nil) {
        self.reason = reason
        self.state = state
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.reason = try values.decodeIfPresent(PlaybackRequestType.self, forKey: "Reason")
        self.state = try values.decodeIfPresent(GroupStateType.self, forKey: "State")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(reason, forKey: "Reason")
        try values.encodeIfPresent(state, forKey: "State")
    }
}
