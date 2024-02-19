//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2024 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Plabyback info dto.
public struct PlaybackInfoDto: Codable, Hashable {
    /// Gets or sets a value indicating whether to allow audio stream copy.
    public var allowAudioStreamCopy: Bool?
    /// Gets or sets a value indicating whether to enable video stream copy.
    public var allowVideoStreamCopy: Bool?
    /// Gets or sets the audio stream index.
    public var audioStreamIndex: Int?
    /// Gets or sets a value indicating whether to auto open the live stream.
    public var isAutoOpenLiveStream: Bool?
    /// A MediaBrowser.Model.Dlna.DeviceProfile represents a set of metadata which determines which content a certain device is able to
    /// play.
    ///
    /// <br />
    ///
    /// Specifically, it defines the supported <see cref="P:MediaBrowser.Model.Dlna.DeviceProfile.ContainerProfiles">containers</see> and
    ///
    /// <see cref="P:MediaBrowser.Model.Dlna.DeviceProfile.CodecProfiles">codecs</see> (video and/or audio, including codec profiles and
    /// levels)
    ///
    /// the device is able to direct play (without transcoding or remuxing),
    ///
    /// as well as which <see cref="P:MediaBrowser.Model.Dlna.DeviceProfile.TranscodingProfiles">containers/codecs to transcode to</see> in
    /// case it isn't.
    public var deviceProfile: DeviceProfile?
    /// Gets or sets a value indicating whether to enable direct play.
    public var enableDirectPlay: Bool?
    /// Gets or sets a value indicating whether to enable direct stream.
    public var enableDirectStream: Bool?
    /// Gets or sets a value indicating whether to enable transcoding.
    public var enableTranscoding: Bool?
    /// Gets or sets the live stream id.
    public var liveStreamID: String?
    /// Gets or sets the max audio channels.
    public var maxAudioChannels: Int?
    /// Gets or sets the max streaming bitrate.
    public var maxStreamingBitrate: Int?
    /// Gets or sets the media source id.
    public var mediaSourceID: String?
    /// Gets or sets the start time in ticks.
    public var startTimeTicks: Int?
    /// Gets or sets the subtitle stream index.
    public var subtitleStreamIndex: Int?
    /// Gets or sets the playback userId.
    public var userID: String?

    public init(
        allowAudioStreamCopy: Bool? = nil,
        allowVideoStreamCopy: Bool? = nil,
        audioStreamIndex: Int? = nil,
        isAutoOpenLiveStream: Bool? = nil,
        deviceProfile: DeviceProfile? = nil,
        enableDirectPlay: Bool? = nil,
        enableDirectStream: Bool? = nil,
        enableTranscoding: Bool? = nil,
        liveStreamID: String? = nil,
        maxAudioChannels: Int? = nil,
        maxStreamingBitrate: Int? = nil,
        mediaSourceID: String? = nil,
        startTimeTicks: Int? = nil,
        subtitleStreamIndex: Int? = nil,
        userID: String? = nil
    ) {
        self.allowAudioStreamCopy = allowAudioStreamCopy
        self.allowVideoStreamCopy = allowVideoStreamCopy
        self.audioStreamIndex = audioStreamIndex
        self.isAutoOpenLiveStream = isAutoOpenLiveStream
        self.deviceProfile = deviceProfile
        self.enableDirectPlay = enableDirectPlay
        self.enableDirectStream = enableDirectStream
        self.enableTranscoding = enableTranscoding
        self.liveStreamID = liveStreamID
        self.maxAudioChannels = maxAudioChannels
        self.maxStreamingBitrate = maxStreamingBitrate
        self.mediaSourceID = mediaSourceID
        self.startTimeTicks = startTimeTicks
        self.subtitleStreamIndex = subtitleStreamIndex
        self.userID = userID
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.allowAudioStreamCopy = try values.decodeIfPresent(Bool.self, forKey: "AllowAudioStreamCopy")
        self.allowVideoStreamCopy = try values.decodeIfPresent(Bool.self, forKey: "AllowVideoStreamCopy")
        self.audioStreamIndex = try values.decodeIfPresent(Int.self, forKey: "AudioStreamIndex")
        self.isAutoOpenLiveStream = try values.decodeIfPresent(Bool.self, forKey: "AutoOpenLiveStream")
        self.deviceProfile = try values.decodeIfPresent(DeviceProfile.self, forKey: "DeviceProfile")
        self.enableDirectPlay = try values.decodeIfPresent(Bool.self, forKey: "EnableDirectPlay")
        self.enableDirectStream = try values.decodeIfPresent(Bool.self, forKey: "EnableDirectStream")
        self.enableTranscoding = try values.decodeIfPresent(Bool.self, forKey: "EnableTranscoding")
        self.liveStreamID = try values.decodeIfPresent(String.self, forKey: "LiveStreamId")
        self.maxAudioChannels = try values.decodeIfPresent(Int.self, forKey: "MaxAudioChannels")
        self.maxStreamingBitrate = try values.decodeIfPresent(Int.self, forKey: "MaxStreamingBitrate")
        self.mediaSourceID = try values.decodeIfPresent(String.self, forKey: "MediaSourceId")
        self.startTimeTicks = try values.decodeIfPresent(Int.self, forKey: "StartTimeTicks")
        self.subtitleStreamIndex = try values.decodeIfPresent(Int.self, forKey: "SubtitleStreamIndex")
        self.userID = try values.decodeIfPresent(String.self, forKey: "UserId")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(allowAudioStreamCopy, forKey: "AllowAudioStreamCopy")
        try values.encodeIfPresent(allowVideoStreamCopy, forKey: "AllowVideoStreamCopy")
        try values.encodeIfPresent(audioStreamIndex, forKey: "AudioStreamIndex")
        try values.encodeIfPresent(isAutoOpenLiveStream, forKey: "AutoOpenLiveStream")
        try values.encodeIfPresent(deviceProfile, forKey: "DeviceProfile")
        try values.encodeIfPresent(enableDirectPlay, forKey: "EnableDirectPlay")
        try values.encodeIfPresent(enableDirectStream, forKey: "EnableDirectStream")
        try values.encodeIfPresent(enableTranscoding, forKey: "EnableTranscoding")
        try values.encodeIfPresent(liveStreamID, forKey: "LiveStreamId")
        try values.encodeIfPresent(maxAudioChannels, forKey: "MaxAudioChannels")
        try values.encodeIfPresent(maxStreamingBitrate, forKey: "MaxStreamingBitrate")
        try values.encodeIfPresent(mediaSourceID, forKey: "MediaSourceId")
        try values.encodeIfPresent(startTimeTicks, forKey: "StartTimeTicks")
        try values.encodeIfPresent(subtitleStreamIndex, forKey: "SubtitleStreamIndex")
        try values.encodeIfPresent(userID, forKey: "UserId")
    }
}
