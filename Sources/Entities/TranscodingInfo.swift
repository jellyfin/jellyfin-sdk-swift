//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct TranscodingInfo: Codable {
    public var audioChannels: Int?
    public var audioCodec: String?
    public var bitrate: Int?
    public var completionPercentage: Double?
    public var container: String?
    public var framerate: Double?
    public var hardwareAccelerationType: HardwareEncodingType?
    public var height: Int?
    public var isAudioDirect: Bool?
    public var isVideoDirect: Bool?
    public var transcodeReasons: TranscodeReasons?
    public var videoCodec: String?
    public var width: Int?

    public enum TranscodeReasons: String, Codable, CaseIterable {
        case containerNotSupported = "ContainerNotSupported"
        case videoCodecNotSupported = "VideoCodecNotSupported"
        case audioCodecNotSupported = "AudioCodecNotSupported"
        case subtitleCodecNotSupported = "SubtitleCodecNotSupported"
        case audioIsExternal = "AudioIsExternal"
        case secondaryAudioNotSupported = "SecondaryAudioNotSupported"
        case videoProfileNotSupported = "VideoProfileNotSupported"
        case videoLevelNotSupported = "VideoLevelNotSupported"
        case videoResolutionNotSupported = "VideoResolutionNotSupported"
        case videoBitDepthNotSupported = "VideoBitDepthNotSupported"
        case videoFramerateNotSupported = "VideoFramerateNotSupported"
        case refFramesNotSupported = "RefFramesNotSupported"
        case anamorphicVideoNotSupported = "AnamorphicVideoNotSupported"
        case interlacedVideoNotSupported = "InterlacedVideoNotSupported"
        case audioChannelsNotSupported = "AudioChannelsNotSupported"
        case audioProfileNotSupported = "AudioProfileNotSupported"
        case audioSampleRateNotSupported = "AudioSampleRateNotSupported"
        case audioBitDepthNotSupported = "AudioBitDepthNotSupported"
        case containerBitrateExceedsLimit = "ContainerBitrateExceedsLimit"
        case videoBitrateNotSupported = "VideoBitrateNotSupported"
        case audioBitrateNotSupported = "AudioBitrateNotSupported"
        case unknownVideoStreamInfo = "UnknownVideoStreamInfo"
        case unknownAudioStreamInfo = "UnknownAudioStreamInfo"
        case directPlayError = "DirectPlayError"
        case videoRangeTypeNotSupported = "VideoRangeTypeNotSupported"
    }

    public init(
        audioChannels: Int? = nil,
        audioCodec: String? = nil,
        bitrate: Int? = nil,
        completionPercentage: Double? = nil,
        container: String? = nil,
        framerate: Double? = nil,
        hardwareAccelerationType: HardwareEncodingType? = nil,
        height: Int? = nil,
        isAudioDirect: Bool? = nil,
        isVideoDirect: Bool? = nil,
        transcodeReasons: TranscodeReasons? = nil,
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
}
