//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2024 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct MediaSourceInfo: Codable, Hashable, Identifiable {
    public var analyzeDurationMs: Int?
    public var bitrate: Int?
    public var bufferMs: Int?
    public var container: String?
    public var defaultAudioStreamIndex: Int?
    public var defaultSubtitleStreamIndex: Int?
    public var eTag: String?
    public var encoderPath: String?
    public var encoderProtocol: MediaProtocol?
    public var formats: [String]?
    public var isGenPtsInput: Bool?
    public var id: String?
    public var isIgnoreDts: Bool?
    public var isIgnoreIndex: Bool?
    public var isInfiniteStream: Bool?
    /// Gets or sets a value indicating whether the media is remote.
    ///
    /// Differentiate internet url vs local network.
    public var isRemote: Bool?
    public var isoType: IsoType?
    public var liveStreamID: String?
    public var mediaAttachments: [MediaAttachment]?
    public var mediaStreams: [MediaStream]?
    public var name: String?
    public var openToken: String?
    public var path: String?
    public var `protocol`: MediaProtocol?
    public var isReadAtNativeFramerate: Bool?
    public var requiredHTTPHeaders: [String: String]?
    public var requiresClosing: Bool?
    public var requiresLooping: Bool?
    public var requiresOpening: Bool?
    public var runTimeTicks: Int?
    public var size: Int?
    public var isSupportsDirectPlay: Bool?
    public var isSupportsDirectStream: Bool?
    public var isSupportsProbing: Bool?
    public var isSupportsTranscoding: Bool?
    public var timestamp: TransportStreamTimestamp?
    public var transcodingContainer: String?
    public var transcodingSubProtocol: String?
    public var transcodingURL: String?
    public var type: MediaSourceType?
    public var video3DFormat: Video3DFormat?
    public var videoType: VideoType?

    public init(
        analyzeDurationMs: Int? = nil,
        bitrate: Int? = nil,
        bufferMs: Int? = nil,
        container: String? = nil,
        defaultAudioStreamIndex: Int? = nil,
        defaultSubtitleStreamIndex: Int? = nil,
        eTag: String? = nil,
        encoderPath: String? = nil,
        encoderProtocol: MediaProtocol? = nil,
        formats: [String]? = nil,
        isGenPtsInput: Bool? = nil,
        id: String? = nil,
        isIgnoreDts: Bool? = nil,
        isIgnoreIndex: Bool? = nil,
        isInfiniteStream: Bool? = nil,
        isRemote: Bool? = nil,
        isoType: IsoType? = nil,
        liveStreamID: String? = nil,
        mediaAttachments: [MediaAttachment]? = nil,
        mediaStreams: [MediaStream]? = nil,
        name: String? = nil,
        openToken: String? = nil,
        path: String? = nil,
        protocol: MediaProtocol? = nil,
        isReadAtNativeFramerate: Bool? = nil,
        requiredHTTPHeaders: [String: String]? = nil,
        requiresClosing: Bool? = nil,
        requiresLooping: Bool? = nil,
        requiresOpening: Bool? = nil,
        runTimeTicks: Int? = nil,
        size: Int? = nil,
        isSupportsDirectPlay: Bool? = nil,
        isSupportsDirectStream: Bool? = nil,
        isSupportsProbing: Bool? = nil,
        isSupportsTranscoding: Bool? = nil,
        timestamp: TransportStreamTimestamp? = nil,
        transcodingContainer: String? = nil,
        transcodingSubProtocol: String? = nil,
        transcodingURL: String? = nil,
        type: MediaSourceType? = nil,
        video3DFormat: Video3DFormat? = nil,
        videoType: VideoType? = nil
    ) {
        self.analyzeDurationMs = analyzeDurationMs
        self.bitrate = bitrate
        self.bufferMs = bufferMs
        self.container = container
        self.defaultAudioStreamIndex = defaultAudioStreamIndex
        self.defaultSubtitleStreamIndex = defaultSubtitleStreamIndex
        self.eTag = eTag
        self.encoderPath = encoderPath
        self.encoderProtocol = encoderProtocol
        self.formats = formats
        self.isGenPtsInput = isGenPtsInput
        self.id = id
        self.isIgnoreDts = isIgnoreDts
        self.isIgnoreIndex = isIgnoreIndex
        self.isInfiniteStream = isInfiniteStream
        self.isRemote = isRemote
        self.isoType = isoType
        self.liveStreamID = liveStreamID
        self.mediaAttachments = mediaAttachments
        self.mediaStreams = mediaStreams
        self.name = name
        self.openToken = openToken
        self.path = path
        self.protocol = `protocol`
        self.isReadAtNativeFramerate = isReadAtNativeFramerate
        self.requiredHTTPHeaders = requiredHTTPHeaders
        self.requiresClosing = requiresClosing
        self.requiresLooping = requiresLooping
        self.requiresOpening = requiresOpening
        self.runTimeTicks = runTimeTicks
        self.size = size
        self.isSupportsDirectPlay = isSupportsDirectPlay
        self.isSupportsDirectStream = isSupportsDirectStream
        self.isSupportsProbing = isSupportsProbing
        self.isSupportsTranscoding = isSupportsTranscoding
        self.timestamp = timestamp
        self.transcodingContainer = transcodingContainer
        self.transcodingSubProtocol = transcodingSubProtocol
        self.transcodingURL = transcodingURL
        self.type = type
        self.video3DFormat = video3DFormat
        self.videoType = videoType
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.analyzeDurationMs = try values.decodeIfPresent(Int.self, forKey: "AnalyzeDurationMs")
        self.bitrate = try values.decodeIfPresent(Int.self, forKey: "Bitrate")
        self.bufferMs = try values.decodeIfPresent(Int.self, forKey: "BufferMs")
        self.container = try values.decodeIfPresent(String.self, forKey: "Container")
        self.defaultAudioStreamIndex = try values.decodeIfPresent(Int.self, forKey: "DefaultAudioStreamIndex")
        self.defaultSubtitleStreamIndex = try values.decodeIfPresent(Int.self, forKey: "DefaultSubtitleStreamIndex")
        self.eTag = try values.decodeIfPresent(String.self, forKey: "ETag")
        self.encoderPath = try values.decodeIfPresent(String.self, forKey: "EncoderPath")
        self.encoderProtocol = try values.decodeIfPresent(MediaProtocol.self, forKey: "EncoderProtocol")
        self.formats = try values.decodeIfPresent([String].self, forKey: "Formats")
        self.isGenPtsInput = try values.decodeIfPresent(Bool.self, forKey: "GenPtsInput")
        self.id = try values.decodeIfPresent(String.self, forKey: "Id")
        self.isIgnoreDts = try values.decodeIfPresent(Bool.self, forKey: "IgnoreDts")
        self.isIgnoreIndex = try values.decodeIfPresent(Bool.self, forKey: "IgnoreIndex")
        self.isInfiniteStream = try values.decodeIfPresent(Bool.self, forKey: "IsInfiniteStream")
        self.isRemote = try values.decodeIfPresent(Bool.self, forKey: "IsRemote")
        self.isoType = try values.decodeIfPresent(IsoType.self, forKey: "IsoType")
        self.liveStreamID = try values.decodeIfPresent(String.self, forKey: "LiveStreamId")
        self.mediaAttachments = try values.decodeIfPresent([MediaAttachment].self, forKey: "MediaAttachments")
        self.mediaStreams = try values.decodeIfPresent([MediaStream].self, forKey: "MediaStreams")
        self.name = try values.decodeIfPresent(String.self, forKey: "Name")
        self.openToken = try values.decodeIfPresent(String.self, forKey: "OpenToken")
        self.path = try values.decodeIfPresent(String.self, forKey: "Path")
        self.protocol = try values.decodeIfPresent(MediaProtocol.self, forKey: "Protocol")
        self.isReadAtNativeFramerate = try values.decodeIfPresent(Bool.self, forKey: "ReadAtNativeFramerate")
        self.requiredHTTPHeaders = try values.decodeIfPresent([String: String].self, forKey: "RequiredHttpHeaders")
        self.requiresClosing = try values.decodeIfPresent(Bool.self, forKey: "RequiresClosing")
        self.requiresLooping = try values.decodeIfPresent(Bool.self, forKey: "RequiresLooping")
        self.requiresOpening = try values.decodeIfPresent(Bool.self, forKey: "RequiresOpening")
        self.runTimeTicks = try values.decodeIfPresent(Int.self, forKey: "RunTimeTicks")
        self.size = try values.decodeIfPresent(Int.self, forKey: "Size")
        self.isSupportsDirectPlay = try values.decodeIfPresent(Bool.self, forKey: "SupportsDirectPlay")
        self.isSupportsDirectStream = try values.decodeIfPresent(Bool.self, forKey: "SupportsDirectStream")
        self.isSupportsProbing = try values.decodeIfPresent(Bool.self, forKey: "SupportsProbing")
        self.isSupportsTranscoding = try values.decodeIfPresent(Bool.self, forKey: "SupportsTranscoding")
        self.timestamp = try values.decodeIfPresent(TransportStreamTimestamp.self, forKey: "Timestamp")
        self.transcodingContainer = try values.decodeIfPresent(String.self, forKey: "TranscodingContainer")
        self.transcodingSubProtocol = try values.decodeIfPresent(String.self, forKey: "TranscodingSubProtocol")
        self.transcodingURL = try values.decodeIfPresent(String.self, forKey: "TranscodingUrl")
        self.type = try values.decodeIfPresent(MediaSourceType.self, forKey: "Type")
        self.video3DFormat = try values.decodeIfPresent(Video3DFormat.self, forKey: "Video3DFormat")
        self.videoType = try values.decodeIfPresent(VideoType.self, forKey: "VideoType")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(analyzeDurationMs, forKey: "AnalyzeDurationMs")
        try values.encodeIfPresent(bitrate, forKey: "Bitrate")
        try values.encodeIfPresent(bufferMs, forKey: "BufferMs")
        try values.encodeIfPresent(container, forKey: "Container")
        try values.encodeIfPresent(defaultAudioStreamIndex, forKey: "DefaultAudioStreamIndex")
        try values.encodeIfPresent(defaultSubtitleStreamIndex, forKey: "DefaultSubtitleStreamIndex")
        try values.encodeIfPresent(eTag, forKey: "ETag")
        try values.encodeIfPresent(encoderPath, forKey: "EncoderPath")
        try values.encodeIfPresent(encoderProtocol, forKey: "EncoderProtocol")
        try values.encodeIfPresent(formats, forKey: "Formats")
        try values.encodeIfPresent(isGenPtsInput, forKey: "GenPtsInput")
        try values.encodeIfPresent(id, forKey: "Id")
        try values.encodeIfPresent(isIgnoreDts, forKey: "IgnoreDts")
        try values.encodeIfPresent(isIgnoreIndex, forKey: "IgnoreIndex")
        try values.encodeIfPresent(isInfiniteStream, forKey: "IsInfiniteStream")
        try values.encodeIfPresent(isRemote, forKey: "IsRemote")
        try values.encodeIfPresent(isoType, forKey: "IsoType")
        try values.encodeIfPresent(liveStreamID, forKey: "LiveStreamId")
        try values.encodeIfPresent(mediaAttachments, forKey: "MediaAttachments")
        try values.encodeIfPresent(mediaStreams, forKey: "MediaStreams")
        try values.encodeIfPresent(name, forKey: "Name")
        try values.encodeIfPresent(openToken, forKey: "OpenToken")
        try values.encodeIfPresent(path, forKey: "Path")
        try values.encodeIfPresent(`protocol`, forKey: "Protocol")
        try values.encodeIfPresent(isReadAtNativeFramerate, forKey: "ReadAtNativeFramerate")
        try values.encodeIfPresent(requiredHTTPHeaders, forKey: "RequiredHttpHeaders")
        try values.encodeIfPresent(requiresClosing, forKey: "RequiresClosing")
        try values.encodeIfPresent(requiresLooping, forKey: "RequiresLooping")
        try values.encodeIfPresent(requiresOpening, forKey: "RequiresOpening")
        try values.encodeIfPresent(runTimeTicks, forKey: "RunTimeTicks")
        try values.encodeIfPresent(size, forKey: "Size")
        try values.encodeIfPresent(isSupportsDirectPlay, forKey: "SupportsDirectPlay")
        try values.encodeIfPresent(isSupportsDirectStream, forKey: "SupportsDirectStream")
        try values.encodeIfPresent(isSupportsProbing, forKey: "SupportsProbing")
        try values.encodeIfPresent(isSupportsTranscoding, forKey: "SupportsTranscoding")
        try values.encodeIfPresent(timestamp, forKey: "Timestamp")
        try values.encodeIfPresent(transcodingContainer, forKey: "TranscodingContainer")
        try values.encodeIfPresent(transcodingSubProtocol, forKey: "TranscodingSubProtocol")
        try values.encodeIfPresent(transcodingURL, forKey: "TranscodingUrl")
        try values.encodeIfPresent(type, forKey: "Type")
        try values.encodeIfPresent(video3DFormat, forKey: "Video3DFormat")
        try values.encodeIfPresent(videoType, forKey: "VideoType")
    }
}
