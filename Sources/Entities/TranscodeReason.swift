//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

public enum TranscodeReason: String, Codable, CaseIterable {
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
