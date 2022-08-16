//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct EncodingOptions: Codable {
    public var allowHevcEncoding: Bool?
    public var allowOnDemandMetadataBasedKeyframeExtractionForExtensions: [String]?
    public var isDeinterlaceDoubleRate: Bool?
    public var deinterlaceMethod: String?
    public var downMixAudioBoost: Double?
    public var enableDecodingColorDepth10Hevc: Bool?
    public var enableDecodingColorDepth10Vp9: Bool?
    public var enableEnhancedNvdecDecoder: Bool?
    public var enableFallbackFont: Bool?
    public var enableHardwareEncoding: Bool?
    public var enableIntelLowPowerH264HwEncoder: Bool?
    public var enableIntelLowPowerHevcHwEncoder: Bool?
    public var enableSubtitleExtraction: Bool?
    public var enableThrottling: Bool?
    public var enableTonemapping: Bool?
    public var enableVppTonemapping: Bool?
    /// Gets or sets the FFmpeg path as set by the user via the UI.
    public var encoderAppPath: String?
    /// Gets or sets the current FFmpeg path being used by the system and displayed on the transcode page.
    public var encoderAppPathDisplay: String?
    public var encoderPreset: String?
    public var encodingThreadCount: Int?
    public var fallbackFontPath: String?
    public var h264Crf: Int?
    public var h265Crf: Int?
    public var hardwareAccelerationType: String?
    public var hardwareDecodingCodecs: [String]?
    public var maxMuxingQueueSize: Int?
    public var isPreferSystemNativeHwDecoder: Bool?
    public var throttleDelaySeconds: Int?
    public var tonemappingAlgorithm: String?
    public var tonemappingDesat: Double?
    public var tonemappingParam: Double?
    public var tonemappingPeak: Double?
    public var tonemappingRange: String?
    public var tonemappingThreshold: Double?
    public var transcodingTempPath: String?
    public var vaapiDevice: String?
    public var vppTonemappingBrightness: Double?
    public var vppTonemappingContrast: Double?

    public init(
        allowHevcEncoding: Bool? = nil,
        allowOnDemandMetadataBasedKeyframeExtractionForExtensions: [String]? = nil,
        isDeinterlaceDoubleRate: Bool? = nil,
        deinterlaceMethod: String? = nil,
        downMixAudioBoost: Double? = nil,
        enableDecodingColorDepth10Hevc: Bool? = nil,
        enableDecodingColorDepth10Vp9: Bool? = nil,
        enableEnhancedNvdecDecoder: Bool? = nil,
        enableFallbackFont: Bool? = nil,
        enableHardwareEncoding: Bool? = nil,
        enableIntelLowPowerH264HwEncoder: Bool? = nil,
        enableIntelLowPowerHevcHwEncoder: Bool? = nil,
        enableSubtitleExtraction: Bool? = nil,
        enableThrottling: Bool? = nil,
        enableTonemapping: Bool? = nil,
        enableVppTonemapping: Bool? = nil,
        encoderAppPath: String? = nil,
        encoderAppPathDisplay: String? = nil,
        encoderPreset: String? = nil,
        encodingThreadCount: Int? = nil,
        fallbackFontPath: String? = nil,
        h264Crf: Int? = nil,
        h265Crf: Int? = nil,
        hardwareAccelerationType: String? = nil,
        hardwareDecodingCodecs: [String]? = nil,
        maxMuxingQueueSize: Int? = nil,
        isPreferSystemNativeHwDecoder: Bool? = nil,
        throttleDelaySeconds: Int? = nil,
        tonemappingAlgorithm: String? = nil,
        tonemappingDesat: Double? = nil,
        tonemappingParam: Double? = nil,
        tonemappingPeak: Double? = nil,
        tonemappingRange: String? = nil,
        tonemappingThreshold: Double? = nil,
        transcodingTempPath: String? = nil,
        vaapiDevice: String? = nil,
        vppTonemappingBrightness: Double? = nil,
        vppTonemappingContrast: Double? = nil
    ) {
        self.allowHevcEncoding = allowHevcEncoding
        self.allowOnDemandMetadataBasedKeyframeExtractionForExtensions = allowOnDemandMetadataBasedKeyframeExtractionForExtensions
        self.isDeinterlaceDoubleRate = isDeinterlaceDoubleRate
        self.deinterlaceMethod = deinterlaceMethod
        self.downMixAudioBoost = downMixAudioBoost
        self.enableDecodingColorDepth10Hevc = enableDecodingColorDepth10Hevc
        self.enableDecodingColorDepth10Vp9 = enableDecodingColorDepth10Vp9
        self.enableEnhancedNvdecDecoder = enableEnhancedNvdecDecoder
        self.enableFallbackFont = enableFallbackFont
        self.enableHardwareEncoding = enableHardwareEncoding
        self.enableIntelLowPowerH264HwEncoder = enableIntelLowPowerH264HwEncoder
        self.enableIntelLowPowerHevcHwEncoder = enableIntelLowPowerHevcHwEncoder
        self.enableSubtitleExtraction = enableSubtitleExtraction
        self.enableThrottling = enableThrottling
        self.enableTonemapping = enableTonemapping
        self.enableVppTonemapping = enableVppTonemapping
        self.encoderAppPath = encoderAppPath
        self.encoderAppPathDisplay = encoderAppPathDisplay
        self.encoderPreset = encoderPreset
        self.encodingThreadCount = encodingThreadCount
        self.fallbackFontPath = fallbackFontPath
        self.h264Crf = h264Crf
        self.h265Crf = h265Crf
        self.hardwareAccelerationType = hardwareAccelerationType
        self.hardwareDecodingCodecs = hardwareDecodingCodecs
        self.maxMuxingQueueSize = maxMuxingQueueSize
        self.isPreferSystemNativeHwDecoder = isPreferSystemNativeHwDecoder
        self.throttleDelaySeconds = throttleDelaySeconds
        self.tonemappingAlgorithm = tonemappingAlgorithm
        self.tonemappingDesat = tonemappingDesat
        self.tonemappingParam = tonemappingParam
        self.tonemappingPeak = tonemappingPeak
        self.tonemappingRange = tonemappingRange
        self.tonemappingThreshold = tonemappingThreshold
        self.transcodingTempPath = transcodingTempPath
        self.vaapiDevice = vaapiDevice
        self.vppTonemappingBrightness = vppTonemappingBrightness
        self.vppTonemappingContrast = vppTonemappingContrast
    }
}
