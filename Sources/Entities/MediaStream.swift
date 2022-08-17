//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class MediaStream.
public struct MediaStream: Codable {
    /// Gets or sets the aspect ratio.
    public var aspectRatio: String?
    /// Gets or sets the average frame rate.
    public var averageFrameRate: Float?
    /// Gets or sets the bit depth.
    public var bitDepth: Int32?
    /// Gets or sets the bit rate.
    public var bitRate: Int32?
    /// Gets or sets the Dolby Vision bl present flag.
    public var blPresentFlag: Int32?
    /// Gets or sets the channel layout.
    public var channelLayout: String?
    /// Gets or sets the channels.
    public var channels: Int32?
    /// Gets or sets the codec.
    public var codec: String?
    /// Gets or sets the codec tag.
    public var codecTag: String?
    /// Gets or sets the codec time base.
    public var codecTimeBase: String?
    /// Gets or sets the color primaries.
    public var colorPrimaries: String?
    /// Gets or sets the color range.
    public var colorRange: String?
    /// Gets or sets the color space.
    public var colorSpace: String?
    /// Gets or sets the color transfer.
    public var colorTransfer: String?
    /// Gets or sets the comment.
    public var comment: String?
    /// Gets or sets the method.
    public var deliveryMethod: SubtitleDeliveryMethod?
    /// Gets or sets the delivery URL.
    public var deliveryURL: String?
    public var displayTitle: String?
    /// Gets or sets the Dolby Vision bl signal compatibility id.
    public var dvBlSignalCompatibilityID: Int32?
    /// Gets or sets the Dolby Vision level.
    public var dvLevel: Int32?
    /// Gets or sets the Dolby Vision profile.
    public var dvProfile: Int32?
    /// Gets or sets the Dolby Vision version major.
    public var dvVersionMajor: Int32?
    /// Gets or sets the Dolby Vision version minor.
    public var dvVersionMinor: Int32?
    /// Gets or sets the Dolby Vision el present flag.
    public var elPresentFlag: Int32?
    /// Gets or sets the height.
    public var height: Int32?
    /// Gets or sets the index.
    public var index: Int32?
    public var isAVC: Bool?
    /// Gets or sets whether this instance is anamorphic.
    public var isAnamorphic: Bool?
    /// Gets or sets a value indicating whether this instance is default.
    public var isDefault: Bool?
    /// Gets or sets a value indicating whether this instance is external.
    public var isExternal: Bool?
    /// Gets or sets a value indicating whether this instance is external URL.
    public var isExternalURL: Bool?
    /// Gets or sets a value indicating whether this instance is forced.
    public var isForced: Bool?
    /// Gets or sets a value indicating whether this instance is interlaced.
    public var isInterlaced: Bool?
    public var isTextSubtitleStream: Bool?
    /// Gets or sets the language.
    public var language: String?
    /// Gets or sets the level.
    public var level: Double?
    public var localizedDefault: String?
    public var localizedExternal: String?
    public var localizedForced: String?
    public var localizedUndefined: String?
    public var nalLengthSize: String?
    /// Gets or sets the length of the packet.
    public var packetLength: Int32?
    /// Gets or sets the filename.
    public var path: String?
    /// Gets or sets the pixel format.
    public var pixelFormat: String?
    /// Gets or sets the profile.
    public var profile: String?
    /// Gets or sets the real frame rate.
    public var realFrameRate: Float?
    /// Gets or sets the reference frames.
    public var refFrames: Int32?
    /// Gets or sets the Dolby Vision rpu present flag.
    public var rpuPresentFlag: Int32?
    /// Gets or sets the sample rate.
    public var sampleRate: Int32?
    /// Gets or sets the score.
    public var score: Int32?
    /// Gets or sets a value indicating whether [supports external stream].
    public var isSupportsExternalStream: Bool?
    /// Gets or sets the time base.
    public var timeBase: String?
    /// Gets or sets the title.
    public var title: String?
    /// Gets or sets the type.
    public var type: MediaStreamType?
    /// Gets the video dovi title.
    public var videoDoViTitle: String?
    /// Gets the video range.
    public var videoRange: String?
    /// Gets the video range type.
    public var videoRangeType: String?
    /// Gets or sets the width.
    public var width: Int32?

    public init(
        aspectRatio: String? = nil,
        averageFrameRate: Float? = nil,
        bitDepth: Int32? = nil,
        bitRate: Int32? = nil,
        blPresentFlag: Int32? = nil,
        channelLayout: String? = nil,
        channels: Int32? = nil,
        codec: String? = nil,
        codecTag: String? = nil,
        codecTimeBase: String? = nil,
        colorPrimaries: String? = nil,
        colorRange: String? = nil,
        colorSpace: String? = nil,
        colorTransfer: String? = nil,
        comment: String? = nil,
        deliveryMethod: SubtitleDeliveryMethod? = nil,
        deliveryURL: String? = nil,
        displayTitle: String? = nil,
        dvBlSignalCompatibilityID: Int32? = nil,
        dvLevel: Int32? = nil,
        dvProfile: Int32? = nil,
        dvVersionMajor: Int32? = nil,
        dvVersionMinor: Int32? = nil,
        elPresentFlag: Int32? = nil,
        height: Int32? = nil,
        index: Int32? = nil,
        isAVC: Bool? = nil,
        isAnamorphic: Bool? = nil,
        isDefault: Bool? = nil,
        isExternal: Bool? = nil,
        isExternalURL: Bool? = nil,
        isForced: Bool? = nil,
        isInterlaced: Bool? = nil,
        isTextSubtitleStream: Bool? = nil,
        language: String? = nil,
        level: Double? = nil,
        localizedDefault: String? = nil,
        localizedExternal: String? = nil,
        localizedForced: String? = nil,
        localizedUndefined: String? = nil,
        nalLengthSize: String? = nil,
        packetLength: Int32? = nil,
        path: String? = nil,
        pixelFormat: String? = nil,
        profile: String? = nil,
        realFrameRate: Float? = nil,
        refFrames: Int32? = nil,
        rpuPresentFlag: Int32? = nil,
        sampleRate: Int32? = nil,
        score: Int32? = nil,
        isSupportsExternalStream: Bool? = nil,
        timeBase: String? = nil,
        title: String? = nil,
        type: MediaStreamType? = nil,
        videoDoViTitle: String? = nil,
        videoRange: String? = nil,
        videoRangeType: String? = nil,
        width: Int32? = nil
    ) {
        self.aspectRatio = aspectRatio
        self.averageFrameRate = averageFrameRate
        self.bitDepth = bitDepth
        self.bitRate = bitRate
        self.blPresentFlag = blPresentFlag
        self.channelLayout = channelLayout
        self.channels = channels
        self.codec = codec
        self.codecTag = codecTag
        self.codecTimeBase = codecTimeBase
        self.colorPrimaries = colorPrimaries
        self.colorRange = colorRange
        self.colorSpace = colorSpace
        self.colorTransfer = colorTransfer
        self.comment = comment
        self.deliveryMethod = deliveryMethod
        self.deliveryURL = deliveryURL
        self.displayTitle = displayTitle
        self.dvBlSignalCompatibilityID = dvBlSignalCompatibilityID
        self.dvLevel = dvLevel
        self.dvProfile = dvProfile
        self.dvVersionMajor = dvVersionMajor
        self.dvVersionMinor = dvVersionMinor
        self.elPresentFlag = elPresentFlag
        self.height = height
        self.index = index
        self.isAVC = isAVC
        self.isAnamorphic = isAnamorphic
        self.isDefault = isDefault
        self.isExternal = isExternal
        self.isExternalURL = isExternalURL
        self.isForced = isForced
        self.isInterlaced = isInterlaced
        self.isTextSubtitleStream = isTextSubtitleStream
        self.language = language
        self.level = level
        self.localizedDefault = localizedDefault
        self.localizedExternal = localizedExternal
        self.localizedForced = localizedForced
        self.localizedUndefined = localizedUndefined
        self.nalLengthSize = nalLengthSize
        self.packetLength = packetLength
        self.path = path
        self.pixelFormat = pixelFormat
        self.profile = profile
        self.realFrameRate = realFrameRate
        self.refFrames = refFrames
        self.rpuPresentFlag = rpuPresentFlag
        self.sampleRate = sampleRate
        self.score = score
        self.isSupportsExternalStream = isSupportsExternalStream
        self.timeBase = timeBase
        self.title = title
        self.type = type
        self.videoDoViTitle = videoDoViTitle
        self.videoRange = videoRange
        self.videoRangeType = videoRangeType
        self.width = width
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.aspectRatio = try values.decodeIfPresent(String.self, forKey: "AspectRatio")
        self.averageFrameRate = try values.decodeIfPresent(Float.self, forKey: "AverageFrameRate")
        self.bitDepth = try values.decodeIfPresent(Int32.self, forKey: "BitDepth")
        self.bitRate = try values.decodeIfPresent(Int32.self, forKey: "BitRate")
        self.blPresentFlag = try values.decodeIfPresent(Int32.self, forKey: "BlPresentFlag")
        self.channelLayout = try values.decodeIfPresent(String.self, forKey: "ChannelLayout")
        self.channels = try values.decodeIfPresent(Int32.self, forKey: "Channels")
        self.codec = try values.decodeIfPresent(String.self, forKey: "Codec")
        self.codecTag = try values.decodeIfPresent(String.self, forKey: "CodecTag")
        self.codecTimeBase = try values.decodeIfPresent(String.self, forKey: "CodecTimeBase")
        self.colorPrimaries = try values.decodeIfPresent(String.self, forKey: "ColorPrimaries")
        self.colorRange = try values.decodeIfPresent(String.self, forKey: "ColorRange")
        self.colorSpace = try values.decodeIfPresent(String.self, forKey: "ColorSpace")
        self.colorTransfer = try values.decodeIfPresent(String.self, forKey: "ColorTransfer")
        self.comment = try values.decodeIfPresent(String.self, forKey: "Comment")
        self.deliveryMethod = try values.decodeIfPresent(SubtitleDeliveryMethod.self, forKey: "DeliveryMethod")
        self.deliveryURL = try values.decodeIfPresent(String.self, forKey: "DeliveryUrl")
        self.displayTitle = try values.decodeIfPresent(String.self, forKey: "DisplayTitle")
        self.dvBlSignalCompatibilityID = try values.decodeIfPresent(Int32.self, forKey: "DvBlSignalCompatibilityId")
        self.dvLevel = try values.decodeIfPresent(Int32.self, forKey: "DvLevel")
        self.dvProfile = try values.decodeIfPresent(Int32.self, forKey: "DvProfile")
        self.dvVersionMajor = try values.decodeIfPresent(Int32.self, forKey: "DvVersionMajor")
        self.dvVersionMinor = try values.decodeIfPresent(Int32.self, forKey: "DvVersionMinor")
        self.elPresentFlag = try values.decodeIfPresent(Int32.self, forKey: "ElPresentFlag")
        self.height = try values.decodeIfPresent(Int32.self, forKey: "Height")
        self.index = try values.decodeIfPresent(Int32.self, forKey: "Index")
        self.isAVC = try values.decodeIfPresent(Bool.self, forKey: "IsAVC")
        self.isAnamorphic = try values.decodeIfPresent(Bool.self, forKey: "IsAnamorphic")
        self.isDefault = try values.decodeIfPresent(Bool.self, forKey: "IsDefault")
        self.isExternal = try values.decodeIfPresent(Bool.self, forKey: "IsExternal")
        self.isExternalURL = try values.decodeIfPresent(Bool.self, forKey: "IsExternalUrl")
        self.isForced = try values.decodeIfPresent(Bool.self, forKey: "IsForced")
        self.isInterlaced = try values.decodeIfPresent(Bool.self, forKey: "IsInterlaced")
        self.isTextSubtitleStream = try values.decodeIfPresent(Bool.self, forKey: "IsTextSubtitleStream")
        self.language = try values.decodeIfPresent(String.self, forKey: "Language")
        self.level = try values.decodeIfPresent(Double.self, forKey: "Level")
        self.localizedDefault = try values.decodeIfPresent(String.self, forKey: "LocalizedDefault")
        self.localizedExternal = try values.decodeIfPresent(String.self, forKey: "LocalizedExternal")
        self.localizedForced = try values.decodeIfPresent(String.self, forKey: "LocalizedForced")
        self.localizedUndefined = try values.decodeIfPresent(String.self, forKey: "LocalizedUndefined")
        self.nalLengthSize = try values.decodeIfPresent(String.self, forKey: "NalLengthSize")
        self.packetLength = try values.decodeIfPresent(Int32.self, forKey: "PacketLength")
        self.path = try values.decodeIfPresent(String.self, forKey: "Path")
        self.pixelFormat = try values.decodeIfPresent(String.self, forKey: "PixelFormat")
        self.profile = try values.decodeIfPresent(String.self, forKey: "Profile")
        self.realFrameRate = try values.decodeIfPresent(Float.self, forKey: "RealFrameRate")
        self.refFrames = try values.decodeIfPresent(Int32.self, forKey: "RefFrames")
        self.rpuPresentFlag = try values.decodeIfPresent(Int32.self, forKey: "RpuPresentFlag")
        self.sampleRate = try values.decodeIfPresent(Int32.self, forKey: "SampleRate")
        self.score = try values.decodeIfPresent(Int32.self, forKey: "Score")
        self.isSupportsExternalStream = try values.decodeIfPresent(Bool.self, forKey: "SupportsExternalStream")
        self.timeBase = try values.decodeIfPresent(String.self, forKey: "TimeBase")
        self.title = try values.decodeIfPresent(String.self, forKey: "Title")
        self.type = try values.decodeIfPresent(MediaStreamType.self, forKey: "Type")
        self.videoDoViTitle = try values.decodeIfPresent(String.self, forKey: "VideoDoViTitle")
        self.videoRange = try values.decodeIfPresent(String.self, forKey: "VideoRange")
        self.videoRangeType = try values.decodeIfPresent(String.self, forKey: "VideoRangeType")
        self.width = try values.decodeIfPresent(Int32.self, forKey: "Width")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(aspectRatio, forKey: "AspectRatio")
        try values.encodeIfPresent(averageFrameRate, forKey: "AverageFrameRate")
        try values.encodeIfPresent(bitDepth, forKey: "BitDepth")
        try values.encodeIfPresent(bitRate, forKey: "BitRate")
        try values.encodeIfPresent(blPresentFlag, forKey: "BlPresentFlag")
        try values.encodeIfPresent(channelLayout, forKey: "ChannelLayout")
        try values.encodeIfPresent(channels, forKey: "Channels")
        try values.encodeIfPresent(codec, forKey: "Codec")
        try values.encodeIfPresent(codecTag, forKey: "CodecTag")
        try values.encodeIfPresent(codecTimeBase, forKey: "CodecTimeBase")
        try values.encodeIfPresent(colorPrimaries, forKey: "ColorPrimaries")
        try values.encodeIfPresent(colorRange, forKey: "ColorRange")
        try values.encodeIfPresent(colorSpace, forKey: "ColorSpace")
        try values.encodeIfPresent(colorTransfer, forKey: "ColorTransfer")
        try values.encodeIfPresent(comment, forKey: "Comment")
        try values.encodeIfPresent(deliveryMethod, forKey: "DeliveryMethod")
        try values.encodeIfPresent(deliveryURL, forKey: "DeliveryUrl")
        try values.encodeIfPresent(displayTitle, forKey: "DisplayTitle")
        try values.encodeIfPresent(dvBlSignalCompatibilityID, forKey: "DvBlSignalCompatibilityId")
        try values.encodeIfPresent(dvLevel, forKey: "DvLevel")
        try values.encodeIfPresent(dvProfile, forKey: "DvProfile")
        try values.encodeIfPresent(dvVersionMajor, forKey: "DvVersionMajor")
        try values.encodeIfPresent(dvVersionMinor, forKey: "DvVersionMinor")
        try values.encodeIfPresent(elPresentFlag, forKey: "ElPresentFlag")
        try values.encodeIfPresent(height, forKey: "Height")
        try values.encodeIfPresent(index, forKey: "Index")
        try values.encodeIfPresent(isAVC, forKey: "IsAVC")
        try values.encodeIfPresent(isAnamorphic, forKey: "IsAnamorphic")
        try values.encodeIfPresent(isDefault, forKey: "IsDefault")
        try values.encodeIfPresent(isExternal, forKey: "IsExternal")
        try values.encodeIfPresent(isExternalURL, forKey: "IsExternalUrl")
        try values.encodeIfPresent(isForced, forKey: "IsForced")
        try values.encodeIfPresent(isInterlaced, forKey: "IsInterlaced")
        try values.encodeIfPresent(isTextSubtitleStream, forKey: "IsTextSubtitleStream")
        try values.encodeIfPresent(language, forKey: "Language")
        try values.encodeIfPresent(level, forKey: "Level")
        try values.encodeIfPresent(localizedDefault, forKey: "LocalizedDefault")
        try values.encodeIfPresent(localizedExternal, forKey: "LocalizedExternal")
        try values.encodeIfPresent(localizedForced, forKey: "LocalizedForced")
        try values.encodeIfPresent(localizedUndefined, forKey: "LocalizedUndefined")
        try values.encodeIfPresent(nalLengthSize, forKey: "NalLengthSize")
        try values.encodeIfPresent(packetLength, forKey: "PacketLength")
        try values.encodeIfPresent(path, forKey: "Path")
        try values.encodeIfPresent(pixelFormat, forKey: "PixelFormat")
        try values.encodeIfPresent(profile, forKey: "Profile")
        try values.encodeIfPresent(realFrameRate, forKey: "RealFrameRate")
        try values.encodeIfPresent(refFrames, forKey: "RefFrames")
        try values.encodeIfPresent(rpuPresentFlag, forKey: "RpuPresentFlag")
        try values.encodeIfPresent(sampleRate, forKey: "SampleRate")
        try values.encodeIfPresent(score, forKey: "Score")
        try values.encodeIfPresent(isSupportsExternalStream, forKey: "SupportsExternalStream")
        try values.encodeIfPresent(timeBase, forKey: "TimeBase")
        try values.encodeIfPresent(title, forKey: "Title")
        try values.encodeIfPresent(type, forKey: "Type")
        try values.encodeIfPresent(videoDoViTitle, forKey: "VideoDoViTitle")
        try values.encodeIfPresent(videoRange, forKey: "VideoRange")
        try values.encodeIfPresent(videoRangeType, forKey: "VideoRangeType")
        try values.encodeIfPresent(width, forKey: "Width")
    }
}
