//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct TranscodingInfo: Codable {
    public var audioChannels: Int32?
    public var audioCodec: String?
    public var bitrate: Int32?
    public var completionPercentage: Double?
    public var container: String?
    public var framerate: Float?
    public var hardwareAccelerationType: HardwareEncodingType?
    public var height: Int32?
    public var isAudioDirect: Bool?
    public var isVideoDirect: Bool?
    public var transcodeReasons: [TranscodeReason]?
    public var videoCodec: String?
    public var width: Int32?

    public init(
        audioChannels: Int32? = nil,
        audioCodec: String? = nil,
        bitrate: Int32? = nil,
        completionPercentage: Double? = nil,
        container: String? = nil,
        framerate: Float? = nil,
        hardwareAccelerationType: HardwareEncodingType? = nil,
        height: Int32? = nil,
        isAudioDirect: Bool? = nil,
        isVideoDirect: Bool? = nil,
        transcodeReasons: [TranscodeReason]? = nil,
        videoCodec: String? = nil,
        width: Int32? = nil
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
        self.audioChannels = try values.decodeIfPresent(Int32.self, forKey: "AudioChannels")
        self.audioCodec = try values.decodeIfPresent(String.self, forKey: "AudioCodec")
        self.bitrate = try values.decodeIfPresent(Int32.self, forKey: "Bitrate")
        self.completionPercentage = try values.decodeIfPresent(Double.self, forKey: "CompletionPercentage")
        self.container = try values.decodeIfPresent(String.self, forKey: "Container")
        self.framerate = try values.decodeIfPresent(Float.self, forKey: "Framerate")
        self.hardwareAccelerationType = try values.decodeIfPresent(HardwareEncodingType.self, forKey: "HardwareAccelerationType")
        self.height = try values.decodeIfPresent(Int32.self, forKey: "Height")
        self.isAudioDirect = try values.decodeIfPresent(Bool.self, forKey: "IsAudioDirect")
        self.isVideoDirect = try values.decodeIfPresent(Bool.self, forKey: "IsVideoDirect")
        self.transcodeReasons = try values.decodeIfPresent([TranscodeReason].self, forKey: "TranscodeReasons")
        self.videoCodec = try values.decodeIfPresent(String.self, forKey: "VideoCodec")
        self.width = try values.decodeIfPresent(Int32.self, forKey: "Width")
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
