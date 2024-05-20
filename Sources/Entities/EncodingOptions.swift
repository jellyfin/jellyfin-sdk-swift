//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2024 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class EncodingOptions.
public struct EncodingOptions: Codable, Hashable {
    /// Gets or sets a value indicating whether AV1 encoding is enabled.
    public var allowAv1Encoding: Bool?
    /// Gets or sets a value indicating whether HEVC encoding is enabled.
    public var allowHevcEncoding: Bool?
    /// Gets or sets the file extensions on-demand metadata based keyframe extraction is enabled for.
    public var allowOnDemandMetadataBasedKeyframeExtractionForExtensions: [String]?
    /// Gets or sets a value indicating whether the framerate is doubled when deinterlacing.
    public var isDeinterlaceDoubleRate: Bool?
    /// Gets or sets the deinterlace method.
    public var deinterlaceMethod: String?
    /// Gets or sets the audio boost applied when downmixing audio.
    public var downMixAudioBoost: Double?
    /// Gets or sets the algorithm used for downmixing audio to stereo.
    public var downMixStereoAlgorithm: DownMixStereoAlgorithms?
    /// Gets or sets a value indicating whether audio VBR is enabled.
    public var enableAudioVbr: Bool?
    /// Gets or sets a value indicating whether 10bit HEVC decoding is enabled.
    public var enableDecodingColorDepth10Hevc: Bool?
    /// Gets or sets a value indicating whether 10bit VP9 decoding is enabled.
    public var enableDecodingColorDepth10Vp9: Bool?
    /// Gets or sets a value indicating whether the enhanced NVDEC is enabled.
    public var enableEnhancedNvdecDecoder: Bool?
    /// Gets or sets a value indicating whether to use the fallback font.
    public var enableFallbackFont: Bool?
    /// Gets or sets a value indicating whether hardware encoding is enabled.
    public var enableHardwareEncoding: Bool?
    /// Gets or sets a value indicating whether the Intel H264 low-power hardware encoder should be used.
    public var enableIntelLowPowerH264HwEncoder: Bool?
    /// Gets or sets a value indicating whether the Intel HEVC low-power hardware encoder should be used.
    public var enableIntelLowPowerHevcHwEncoder: Bool?
    /// Gets or sets a value indicating whether segment deletion is enabled.
    public var enableSegmentDeletion: Bool?
    /// Gets or sets a value indicating whether subtitle extraction is enabled.
    public var enableSubtitleExtraction: Bool?
    /// Gets or sets a value indicating whether throttling is enabled.
    public var enableThrottling: Bool?
    /// Gets or sets a value indicating whether tonemapping is enabled.
    public var enableTonemapping: Bool?
    /// Gets or sets a value indicating whether videotoolbox tonemapping is enabled.
    public var enableVideoToolboxTonemapping: Bool?
    /// Gets or sets a value indicating whether VPP tonemapping is enabled.
    public var enableVppTonemapping: Bool?
    /// Gets or sets the FFmpeg path as set by the user via the UI.
    public var encoderAppPath: String?
    /// Gets or sets the current FFmpeg path being used by the system and displayed on the transcode page.
    public var encoderAppPathDisplay: String?
    /// Gets or sets the encoder preset.
    public var encoderPreset: String?
    /// Gets or sets the thread count used for encoding.
    public var encodingThreadCount: Int?
    /// Gets or sets the path to the fallback font.
    public var fallbackFontPath: String?
    /// Gets or sets the H264 CRF.
    public var h264Crf: Int?
    /// Gets or sets the H265 CRF.
    public var h265Crf: Int?
    /// Gets or sets the hardware acceleration type.
    public var hardwareAccelerationType: String?
    /// Gets or sets the codecs hardware encoding is used for.
    public var hardwareDecodingCodecs: [String]?
    /// Gets or sets the maximum size of the muxing queue.
    public var maxMuxingQueueSize: Int?
    /// Gets or sets a value indicating whether the system native hardware decoder should be used.
    public var isPreferSystemNativeHwDecoder: Bool?
    /// Gets or sets seconds for which segments should be kept before being deleted.
    public var segmentKeepSeconds: Int?
    /// Gets or sets the delay after which throttling happens.
    public var throttleDelaySeconds: Int?
    /// Gets or sets the tone-mapping algorithm.
    public var tonemappingAlgorithm: String?
    /// Gets or sets the tone-mapping desaturation.
    public var tonemappingDesat: Double?
    /// Gets or sets the tone-mapping mode.
    public var tonemappingMode: String?
    /// Gets or sets the tone-mapping parameters.
    public var tonemappingParam: Double?
    /// Gets or sets the tone-mapping peak.
    public var tonemappingPeak: Double?
    /// Gets or sets the tone-mapping range.
    public var tonemappingRange: String?
    /// Gets or sets the temporary transcoding path.
    public var transcodingTempPath: String?
    /// Gets or sets the VA-API device.
    public var vaapiDevice: String?
    /// Gets or sets the VPP tone-mapping brightness.
    public var vppTonemappingBrightness: Double?
    /// Gets or sets the VPP tone-mapping contrast.
    public var vppTonemappingContrast: Double?

    public init(
        allowAv1Encoding: Bool? = nil,
        allowHevcEncoding: Bool? = nil,
        allowOnDemandMetadataBasedKeyframeExtractionForExtensions: [String]? = nil,
        isDeinterlaceDoubleRate: Bool? = nil,
        deinterlaceMethod: String? = nil,
        downMixAudioBoost: Double? = nil,
        downMixStereoAlgorithm: DownMixStereoAlgorithms? = nil,
        enableAudioVbr: Bool? = nil,
        enableDecodingColorDepth10Hevc: Bool? = nil,
        enableDecodingColorDepth10Vp9: Bool? = nil,
        enableEnhancedNvdecDecoder: Bool? = nil,
        enableFallbackFont: Bool? = nil,
        enableHardwareEncoding: Bool? = nil,
        enableIntelLowPowerH264HwEncoder: Bool? = nil,
        enableIntelLowPowerHevcHwEncoder: Bool? = nil,
        enableSegmentDeletion: Bool? = nil,
        enableSubtitleExtraction: Bool? = nil,
        enableThrottling: Bool? = nil,
        enableTonemapping: Bool? = nil,
        enableVideoToolboxTonemapping: Bool? = nil,
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
        segmentKeepSeconds: Int? = nil,
        throttleDelaySeconds: Int? = nil,
        tonemappingAlgorithm: String? = nil,
        tonemappingDesat: Double? = nil,
        tonemappingMode: String? = nil,
        tonemappingParam: Double? = nil,
        tonemappingPeak: Double? = nil,
        tonemappingRange: String? = nil,
        transcodingTempPath: String? = nil,
        vaapiDevice: String? = nil,
        vppTonemappingBrightness: Double? = nil,
        vppTonemappingContrast: Double? = nil
    ) {
        self.allowAv1Encoding = allowAv1Encoding
        self.allowHevcEncoding = allowHevcEncoding
        self.allowOnDemandMetadataBasedKeyframeExtractionForExtensions = allowOnDemandMetadataBasedKeyframeExtractionForExtensions
        self.isDeinterlaceDoubleRate = isDeinterlaceDoubleRate
        self.deinterlaceMethod = deinterlaceMethod
        self.downMixAudioBoost = downMixAudioBoost
        self.downMixStereoAlgorithm = downMixStereoAlgorithm
        self.enableAudioVbr = enableAudioVbr
        self.enableDecodingColorDepth10Hevc = enableDecodingColorDepth10Hevc
        self.enableDecodingColorDepth10Vp9 = enableDecodingColorDepth10Vp9
        self.enableEnhancedNvdecDecoder = enableEnhancedNvdecDecoder
        self.enableFallbackFont = enableFallbackFont
        self.enableHardwareEncoding = enableHardwareEncoding
        self.enableIntelLowPowerH264HwEncoder = enableIntelLowPowerH264HwEncoder
        self.enableIntelLowPowerHevcHwEncoder = enableIntelLowPowerHevcHwEncoder
        self.enableSegmentDeletion = enableSegmentDeletion
        self.enableSubtitleExtraction = enableSubtitleExtraction
        self.enableThrottling = enableThrottling
        self.enableTonemapping = enableTonemapping
        self.enableVideoToolboxTonemapping = enableVideoToolboxTonemapping
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
        self.segmentKeepSeconds = segmentKeepSeconds
        self.throttleDelaySeconds = throttleDelaySeconds
        self.tonemappingAlgorithm = tonemappingAlgorithm
        self.tonemappingDesat = tonemappingDesat
        self.tonemappingMode = tonemappingMode
        self.tonemappingParam = tonemappingParam
        self.tonemappingPeak = tonemappingPeak
        self.tonemappingRange = tonemappingRange
        self.transcodingTempPath = transcodingTempPath
        self.vaapiDevice = vaapiDevice
        self.vppTonemappingBrightness = vppTonemappingBrightness
        self.vppTonemappingContrast = vppTonemappingContrast
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.allowAv1Encoding = try values.decodeIfPresent(Bool.self, forKey: "AllowAv1Encoding")
        self.allowHevcEncoding = try values.decodeIfPresent(Bool.self, forKey: "AllowHevcEncoding")
        self.allowOnDemandMetadataBasedKeyframeExtractionForExtensions = try values.decodeIfPresent(
            [String].self,
            forKey: "AllowOnDemandMetadataBasedKeyframeExtractionForExtensions"
        )
        self.isDeinterlaceDoubleRate = try values.decodeIfPresent(Bool.self, forKey: "DeinterlaceDoubleRate")
        self.deinterlaceMethod = try values.decodeIfPresent(String.self, forKey: "DeinterlaceMethod")
        self.downMixAudioBoost = try values.decodeIfPresent(Double.self, forKey: "DownMixAudioBoost")
        self.downMixStereoAlgorithm = try values.decodeIfPresent(DownMixStereoAlgorithms.self, forKey: "DownMixStereoAlgorithm")
        self.enableAudioVbr = try values.decodeIfPresent(Bool.self, forKey: "EnableAudioVbr")
        self.enableDecodingColorDepth10Hevc = try values.decodeIfPresent(Bool.self, forKey: "EnableDecodingColorDepth10Hevc")
        self.enableDecodingColorDepth10Vp9 = try values.decodeIfPresent(Bool.self, forKey: "EnableDecodingColorDepth10Vp9")
        self.enableEnhancedNvdecDecoder = try values.decodeIfPresent(Bool.self, forKey: "EnableEnhancedNvdecDecoder")
        self.enableFallbackFont = try values.decodeIfPresent(Bool.self, forKey: "EnableFallbackFont")
        self.enableHardwareEncoding = try values.decodeIfPresent(Bool.self, forKey: "EnableHardwareEncoding")
        self.enableIntelLowPowerH264HwEncoder = try values.decodeIfPresent(Bool.self, forKey: "EnableIntelLowPowerH264HwEncoder")
        self.enableIntelLowPowerHevcHwEncoder = try values.decodeIfPresent(Bool.self, forKey: "EnableIntelLowPowerHevcHwEncoder")
        self.enableSegmentDeletion = try values.decodeIfPresent(Bool.self, forKey: "EnableSegmentDeletion")
        self.enableSubtitleExtraction = try values.decodeIfPresent(Bool.self, forKey: "EnableSubtitleExtraction")
        self.enableThrottling = try values.decodeIfPresent(Bool.self, forKey: "EnableThrottling")
        self.enableTonemapping = try values.decodeIfPresent(Bool.self, forKey: "EnableTonemapping")
        self.enableVideoToolboxTonemapping = try values.decodeIfPresent(Bool.self, forKey: "EnableVideoToolboxTonemapping")
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
        self.segmentKeepSeconds = try values.decodeIfPresent(Int.self, forKey: "SegmentKeepSeconds")
        self.throttleDelaySeconds = try values.decodeIfPresent(Int.self, forKey: "ThrottleDelaySeconds")
        self.tonemappingAlgorithm = try values.decodeIfPresent(String.self, forKey: "TonemappingAlgorithm")
        self.tonemappingDesat = try values.decodeIfPresent(Double.self, forKey: "TonemappingDesat")
        self.tonemappingMode = try values.decodeIfPresent(String.self, forKey: "TonemappingMode")
        self.tonemappingParam = try values.decodeIfPresent(Double.self, forKey: "TonemappingParam")
        self.tonemappingPeak = try values.decodeIfPresent(Double.self, forKey: "TonemappingPeak")
        self.tonemappingRange = try values.decodeIfPresent(String.self, forKey: "TonemappingRange")
        self.transcodingTempPath = try values.decodeIfPresent(String.self, forKey: "TranscodingTempPath")
        self.vaapiDevice = try values.decodeIfPresent(String.self, forKey: "VaapiDevice")
        self.vppTonemappingBrightness = try values.decodeIfPresent(Double.self, forKey: "VppTonemappingBrightness")
        self.vppTonemappingContrast = try values.decodeIfPresent(Double.self, forKey: "VppTonemappingContrast")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(allowAv1Encoding, forKey: "AllowAv1Encoding")
        try values.encodeIfPresent(allowHevcEncoding, forKey: "AllowHevcEncoding")
        try values.encodeIfPresent(
            allowOnDemandMetadataBasedKeyframeExtractionForExtensions,
            forKey: "AllowOnDemandMetadataBasedKeyframeExtractionForExtensions"
        )
        try values.encodeIfPresent(isDeinterlaceDoubleRate, forKey: "DeinterlaceDoubleRate")
        try values.encodeIfPresent(deinterlaceMethod, forKey: "DeinterlaceMethod")
        try values.encodeIfPresent(downMixAudioBoost, forKey: "DownMixAudioBoost")
        try values.encodeIfPresent(downMixStereoAlgorithm, forKey: "DownMixStereoAlgorithm")
        try values.encodeIfPresent(enableAudioVbr, forKey: "EnableAudioVbr")
        try values.encodeIfPresent(enableDecodingColorDepth10Hevc, forKey: "EnableDecodingColorDepth10Hevc")
        try values.encodeIfPresent(enableDecodingColorDepth10Vp9, forKey: "EnableDecodingColorDepth10Vp9")
        try values.encodeIfPresent(enableEnhancedNvdecDecoder, forKey: "EnableEnhancedNvdecDecoder")
        try values.encodeIfPresent(enableFallbackFont, forKey: "EnableFallbackFont")
        try values.encodeIfPresent(enableHardwareEncoding, forKey: "EnableHardwareEncoding")
        try values.encodeIfPresent(enableIntelLowPowerH264HwEncoder, forKey: "EnableIntelLowPowerH264HwEncoder")
        try values.encodeIfPresent(enableIntelLowPowerHevcHwEncoder, forKey: "EnableIntelLowPowerHevcHwEncoder")
        try values.encodeIfPresent(enableSegmentDeletion, forKey: "EnableSegmentDeletion")
        try values.encodeIfPresent(enableSubtitleExtraction, forKey: "EnableSubtitleExtraction")
        try values.encodeIfPresent(enableThrottling, forKey: "EnableThrottling")
        try values.encodeIfPresent(enableTonemapping, forKey: "EnableTonemapping")
        try values.encodeIfPresent(enableVideoToolboxTonemapping, forKey: "EnableVideoToolboxTonemapping")
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
        try values.encodeIfPresent(segmentKeepSeconds, forKey: "SegmentKeepSeconds")
        try values.encodeIfPresent(throttleDelaySeconds, forKey: "ThrottleDelaySeconds")
        try values.encodeIfPresent(tonemappingAlgorithm, forKey: "TonemappingAlgorithm")
        try values.encodeIfPresent(tonemappingDesat, forKey: "TonemappingDesat")
        try values.encodeIfPresent(tonemappingMode, forKey: "TonemappingMode")
        try values.encodeIfPresent(tonemappingParam, forKey: "TonemappingParam")
        try values.encodeIfPresent(tonemappingPeak, forKey: "TonemappingPeak")
        try values.encodeIfPresent(tonemappingRange, forKey: "TonemappingRange")
        try values.encodeIfPresent(transcodingTempPath, forKey: "TranscodingTempPath")
        try values.encodeIfPresent(vaapiDevice, forKey: "VaapiDevice")
        try values.encodeIfPresent(vppTonemappingBrightness, forKey: "VppTonemappingBrightness")
        try values.encodeIfPresent(vppTonemappingContrast, forKey: "VppTonemappingContrast")
    }
}
