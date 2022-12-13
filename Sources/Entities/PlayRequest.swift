//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class PlayRequest.
public struct PlayRequest: Codable, Hashable {
    public var audioStreamIndex: Int32?
    /// Gets or sets the controlling user identifier.
    public var controllingUserID: String?
    /// Gets or sets the item ids.
    public var itemIDs: [String]?
    public var mediaSourceID: String?
    /// Gets or sets the play command.
    public var playCommand: PlayCommand?
    public var startIndex: Int32?
    /// Gets or sets the start position ticks that the first item should be played at.
    public var startPositionTicks: Int64?
    public var subtitleStreamIndex: Int32?

    public init(
        audioStreamIndex: Int32? = nil,
        controllingUserID: String? = nil,
        itemIDs: [String]? = nil,
        mediaSourceID: String? = nil,
        playCommand: PlayCommand? = nil,
        startIndex: Int32? = nil,
        startPositionTicks: Int64? = nil,
        subtitleStreamIndex: Int32? = nil
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

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.audioStreamIndex = try values.decodeIfPresent(Int32.self, forKey: "AudioStreamIndex")
        self.controllingUserID = try values.decodeIfPresent(String.self, forKey: "ControllingUserId")
        self.itemIDs = try values.decodeIfPresent([String].self, forKey: "ItemIds")
        self.mediaSourceID = try values.decodeIfPresent(String.self, forKey: "MediaSourceId")
        self.playCommand = try values.decodeIfPresent(PlayCommand.self, forKey: "PlayCommand")
        self.startIndex = try values.decodeIfPresent(Int32.self, forKey: "StartIndex")
        self.startPositionTicks = try values.decodeIfPresent(Int64.self, forKey: "StartPositionTicks")
        self.subtitleStreamIndex = try values.decodeIfPresent(Int32.self, forKey: "SubtitleStreamIndex")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(audioStreamIndex, forKey: "AudioStreamIndex")
        try values.encodeIfPresent(controllingUserID, forKey: "ControllingUserId")
        try values.encodeIfPresent(itemIDs, forKey: "ItemIds")
        try values.encodeIfPresent(mediaSourceID, forKey: "MediaSourceId")
        try values.encodeIfPresent(playCommand, forKey: "PlayCommand")
        try values.encodeIfPresent(startIndex, forKey: "StartIndex")
        try values.encodeIfPresent(startPositionTicks, forKey: "StartPositionTicks")
        try values.encodeIfPresent(subtitleStreamIndex, forKey: "SubtitleStreamIndex")
    }
}
