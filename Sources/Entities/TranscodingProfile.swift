//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// A class for transcoding profile information.
///
/// Note for client developers: Conditions defined in MediaBrowser.Model.Dlna.CodecProfile has higher priority and can override values
/// defined here.
public struct TranscodingProfile: Codable, Hashable {
    /// Gets or sets the audio codec.
    public var audioCodec: String?
    /// Gets or sets a value indicating whether breaking the video stream on non-keyframes is supported.
    public var isBreakOnNonKeyFrames: Bool
    /// Gets or sets the profile conditions.
    public var conditions: [ProfileCondition]?
    /// Gets or sets the container.
    public var container: String?
    /// Gets or sets the encoding context.
    public var context: EncodingContext?
    /// Gets or sets a value indicating whether timestamps should be copied.
    public var isCopyTimestamps: Bool
    /// Gets or sets a value indicating whether variable bitrate encoding is supported.
    public var enableAudioVbrEncoding: Bool
    /// Gets or sets a value indicating whether M2TS mode is enabled.
    public var enableMpegtsM2TsMode: Bool
    /// Gets or sets a value indicating whether subtitles are allowed in the manifest.
    public var enableSubtitlesInManifest: Bool
    /// Gets or sets a value indicating whether the content length should be estimated.
    public var isEstimateContentLength: Bool
    /// Gets or sets the maximum audio channels.
    public var maxAudioChannels: String?
    /// Gets or sets the minimum amount of segments.
    public var minSegments: Int?
    /// Gets or sets the protocol.
    public var `protocol`: MediaStreamProtocol?
    /// Gets or sets the segment length.
    public var segmentLength: Int?
    /// Gets or sets the transcoding seek info mode.
    public var transcodeSeekInfo: TranscodeSeekInfo?
    /// Gets or sets the DLNA profile type.
    public var type: DlnaProfileType?
    /// Gets or sets the video codec.
    public var videoCodec: String?

    public init(
        audioCodec: String? = nil,
        isBreakOnNonKeyFrames: Bool? = nil,
        conditions: [ProfileCondition]? = nil,
        container: String? = nil,
        context: EncodingContext? = nil,
        isCopyTimestamps: Bool? = nil,
        enableAudioVbrEncoding: Bool? = nil,
        enableMpegtsM2TsMode: Bool? = nil,
        enableSubtitlesInManifest: Bool? = nil,
        isEstimateContentLength: Bool? = nil,
        maxAudioChannels: String? = nil,
        minSegments: Int? = nil,
        protocol: MediaStreamProtocol? = nil,
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
        self.enableAudioVbrEncoding = enableAudioVbrEncoding ?? true
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
        self.enableAudioVbrEncoding = try values.decodeIfPresent(Bool.self, forKey: "EnableAudioVbrEncoding") ?? true
        self.enableMpegtsM2TsMode = try values.decodeIfPresent(Bool.self, forKey: "EnableMpegtsM2TsMode") ?? false
        self.enableSubtitlesInManifest = try values.decodeIfPresent(Bool.self, forKey: "EnableSubtitlesInManifest") ?? false
        self.isEstimateContentLength = try values.decodeIfPresent(Bool.self, forKey: "EstimateContentLength") ?? false
        self.maxAudioChannels = try values.decodeIfPresent(String.self, forKey: "MaxAudioChannels")
        self.minSegments = try values.decodeIfPresent(Int.self, forKey: "MinSegments")
        self.protocol = try values.decodeIfPresent(MediaStreamProtocol.self, forKey: "Protocol")
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
        try values.encodeIfPresent(enableAudioVbrEncoding, forKey: "EnableAudioVbrEncoding")
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
