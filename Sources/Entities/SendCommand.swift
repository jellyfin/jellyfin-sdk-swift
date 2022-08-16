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
    public var positionTicks: Int?
    /// Gets or sets the UTC time when to execute the command.
    public var when: Date?

    public init(
        command: SendCommandType? = nil,
        emittedAt: Date? = nil,
        groupID: UUID? = nil,
        playlistItemID: UUID? = nil,
        positionTicks: Int? = nil,
        when: Date? = nil
    ) {
        self.command = command
        self.emittedAt = emittedAt
        self.groupID = groupID
        self.playlistItemID = playlistItemID
        self.positionTicks = positionTicks
        self.when = when
    }
}
