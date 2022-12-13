//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct EncodingOptions: Codable, Hashable {
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

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.allowHevcEncoding = try values.decodeIfPresent(Bool.self, forKey: "AllowHevcEncoding")
        self.allowOnDemandMetadataBasedKeyframeExtractionForExtensions = try values.decodeIfPresent(
            [String].self,
            forKey: "AllowOnDemandMetadataBasedKeyframeExtractionForExtensions"
        )
        self.isDeinterlaceDoubleRate = try values.decodeIfPresent(Bool.self, forKey: "DeinterlaceDoubleRate")
        self.deinterlaceMethod = try values.decodeIfPresent(String.self, forKey: "DeinterlaceMethod")
        self.downMixAudioBoost = try values.decodeIfPresent(Double.self, forKey: "DownMixAudioBoost")
        self.enableDecodingColorDepth10Hevc = try values.decodeIfPresent(Bool.self, forKey: "EnableDecodingColorDepth10Hevc")
        self.enableDecodingColorDepth10Vp9 = try values.decodeIfPresent(Bool.self, forKey: "EnableDecodingColorDepth10Vp9")
        self.enableEnhancedNvdecDecoder = try values.decodeIfPresent(Bool.self, forKey: "EnableEnhancedNvdecDecoder")
        self.enableFallbackFont = try values.decodeIfPresent(Bool.self, forKey: "EnableFallbackFont")
        self.enableHardwareEncoding = try values.decodeIfPresent(Bool.self, forKey: "EnableHardwareEncoding")
        self.enableIntelLowPowerH264HwEncoder = try values.decodeIfPresent(Bool.self, forKey: "EnableIntelLowPowerH264HwEncoder")
        self.enableIntelLowPowerHevcHwEncoder = try values.decodeIfPresent(Bool.self, forKey: "EnableIntelLowPowerHevcHwEncoder")
        self.enableSubtitleExtraction = try values.decodeIfPresent(Bool.self, forKey: "EnableSubtitleExtraction")
        self.enableThrottling = try values.decodeIfPresent(Bool.self, forKey: "EnableThrottling")
        self.enableTonemapping = try values.decodeIfPresent(Bool.self, forKey: "EnableTonemapping")
        self.enableVppTonemapping = try values.decodeIfPresent(Bool.self, forKey: "EnableVppTonemapping")
        self.encoderAppPath = try values.decodeIfPresent(String.self, forKey: "EncoderAppPath")
        self.encoderAppPathDisplay = try values.decodeIfPresent(String.self, forKey: "EncoderAppPathDisplay")
        self.encoderPreset = try values.decodeIfPresent(String.self, forKey: "EncoderPreset")
        self.encodingThreadCount = try values.decodeIfPresent(Int.self, forKey: "EncodingThreadCount")
        self.fallbackFontPath = try values.decodeIfPresent(String.self, forKey: "FallbackFontPath")
        self.h264Crf = try values.decodeIfPresent(Int.self, forKey: "H264Crf")
        self.h265Crf = try values.decodeIfPresent(Int.self, forKey: "H265Crf")
        self.hardwareAccelerationType = try values.decodeIfPresent(String.self, forKey: "HardwareAccelerationType")
        self.hardwareDecodingCodecs = try values.decodeIfPresent([String].self, forKey: "HardwareDecodingCodecs")
        self.maxMuxingQueueSize = try values.decodeIfPresent(Int.self, forKey: "MaxMuxingQueueSize")
        self.isPreferSystemNativeHwDecoder = try values.decodeIfPresent(Bool.self, forKey: "PreferSystemNativeHwDecoder")
        self.throttleDelaySeconds = try values.decodeIfPresent(Int.self, forKey: "ThrottleDelaySeconds")
        self.tonemappingAlgorithm = try values.decodeIfPresent(String.self, forKey: "TonemappingAlgorithm")
        self.tonemappingDesat = try values.decodeIfPresent(Double.self, forKey: "TonemappingDesat")
        self.tonemappingParam = try values.decodeIfPresent(Double.self, forKey: "TonemappingParam")
        self.tonemappingPeak = try values.decodeIfPresent(Double.self, forKey: "TonemappingPeak")
        self.tonemappingRange = try values.decodeIfPresent(String.self, forKey: "TonemappingRange")
        self.tonemappingThreshold = try values.decodeIfPresent(Double.self, forKey: "TonemappingThreshold")
        self.transcodingTempPath = try values.decodeIfPresent(String.self, forKey: "TranscodingTempPath")
        self.vaapiDevice = try values.decodeIfPresent(String.self, forKey: "VaapiDevice")
        self.vppTonemappingBrightness = try values.decodeIfPresent(Double.self, forKey: "VppTonemappingBrightness")
        self.vppTonemappingContrast = try values.decodeIfPresent(Double.self, forKey: "VppTonemappingContrast")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(allowHevcEncoding, forKey: "AllowHevcEncoding")
        try values.encodeIfPresent(
            allowOnDemandMetadataBasedKeyframeExtractionForExtensions,
            forKey: "AllowOnDemandMetadataBasedKeyframeExtractionForExtensions"
        )
        try values.encodeIfPresent(isDeinterlaceDoubleRate, forKey: "DeinterlaceDoubleRate")
        try values.encodeIfPresent(deinterlaceMethod, forKey: "DeinterlaceMethod")
        try values.encodeIfPresent(downMixAudioBoost, forKey: "DownMixAudioBoost")
        try values.encodeIfPresent(enableDecodingColorDepth10Hevc, forKey: "EnableDecodingColorDepth10Hevc")
        try values.encodeIfPresent(enableDecodingColorDepth10Vp9, forKey: "EnableDecodingColorDepth10Vp9")
        try values.encodeIfPresent(enableEnhancedNvdecDecoder, forKey: "EnableEnhancedNvdecDecoder")
        try values.encodeIfPresent(enableFallbackFont, forKey: "EnableFallbackFont")
        try values.encodeIfPresent(enableHardwareEncoding, forKey: "EnableHardwareEncoding")
        try values.encodeIfPresent(enableIntelLowPowerH264HwEncoder, forKey: "EnableIntelLowPowerH264HwEncoder")
        try values.encodeIfPresent(enableIntelLowPowerHevcHwEncoder, forKey: "EnableIntelLowPowerHevcHwEncoder")
        try values.encodeIfPresent(enableSubtitleExtraction, forKey: "EnableSubtitleExtraction")
        try values.encodeIfPresent(enableThrottling, forKey: "EnableThrottling")
        try values.encodeIfPresent(enableTonemapping, forKey: "EnableTonemapping")
        try values.encodeIfPresent(enableVppTonemapping, forKey: "EnableVppTonemapping")
        try values.encodeIfPresent(encoderAppPath, forKey: "EncoderAppPath")
        try values.encodeIfPresent(encoderAppPathDisplay, forKey: "EncoderAppPathDisplay")
        try values.encodeIfPresent(encoderPreset, forKey: "EncoderPreset")
        try values.encodeIfPresent(encodingThreadCount, forKey: "EncodingThreadCount")
        try values.encodeIfPresent(fallbackFontPath, forKey: "FallbackFontPath")
        try values.encodeIfPresent(h264Crf, forKey: "H264Crf")
        try values.encodeIfPresent(h265Crf, forKey: "H265Crf")
        try values.encodeIfPresent(hardwareAccelerationType, forKey: "HardwareAccelerationType")
        try values.encodeIfPresent(hardwareDecodingCodecs, forKey: "HardwareDecodingCodecs")
        try values.encodeIfPresent(maxMuxingQueueSize, forKey: "MaxMuxingQueueSize")
        try values.encodeIfPresent(isPreferSystemNativeHwDecoder, forKey: "PreferSystemNativeHwDecoder")
        try values.encodeIfPresent(throttleDelaySeconds, forKey: "ThrottleDelaySeconds")
        try values.encodeIfPresent(tonemappingAlgorithm, forKey: "TonemappingAlgorithm")
        try values.encodeIfPresent(tonemappingDesat, forKey: "TonemappingDesat")
        try values.encodeIfPresent(tonemappingParam, forKey: "TonemappingParam")
        try values.encodeIfPresent(tonemappingPeak, forKey: "TonemappingPeak")
        try values.encodeIfPresent(tonemappingRange, forKey: "TonemappingRange")
        try values.encodeIfPresent(tonemappingThreshold, forKey: "TonemappingThreshold")
        try values.encodeIfPresent(transcodingTempPath, forKey: "TranscodingTempPath")
        try values.encodeIfPresent(vaapiDevice, forKey: "VaapiDevice")
        try values.encodeIfPresent(vppTonemappingBrightness, forKey: "VppTonemappingBrightness")
        try values.encodeIfPresent(vppTonemappingContrast, forKey: "VppTonemappingContrast")
    }
}
