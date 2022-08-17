//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Open live stream dto.
public struct OpenLiveStreamDto: Codable {
    /// Gets or sets the audio stream index.
    public var audioStreamIndex: Int32?
    /// A MediaBrowser.Model.Dlna.DeviceProfile represents a set of metadata which determines which content a certain device is able to play.
    ///
    /// <br />
    ///
    /// Specifically, it defines the supported <see cref="P:MediaBrowser.Model.Dlna.DeviceProfile.ContainerProfiles">containers</see> and
    ///
    /// <see cref="P:MediaBrowser.Model.Dlna.DeviceProfile.CodecProfiles">codecs</see> (video and/or audio, including codec profiles and levels)
    ///
    /// the device is able to direct play (without transcoding or remuxing),
    ///
    /// as well as which <see cref="P:MediaBrowser.Model.Dlna.DeviceProfile.TranscodingProfiles">containers/codecs to transcode to</see> in case it isn't.
    public var deviceProfile: DeviceProfile?
    /// Gets or sets the device play protocols.
    public var directPlayProtocols: [MediaProtocol]?
    /// Gets or sets a value indicating whether to enable direct play.
    public var enableDirectPlay: Bool?
    /// Gets or sets a value indicating whether to enale direct stream.
    public var enableDirectStream: Bool?
    /// Gets or sets the item id.
    public var itemID: String?
    /// Gets or sets the max audio channels.
    public var maxAudioChannels: Int32?
    /// Gets or sets the max streaming bitrate.
    public var maxStreamingBitrate: Int32?
    /// Gets or sets the open token.
    public var openToken: String?
    /// Gets or sets the play session id.
    public var playSessionID: String?
    /// Gets or sets the start time in ticks.
    public var startTimeTicks: Int64?
    /// Gets or sets the subtitle stream index.
    public var subtitleStreamIndex: Int32?
    /// Gets or sets the user id.
    public var userID: String?

    public init(
        audioStreamIndex: Int32? = nil,
        deviceProfile: DeviceProfile? = nil,
        directPlayProtocols: [MediaProtocol]? = nil,
        enableDirectPlay: Bool? = nil,
        enableDirectStream: Bool? = nil,
        itemID: String? = nil,
        maxAudioChannels: Int32? = nil,
        maxStreamingBitrate: Int32? = nil,
        openToken: String? = nil,
        playSessionID: String? = nil,
        startTimeTicks: Int64? = nil,
        subtitleStreamIndex: Int32? = nil,
        userID: String? = nil
    ) {
        self.audioStreamIndex = audioStreamIndex
        self.deviceProfile = deviceProfile
        self.directPlayProtocols = directPlayProtocols
        self.enableDirectPlay = enableDirectPlay
        self.enableDirectStream = enableDirectStream
        self.itemID = itemID
        self.maxAudioChannels = maxAudioChannels
        self.maxStreamingBitrate = maxStreamingBitrate
        self.openToken = openToken
        self.playSessionID = playSessionID
        self.startTimeTicks = startTimeTicks
        self.subtitleStreamIndex = subtitleStreamIndex
        self.userID = userID
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.audioStreamIndex = try values.decodeIfPresent(Int32.self, forKey: "AudioStreamIndex")
        self.deviceProfile = try values.decodeIfPresent(DeviceProfile.self, forKey: "DeviceProfile")
        self.directPlayProtocols = try values.decodeIfPresent([MediaProtocol].self, forKey: "DirectPlayProtocols")
        self.enableDirectPlay = try values.decodeIfPresent(Bool.self, forKey: "EnableDirectPlay")
        self.enableDirectStream = try values.decodeIfPresent(Bool.self, forKey: "EnableDirectStream")
        self.itemID = try values.decodeIfPresent(String.self, forKey: "ItemId")
        self.maxAudioChannels = try values.decodeIfPresent(Int32.self, forKey: "MaxAudioChannels")
        self.maxStreamingBitrate = try values.decodeIfPresent(Int32.self, forKey: "MaxStreamingBitrate")
        self.openToken = try values.decodeIfPresent(String.self, forKey: "OpenToken")
        self.playSessionID = try values.decodeIfPresent(String.self, forKey: "PlaySessionId")
        self.startTimeTicks = try values.decodeIfPresent(Int64.self, forKey: "StartTimeTicks")
        self.subtitleStreamIndex = try values.decodeIfPresent(Int32.self, forKey: "SubtitleStreamIndex")
        self.userID = try values.decodeIfPresent(String.self, forKey: "UserId")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(audioStreamIndex, forKey: "AudioStreamIndex")
        try values.encodeIfPresent(deviceProfile, forKey: "DeviceProfile")
        try values.encodeIfPresent(directPlayProtocols, forKey: "DirectPlayProtocols")
        try values.encodeIfPresent(enableDirectPlay, forKey: "EnableDirectPlay")
        try values.encodeIfPresent(enableDirectStream, forKey: "EnableDirectStream")
        try values.encodeIfPresent(itemID, forKey: "ItemId")
        try values.encodeIfPresent(maxAudioChannels, forKey: "MaxAudioChannels")
        try values.encodeIfPresent(maxStreamingBitrate, forKey: "MaxStreamingBitrate")
        try values.encodeIfPresent(openToken, forKey: "OpenToken")
        try values.encodeIfPresent(playSessionID, forKey: "PlaySessionId")
        try values.encodeIfPresent(startTimeTicks, forKey: "StartTimeTicks")
        try values.encodeIfPresent(subtitleStreamIndex, forKey: "SubtitleStreamIndex")
        try values.encodeIfPresent(userID, forKey: "UserId")
    }
}
