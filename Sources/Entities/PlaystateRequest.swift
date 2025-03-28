//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct PlaystateRequest: Codable, Hashable {
    /// Enum PlaystateCommand.
    public var command: PlaystateCommand?
    /// Gets or sets the controlling user identifier.
    public var controllingUserID: String?
    public var seekPositionTicks: Int?

    public init(command: PlaystateCommand? = nil, controllingUserID: String? = nil, seekPositionTicks: Int? = nil) {
        self.command = command
        self.controllingUserID = controllingUserID
        self.seekPositionTicks = seekPositionTicks
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.command = try values.decodeIfPresent(PlaystateCommand.self, forKey: "Command")
        self.controllingUserID = try values.decodeIfPresent(String.self, forKey: "ControllingUserId")
        self.seekPositionTicks = try values.decodeIfPresent(Int.self, forKey: "SeekPositionTicks")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(command, forKey: "Command")
        try values.encodeIfPresent(controllingUserID, forKey: "ControllingUserId")
        try values.encodeIfPresent(seekPositionTicks, forKey: "SeekPositionTicks")
    }
}
