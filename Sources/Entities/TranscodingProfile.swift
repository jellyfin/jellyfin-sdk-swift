//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct TranscodingProfile: Codable, Hashable {
    public var audioCodec: String?
    public var isBreakOnNonKeyFrames: Bool
    public var conditions: [ProfileCondition]?
    public var container: String?
    public var context: EncodingContext?
    public var isCopyTimestamps: Bool
    public var enableMpegtsM2TsMode: Bool
    public var enableSubtitlesInManifest: Bool
    public var isEstimateContentLength: Bool
    public var maxAudioChannels: String?
    public var minSegments: Int?
    public var `protocol`: String?
    public var segmentLength: Int?
    public var transcodeSeekInfo: TranscodeSeekInfo?
    public var type: DlnaProfileType?
    public var videoCodec: String?

    public init(
        audioCodec: String? = nil,
        isBreakOnNonKeyFrames: Bool? = nil,
        conditions: [ProfileCondition]? = nil,
        container: String? = nil,
        context: EncodingContext? = nil,
        isCopyTimestamps: Bool? = nil,
        enableMpegtsM2TsMode: Bool? = nil,
        enableSubtitlesInManifest: Bool? = nil,
        isEstimateContentLength: Bool? = nil,
        maxAudioChannels: String? = nil,
        minSegments: Int? = nil,
        protocol: String? = nil,
        segmentLength: Int? = nil,
        transcodeSeekInfo: TranscodeSeekInfo? = nil,
        type: DlnaProfileType? = nil,
        videoCodec: String? = nil
    ) {
        self.audioCodec = audioCodec
        self.isBreakOnNonKeyFrames = isBreakOnNonKeyFrames ?? false
        self.conditions = conditions
        self.container = container
        self.context = context
        self.isCopyTimestamps = isCopyTimestamps ?? false
        self.enableMpegtsM2TsMode = enableMpegtsM2TsMode ?? false
        self.enableSubtitlesInManifest = enableSubtitlesInManifest ?? false
        self.isEstimateContentLength = isEstimateContentLength ?? false
        self.maxAudioChannels = maxAudioChannels
        self.minSegments = minSegments
        self.protocol = `protocol`
        self.segmentLength = segmentLength
        self.transcodeSeekInfo = transcodeSeekInfo
        self.type = type
        self.videoCodec = videoCodec
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.audioCodec = try values.decodeIfPresent(String.self, forKey: "AudioCodec")
        self.isBreakOnNonKeyFrames = try values.decodeIfPresent(Bool.self, forKey: "BreakOnNonKeyFrames") ?? false
        self.conditions = try values.decodeIfPresent([ProfileCondition].self, forKey: "Conditions")
        self.container = try values.decodeIfPresent(String.self, forKey: "Container")
        self.context = try values.decodeIfPresent(EncodingContext.self, forKey: "Context")
        self.isCopyTimestamps = try values.decodeIfPresent(Bool.self, forKey: "CopyTimestamps") ?? false
        self.enableMpegtsM2TsMode = try values.decodeIfPresent(Bool.self, forKey: "EnableMpegtsM2TsMode") ?? false
        self.enableSubtitlesInManifest = try values.decodeIfPresent(Bool.self, forKey: "EnableSubtitlesInManifest") ?? false
        self.isEstimateContentLength = try values.decodeIfPresent(Bool.self, forKey: "EstimateContentLength") ?? false
        self.maxAudioChannels = try values.decodeIfPresent(String.self, forKey: "MaxAudioChannels")
        self.minSegments = try values.decodeIfPresent(Int.self, forKey: "MinSegments")
        self.protocol = try values.decodeIfPresent(String.self, forKey: "Protocol")
        self.segmentLength = try values.decodeIfPresent(Int.self, forKey: "SegmentLength")
        self.transcodeSeekInfo = try values.decodeIfPresent(TranscodeSeekInfo.self, forKey: "TranscodeSeekInfo")
        self.type = try values.decodeIfPresent(DlnaProfileType.self, forKey: "Type")
        self.videoCodec = try values.decodeIfPresent(String.self, forKey: "VideoCodec")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(audioCodec, forKey: "AudioCodec")
        try values.encodeIfPresent(isBreakOnNonKeyFrames, forKey: "BreakOnNonKeyFrames")
        try values.encodeIfPresent(conditions, forKey: "Conditions")
        try values.encodeIfPresent(container, forKey: "Container")
        try values.encodeIfPresent(context, forKey: "Context")
        try values.encodeIfPresent(isCopyTimestamps, forKey: "CopyTimestamps")
        try values.encodeIfPresent(enableMpegtsM2TsMode, forKey: "EnableMpegtsM2TsMode")
        try values.encodeIfPresent(enableSubtitlesInManifest, forKey: "EnableSubtitlesInManifest")
        try values.encodeIfPresent(isEstimateContentLength, forKey: "EstimateContentLength")
        try values.encodeIfPresent(maxAudioChannels, forKey: "MaxAudioChannels")
        try values.encodeIfPresent(minSegments, forKey: "MinSegments")
        try values.encodeIfPresent(`protocol`, forKey: "Protocol")
        try values.encodeIfPresent(segmentLength, forKey: "SegmentLength")
        try values.encodeIfPresent(transcodeSeekInfo, forKey: "TranscodeSeekInfo")
        try values.encodeIfPresent(type, forKey: "Type")
        try values.encodeIfPresent(videoCodec, forKey: "VideoCodec")
    }
}
