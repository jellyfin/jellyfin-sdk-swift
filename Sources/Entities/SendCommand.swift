//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class SendCommand.
public struct SendCommand: Codable {
    /// Gets the command.
    public var command: SendCommandType?
    /// Gets the UTC time when this command has been emitted.
    public var emittedAt: Date?
    /// Gets the group identifier.
    public var groupID: UUID?
    /// Gets the playlist identifier of the playing item.
    public var playlistItemID: UUID?
    /// Gets the position ticks.
    public var positionTicks: Int64?
    /// Gets or sets the UTC time when to execute the command.
    public var when: Date?

    public init(command: SendCommandType? = nil, emittedAt: Date? = nil, groupID: UUID? = nil, playlistItemID: UUID? = nil, positionTicks: Int64? = nil, when: Date? = nil) {
        self.command = command
        self.emittedAt = emittedAt
        self.groupID = groupID
        self.playlistItemID = playlistItemID
        self.positionTicks = positionTicks
        self.when = when
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.command = try values.decodeIfPresent(SendCommandType.self, forKey: "Command")
        self.emittedAt = try values.decodeIfPresent(Date.self, forKey: "EmittedAt")
        self.groupID = try values.decodeIfPresent(UUID.self, forKey: "GroupId")
        self.playlistItemID = try values.decodeIfPresent(UUID.self, forKey: "PlaylistItemId")
        self.positionTicks = try values.decodeIfPresent(Int64.self, forKey: "PositionTicks")
        self.when = try values.decodeIfPresent(Date.self, forKey: "When")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(command, forKey: "Command")
        try values.encodeIfPresent(emittedAt, forKey: "EmittedAt")
        try values.encodeIfPresent(groupID, forKey: "GroupId")
        try values.encodeIfPresent(playlistItemID, forKey: "PlaylistItemId")
        try values.encodeIfPresent(positionTicks, forKey: "PositionTicks")
        try values.encodeIfPresent(when, forKey: "When")
    }
}
