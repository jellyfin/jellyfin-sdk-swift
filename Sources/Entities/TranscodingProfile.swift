//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct TranscodingProfile: Codable {
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
}
