//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

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
/// as well as which <see cref="P:MediaBrowser.Model.Dlna.DeviceProfile.TranscodingProfiles">containers/codecs to transcode to</see> in case
/// it isn't.
public struct DeviceProfile: Codable, Hashable, Identifiable {
    /// Gets or sets the codec profiles.
    public var codecProfiles: [CodecProfile]?
    /// Gets or sets the container profiles. Failing to meet these optional conditions causes transcoding to occur.
    public var containerProfiles: [ContainerProfile]?
    /// Gets or sets the direct play profiles.
    public var directPlayProfiles: [DirectPlayProfile]?
    /// Gets or sets the unique internal identifier.
    public var id: String?
    /// Gets or sets the maximum allowed bitrate for statically streamed content (= direct played files).
    public var maxStaticBitrate: Int?
    /// Gets or sets the maximum allowed bitrate for statically streamed (= direct played) music files.
    public var maxStaticMusicBitrate: Int?
    /// Gets or sets the maximum allowed bitrate for all streamed content.
    public var maxStreamingBitrate: Int?
    /// Gets or sets the maximum allowed bitrate for transcoded music streams.
    public var musicStreamingTranscodingBitrate: Int?
    /// Gets or sets the name of this device profile. User profiles must have a unique name.
    public var name: String?
    /// Gets or sets the subtitle profiles.
    public var subtitleProfiles: [SubtitleProfile]?
    /// Gets or sets the transcoding profiles.
    public var transcodingProfiles: [TranscodingProfile]?

    public init(
        codecProfiles: [CodecProfile]? = nil,
        containerProfiles: [ContainerProfile]? = nil,
        directPlayProfiles: [DirectPlayProfile]? = nil,
        id: String? = nil,
        maxStaticBitrate: Int? = nil,
        maxStaticMusicBitrate: Int? = nil,
        maxStreamingBitrate: Int? = nil,
        musicStreamingTranscodingBitrate: Int? = nil,
        name: String? = nil,
        subtitleProfiles: [SubtitleProfile]? = nil,
        transcodingProfiles: [TranscodingProfile]? = nil
    ) {
        self.codecProfiles = codecProfiles
        self.containerProfiles = containerProfiles
        self.directPlayProfiles = directPlayProfiles
        self.id = id
        self.maxStaticBitrate = maxStaticBitrate
        self.maxStaticMusicBitrate = maxStaticMusicBitrate
        self.maxStreamingBitrate = maxStreamingBitrate
        self.musicStreamingTranscodingBitrate = musicStreamingTranscodingBitrate
        self.name = name
        self.subtitleProfiles = subtitleProfiles
        self.transcodingProfiles = transcodingProfiles
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.codecProfiles = try values.decodeIfPresent([CodecProfile].self, forKey: "CodecProfiles")
        self.containerProfiles = try values.decodeIfPresent([ContainerProfile].self, forKey: "ContainerProfiles")
        self.directPlayProfiles = try values.decodeIfPresent([DirectPlayProfile].self, forKey: "DirectPlayProfiles")
        self.id = try values.decodeIfPresent(String.self, forKey: "Id")
        self.maxStaticBitrate = try values.decodeIfPresent(Int.self, forKey: "MaxStaticBitrate")
        self.maxStaticMusicBitrate = try values.decodeIfPresent(Int.self, forKey: "MaxStaticMusicBitrate")
        self.maxStreamingBitrate = try values.decodeIfPresent(Int.self, forKey: "MaxStreamingBitrate")
        self.musicStreamingTranscodingBitrate = try values.decodeIfPresent(Int.self, forKey: "MusicStreamingTranscodingBitrate")
        self.name = try values.decodeIfPresent(String.self, forKey: "Name")
        self.subtitleProfiles = try values.decodeIfPresent([SubtitleProfile].self, forKey: "SubtitleProfiles")
        self.transcodingProfiles = try values.decodeIfPresent([TranscodingProfile].self, forKey: "TranscodingProfiles")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(codecProfiles, forKey: "CodecProfiles")
        try values.encodeIfPresent(containerProfiles, forKey: "ContainerProfiles")
        try values.encodeIfPresent(directPlayProfiles, forKey: "DirectPlayProfiles")
        try values.encodeIfPresent(id, forKey: "Id")
        try values.encodeIfPresent(maxStaticBitrate, forKey: "MaxStaticBitrate")
        try values.encodeIfPresent(maxStaticMusicBitrate, forKey: "MaxStaticMusicBitrate")
        try values.encodeIfPresent(maxStreamingBitrate, forKey: "MaxStreamingBitrate")
        try values.encodeIfPresent(musicStreamingTranscodingBitrate, forKey: "MusicStreamingTranscodingBitrate")
        try values.encodeIfPresent(name, forKey: "Name")
        try values.encodeIfPresent(subtitleProfiles, forKey: "SubtitleProfiles")
        try values.encodeIfPresent(transcodingProfiles, forKey: "TranscodingProfiles")
    }
}
