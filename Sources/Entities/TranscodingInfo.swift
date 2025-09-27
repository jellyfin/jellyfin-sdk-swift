//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class holding information on a running transcode.
public struct TranscodingInfo: Codable, Hashable {
    /// Gets or sets the audio channels.
    public var audioChannels: Int?
    /// Gets or sets the thread count used for encoding.
    public var audioCodec: String?
    /// Gets or sets the bitrate.
    public var bitrate: Int?
    /// Gets or sets the completion percentage.
    public var completionPercentage: Double?
    /// Gets or sets the thread count used for encoding.
    public var container: String?
    /// Gets or sets the framerate.
    public var framerate: Float?
    /// Gets or sets the hardware acceleration type.
    public var hardwareAccelerationType: HardwareAccelerationType?
    /// Gets or sets the video height.
    public var height: Int?
    /// Gets or sets a value indicating whether the audio is passed through.
    public var isAudioDirect: Bool?
    /// Gets or sets a value indicating whether the video is passed through.
    public var isVideoDirect: Bool?
    /// Gets or sets the transcode reasons.
    public var transcodeReasons: [TranscodeReason]?
    /// Gets or sets the thread count used for encoding.
    public var videoCodec: String?
    /// Gets or sets the video width.
    public var width: Int?

    public init(
        audioChannels: Int? = nil,
        audioCodec: String? = nil,
        bitrate: Int? = nil,
        completionPercentage: Double? = nil,
        container: String? = nil,
        framerate: Float? = nil,
        hardwareAccelerationType: HardwareAccelerationType? = nil,
        height: Int? = nil,
        isAudioDirect: Bool? = nil,
        isVideoDirect: Bool? = nil,
        transcodeReasons: [TranscodeReason]? = nil,
        videoCodec: String? = nil,
        width: Int? = nil
    ) {
        self.audioChannels = audioChannels
        self.audioCodec = audioCodec
        self.bitrate = bitrate
        self.completionPercentage = completionPercentage
        self.container = container
        self.framerate = framerate
        self.hardwareAccelerationType = hardwareAccelerationType
        self.height = height
        self.isAudioDirect = isAudioDirect
        self.isVideoDirect = isVideoDirect
        self.transcodeReasons = transcodeReasons
        self.videoCodec = videoCodec
        self.width = width
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.audioChannels = try values.decodeIfPresent(Int.self, forKey: "AudioChannels")
        self.audioCodec = try values.decodeIfPresent(String.self, forKey: "AudioCodec")
        self.bitrate = try values.decodeIfPresent(Int.self, forKey: "Bitrate")
        self.completionPercentage = try values.decodeIfPresent(Double.self, forKey: "CompletionPercentage")
        self.container = try values.decodeIfPresent(String.self, forKey: "Container")
        self.framerate = try values.decodeIfPresent(Float.self, forKey: "Framerate")
        self.hardwareAccelerationType = try values.decodeIfPresent(HardwareAccelerationType.self, forKey: "HardwareAccelerationType")
        self.height = try values.decodeIfPresent(Int.self, forKey: "Height")
        self.isAudioDirect = try values.decodeIfPresent(Bool.self, forKey: "IsAudioDirect")
        self.isVideoDirect = try values.decodeIfPresent(Bool.self, forKey: "IsVideoDirect")
        self.transcodeReasons = try values.decodeIfPresent([TranscodeReason].self, forKey: "TranscodeReasons")
        self.videoCodec = try values.decodeIfPresent(String.self, forKey: "VideoCodec")
        self.width = try values.decodeIfPresent(Int.self, forKey: "Width")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(audioChannels, forKey: "AudioChannels")
        try values.encodeIfPresent(audioCodec, forKey: "AudioCodec")
        try values.encodeIfPresent(bitrate, forKey: "Bitrate")
        try values.encodeIfPresent(completionPercentage, forKey: "CompletionPercentage")
        try values.encodeIfPresent(container, forKey: "Container")
        try values.encodeIfPresent(framerate, forKey: "Framerate")
        try values.encodeIfPresent(hardwareAccelerationType, forKey: "HardwareAccelerationType")
        try values.encodeIfPresent(height, forKey: "Height")
        try values.encodeIfPresent(isAudioDirect, forKey: "IsAudioDirect")
        try values.encodeIfPresent(isVideoDirect, forKey: "IsVideoDirect")
        try values.encodeIfPresent(transcodeReasons, forKey: "TranscodeReasons")
        try values.encodeIfPresent(videoCodec, forKey: "VideoCodec")
        try values.encodeIfPresent(width, forKey: "Width")
    }
}
