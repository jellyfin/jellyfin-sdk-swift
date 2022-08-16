//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get
import URLQueryEncoder

public extension Paths {
    /// Gets a hls live stream.
    static func getLiveHlsStream(itemID: String, parameters: GetLiveHlsStreamParameters? = nil) -> Request<Data> {
        Request(method: "GET", url: "/Videos/\(itemID)/live.m3u8", query: parameters?.asQuery, id: "GetLiveHlsStream")
    }

    struct GetLiveHlsStreamParameters {
        public var container: String?
        public var isStatic: Bool?
        public var params: String?
        public var tag: String?
        public var deviceProfileID: String?
        public var playSessionID: String?
        public var segmentContainer: String?
        public var segmentLength: Int?
        public var minSegments: Int?
        public var mediaSourceID: String?
        public var deviceID: String?
        public var audioCodec: String?
        public var enableAutoStreamCopy: Bool?
        public var allowVideoStreamCopy: Bool?
        public var allowAudioStreamCopy: Bool?
        public var isBreakOnNonKeyFrames: Bool?
        public var audioSampleRate: Int?
        public var maxAudioBitDepth: Int?
        public var audioBitRate: Int?
        public var audioChannels: Int?
        public var maxAudioChannels: Int?
        public var profile: String?
        public var level: String?
        public var framerate: Double?
        public var maxFramerate: Double?
        public var isCopyTimestamps: Bool?
        public var startTimeTicks: Int?
        public var width: Int?
        public var height: Int?
        public var videoBitRate: Int?
        public var subtitleStreamIndex: Int?
        public var subtitleMethod: SubtitleMethod?
        public var maxRefFrames: Int?
        public var maxVideoBitDepth: Int?
        public var requireAvc: Bool?
        public var isDeInterlace: Bool?
        public var requireNonAnamorphic: Bool?
        public var transcodingMaxAudioChannels: Int?
        public var cpuCoreLimit: Int?
        public var liveStreamID: String?
        public var enableMpegtsM2TsMode: Bool?
        public var videoCodec: String?
        public var subtitleCodec: String?
        public var transcodeReasons: String?
        public var audioStreamIndex: Int?
        public var videoStreamIndex: Int?
        public var context: Context?
        public var streamOptions: StreamOptions?
        public var maxWidth: Int?
        public var maxHeight: Int?
        public var enableSubtitlesInManifest: Bool?

        public typealias SubtitleMethod = JellyfinAPI.SubtitleDeliveryMethod

        public typealias Context = JellyfinAPI.EncodingContext

        public typealias StreamOptions = [String: String]

        public init(
            container: String? = nil,
            isStatic: Bool? = nil,
            params: String? = nil,
            tag: String? = nil,
            deviceProfileID: String? = nil,
            playSessionID: String? = nil,
            segmentContainer: String? = nil,
            segmentLength: Int? = nil,
            minSegments: Int? = nil,
            mediaSourceID: String? = nil,
            deviceID: String? = nil,
            audioCodec: String? = nil,
            enableAutoStreamCopy: Bool? = nil,
            allowVideoStreamCopy: Bool? = nil,
            allowAudioStreamCopy: Bool? = nil,
            isBreakOnNonKeyFrames: Bool? = nil,
            audioSampleRate: Int? = nil,
            maxAudioBitDepth: Int? = nil,
            audioBitRate: Int? = nil,
            audioChannels: Int? = nil,
            maxAudioChannels: Int? = nil,
            profile: String? = nil,
            level: String? = nil,
            framerate: Double? = nil,
            maxFramerate: Double? = nil,
            isCopyTimestamps: Bool? = nil,
            startTimeTicks: Int? = nil,
            width: Int? = nil,
            height: Int? = nil,
            videoBitRate: Int? = nil,
            subtitleStreamIndex: Int? = nil,
            subtitleMethod: SubtitleMethod? = nil,
            maxRefFrames: Int? = nil,
            maxVideoBitDepth: Int? = nil,
            requireAvc: Bool? = nil,
            isDeInterlace: Bool? = nil,
            requireNonAnamorphic: Bool? = nil,
            transcodingMaxAudioChannels: Int? = nil,
            cpuCoreLimit: Int? = nil,
            liveStreamID: String? = nil,
            enableMpegtsM2TsMode: Bool? = nil,
            videoCodec: String? = nil,
            subtitleCodec: String? = nil,
            transcodeReasons: String? = nil,
            audioStreamIndex: Int? = nil,
            videoStreamIndex: Int? = nil,
            context: Context? = nil,
            streamOptions: StreamOptions? = nil,
            maxWidth: Int? = nil,
            maxHeight: Int? = nil,
            enableSubtitlesInManifest: Bool? = nil
        ) {
            self.container = container
            self.isStatic = isStatic
            self.params = params
            self.tag = tag
            self.deviceProfileID = deviceProfileID
            self.playSessionID = playSessionID
            self.segmentContainer = segmentContainer
            self.segmentLength = segmentLength
            self.minSegments = minSegments
            self.mediaSourceID = mediaSourceID
            self.deviceID = deviceID
            self.audioCodec = audioCodec
            self.enableAutoStreamCopy = enableAutoStreamCopy
            self.allowVideoStreamCopy = allowVideoStreamCopy
            self.allowAudioStreamCopy = allowAudioStreamCopy
            self.isBreakOnNonKeyFrames = isBreakOnNonKeyFrames
            self.audioSampleRate = audioSampleRate
            self.maxAudioBitDepth = maxAudioBitDepth
            self.audioBitRate = audioBitRate
            self.audioChannels = audioChannels
            self.maxAudioChannels = maxAudioChannels
            self.profile = profile
            self.level = level
            self.framerate = framerate
            self.maxFramerate = maxFramerate
            self.isCopyTimestamps = isCopyTimestamps
            self.startTimeTicks = startTimeTicks
            self.width = width
            self.height = height
            self.videoBitRate = videoBitRate
            self.subtitleStreamIndex = subtitleStreamIndex
            self.subtitleMethod = subtitleMethod
            self.maxRefFrames = maxRefFrames
            self.maxVideoBitDepth = maxVideoBitDepth
            self.requireAvc = requireAvc
            self.isDeInterlace = isDeInterlace
            self.requireNonAnamorphic = requireNonAnamorphic
            self.transcodingMaxAudioChannels = transcodingMaxAudioChannels
            self.cpuCoreLimit = cpuCoreLimit
            self.liveStreamID = liveStreamID
            self.enableMpegtsM2TsMode = enableMpegtsM2TsMode
            self.videoCodec = videoCodec
            self.subtitleCodec = subtitleCodec
            self.transcodeReasons = transcodeReasons
            self.audioStreamIndex = audioStreamIndex
            self.videoStreamIndex = videoStreamIndex
            self.context = context
            self.streamOptions = streamOptions
            self.maxWidth = maxWidth
            self.maxHeight = maxHeight
            self.enableSubtitlesInManifest = enableSubtitlesInManifest
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(container, forKey: "container")
            encoder.encode(isStatic, forKey: "static")
            encoder.encode(params, forKey: "params")
            encoder.encode(tag, forKey: "tag")
            encoder.encode(deviceProfileID, forKey: "deviceProfileId")
            encoder.encode(playSessionID, forKey: "playSessionId")
            encoder.encode(segmentContainer, forKey: "segmentContainer")
            encoder.encode(segmentLength, forKey: "segmentLength")
            encoder.encode(minSegments, forKey: "minSegments")
            encoder.encode(mediaSourceID, forKey: "mediaSourceId")
            encoder.encode(deviceID, forKey: "deviceId")
            encoder.encode(audioCodec, forKey: "audioCodec")
            encoder.encode(enableAutoStreamCopy, forKey: "enableAutoStreamCopy")
            encoder.encode(allowVideoStreamCopy, forKey: "allowVideoStreamCopy")
            encoder.encode(allowAudioStreamCopy, forKey: "allowAudioStreamCopy")
            encoder.encode(isBreakOnNonKeyFrames, forKey: "breakOnNonKeyFrames")
            encoder.encode(audioSampleRate, forKey: "audioSampleRate")
            encoder.encode(maxAudioBitDepth, forKey: "maxAudioBitDepth")
            encoder.encode(audioBitRate, forKey: "audioBitRate")
            encoder.encode(audioChannels, forKey: "audioChannels")
            encoder.encode(maxAudioChannels, forKey: "maxAudioChannels")
            encoder.encode(profile, forKey: "profile")
            encoder.encode(level, forKey: "level")
            encoder.encode(framerate, forKey: "framerate")
            encoder.encode(maxFramerate, forKey: "maxFramerate")
            encoder.encode(isCopyTimestamps, forKey: "copyTimestamps")
            encoder.encode(startTimeTicks, forKey: "startTimeTicks")
            encoder.encode(width, forKey: "width")
            encoder.encode(height, forKey: "height")
            encoder.encode(videoBitRate, forKey: "videoBitRate")
            encoder.encode(subtitleStreamIndex, forKey: "subtitleStreamIndex")
            encoder.encode(subtitleMethod, forKey: "subtitleMethod")
            encoder.encode(maxRefFrames, forKey: "maxRefFrames")
            encoder.encode(maxVideoBitDepth, forKey: "maxVideoBitDepth")
            encoder.encode(requireAvc, forKey: "requireAvc")
            encoder.encode(isDeInterlace, forKey: "deInterlace")
            encoder.encode(requireNonAnamorphic, forKey: "requireNonAnamorphic")
            encoder.encode(transcodingMaxAudioChannels, forKey: "transcodingMaxAudioChannels")
            encoder.encode(cpuCoreLimit, forKey: "cpuCoreLimit")
            encoder.encode(liveStreamID, forKey: "liveStreamId")
            encoder.encode(enableMpegtsM2TsMode, forKey: "enableMpegtsM2TsMode")
            encoder.encode(videoCodec, forKey: "videoCodec")
            encoder.encode(subtitleCodec, forKey: "subtitleCodec")
            encoder.encode(transcodeReasons, forKey: "transcodeReasons")
            encoder.encode(audioStreamIndex, forKey: "audioStreamIndex")
            encoder.encode(videoStreamIndex, forKey: "videoStreamIndex")
            encoder.encode(context, forKey: "context")
            encoder.encode(streamOptions, forKey: "streamOptions")
            encoder.encode(maxWidth, forKey: "maxWidth")
            encoder.encode(maxHeight, forKey: "maxHeight")
            encoder.encode(enableSubtitlesInManifest, forKey: "enableSubtitlesInManifest")
            return encoder.items
        }
    }
}
