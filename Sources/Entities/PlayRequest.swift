//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class PlayRequest.
public struct PlayRequest: Codable {
    public var audioStreamIndex: Int?
    /// Gets or sets the controlling user identifier.
    public var controllingUserID: UUID?
    /// Gets or sets the item ids.
    public var itemIDs: [UUID]?
    public var mediaSourceID: String?
    /// Gets or sets the play command.
    public var playCommand: PlayCommand?
    public var startIndex: Int?
    /// Gets or sets the start position ticks that the first item should be played at.
    public var startPositionTicks: Int?
    public var subtitleStreamIndex: Int?

    public init(
        audioStreamIndex: Int? = nil,
        controllingUserID: UUID? = nil,
        itemIDs: [UUID]? = nil,
        mediaSourceID: String? = nil,
        playCommand: PlayCommand? = nil,
        startIndex: Int? = nil,
        startPositionTicks: Int? = nil,
        subtitleStreamIndex: Int? = nil
    ) {
        self.audioStreamIndex = audioStreamIndex
        self.controllingUserID = controllingUserID
        self.itemIDs = itemIDs
        self.mediaSourceID = mediaSourceID
        self.playCommand = playCommand
        self.startIndex = startIndex
        self.startPositionTicks = startPositionTicks
        self.subtitleStreamIndex = subtitleStreamIndex
    }
}
