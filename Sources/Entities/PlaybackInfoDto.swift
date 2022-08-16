//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Plabyback info dto.
public struct PlaybackInfoDto: Codable {
    /// Gets or sets a value indicating whether to allow audio stream copy.
    public var allowAudioStreamCopy: Bool?
    /// Gets or sets a value indicating whether to enable video stream copy.
    public var allowVideoStreamCopy: Bool?
    /// Gets or sets the audio stream index.
    public var audioStreamIndex: Int?
    /// Gets or sets a value indicating whether to auto open the live stream.
    public var isAutoOpenLiveStream: Bool?
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
    public var userID: UUID?

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
        userID: UUID? = nil
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
}
