//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

public enum ProfileConditionValue: String, Codable, CaseIterable {
    case audioChannels = "AudioChannels"
    case audioBitrate = "AudioBitrate"
    case audioProfile = "AudioProfile"
    case width = "Width"
    case height = "Height"
    case has64BitOffsets = "Has64BitOffsets"
    case packetLength = "PacketLength"
    case videoBitDepth = "VideoBitDepth"
    case videoBitrate = "VideoBitrate"
    case videoFramerate = "VideoFramerate"
    case videoLevel = "VideoLevel"
    case videoProfile = "VideoProfile"
    case videoTimestamp = "VideoTimestamp"
    case isAnamorphic = "IsAnamorphic"
    case refFrames = "RefFrames"
    case numAudioStreams = "NumAudioStreams"
    case numVideoStreams = "NumVideoStreams"
    case isSecondaryAudio = "IsSecondaryAudio"
    case videoCodecTag = "VideoCodecTag"
    case isAvc = "IsAvc"
    case isInterlaced = "IsInterlaced"
    case audioSampleRate = "AudioSampleRate"
    case audioBitDepth = "AudioBitDepth"
    case videoRangeType = "VideoRangeType"
}
