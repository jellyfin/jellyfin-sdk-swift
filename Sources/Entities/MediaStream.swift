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

    public init(aspectRatio: String? = nil, averageFrameRate: Float? = nil, bitDepth: Int32? = nil, bitRate: Int32? = nil, blPresentFlag: Int32? = nil, channelLayout: String? = nil, channels: Int32? = nil, codec: String? = nil, codecTag: String? = nil, codecTimeBase: String? = nil, colorPrimaries: String? = nil, colorRange: String? = nil, colorSpace: String? = nil, colorTransfer: String? = nil, comment: String? = nil, deliveryMethod: SubtitleDeliveryMethod? = nil, deliveryURL: String? = nil, displayTitle: String? = nil, dvBlSignalCompatibilityID: Int32? = nil, dvLevel: Int32? = nil, dvProfile: Int32? = nil, dvVersionMajor: Int32? = nil, dvVersionMinor: Int32? = nil, elPresentFlag: Int32? = nil, height: Int32? = nil, index: Int32? = nil, isAVC: Bool? = nil, isAnamorphic: Bool? = nil, isDefault: Bool? = nil, isExternal: Bool? = nil, isExternalURL: Bool? = nil, isForced: Bool? = nil, isInterlaced: Bool? = nil, isTextSubtitleStream: Bool? = nil, language: String? = nil, level: Double? = nil, localizedDefault: String? = nil, localizedExternal: String? = nil, localizedForced: String? = nil, localizedUndefined: String? = nil, nalLengthSize: String? = nil, packetLength: Int32? = nil, path: String? = nil, pixelFormat: String? = nil, profile: String? = nil, realFrameRate: Float? = nil, refFrames: Int32? = nil, rpuPresentFlag: Int32? = nil, sampleRate: Int32? = nil, score: Int32? = nil, isSupportsExternalStream: Bool? = nil, timeBase: String? = nil, title: String? = nil, type: MediaStreamType? = nil, videoDoViTitle: String? = nil, videoRange: String? = nil, videoRangeType: String? = nil, width: Int32? = nil) {
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
}
