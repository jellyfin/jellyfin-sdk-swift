//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct MediaSourceInfo: Codable, Identifiable {
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
}
