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
    /// Gets a video stream using HTTP live streaming.
    static func getHlsAudioSegment(
        itemID: String,
        playlistID: String,
        segmentID: Int,
        container: String,
        parameters: GetHlsAudioSegmentParameters
    ) -> Request<Data> {
        Request(
            method: "GET",
            url: "/Audio/\(itemID)/hls1/\(playlistID)/\(segmentID).\(container)",
            query: parameters.asQuery,
            id: "GetHlsAudioSegment"
        )
    }

    struct GetHlsAudioSegmentParameters {
        public var runtimeTicks: Int64
        public var actualSegmentLengthTicks: Int64
        public var isStatic: Bool?
        public var params: String?
        public var tag: String?
        public var deviceProfileID: String?
        public var playSessionID: String?
        public var segmentContainer: String?
        public var segmentLength: Int32?
        public var minSegments: Int32?
        public var mediaSourceID: String?
        public var deviceID: String?
        public var audioCodec: String?
        public var enableAutoStreamCopy: Bool?
        public var allowVideoStreamCopy: Bool?
        public var allowAudioStreamCopy: Bool?
        public var isBreakOnNonKeyFrames: Bool?
        public var audioSampleRate: Int32?
        public var maxAudioBitDepth: Int32?
        public var maxStreamingBitrate: Int32?
        public var audioBitRate: Int32?
        public var audioChannels: Int32?
        public var maxAudioChannels: Int32?
        public var profile: String?
        public var level: String?
        public var framerate: Float?
        public var maxFramerate: Float?
        public var isCopyTimestamps: Bool?
        public var startTimeTicks: Int64?
        public var width: Int32?
        public var height: Int32?
        public var videoBitRate: Int32?
        public var subtitleStreamIndex: Int32?
        public var subtitleMethod: SubtitleMethod?
        public var maxRefFrames: Int32?
        public var maxVideoBitDepth: Int32?
        public var requireAvc: Bool?
        public var isDeInterlace: Bool?
        public var requireNonAnamorphic: Bool?
        public var transcodingMaxAudioChannels: Int32?
        public var cpuCoreLimit: Int32?
        public var liveStreamID: String?
        public var enableMpegtsM2TsMode: Bool?
        public var videoCodec: String?
        public var subtitleCodec: String?
        public var transcodeReasons: String?
        public var audioStreamIndex: Int32?
        public var videoStreamIndex: Int32?
        public var context: Context?
        public var streamOptions: StreamOptions?

        public typealias SubtitleMethod = JellyfinAPI.SubtitleDeliveryMethod

        public typealias Context = JellyfinAPI.EncodingContext

        public typealias StreamOptions = [String: String]

        public init(
            runtimeTicks: Int64,
            actualSegmentLengthTicks: Int64,
            isStatic: Bool? = nil,
            params: String? = nil,
            tag: String? = nil,
            deviceProfileID: String? = nil,
            playSessionID: String? = nil,
            segmentContainer: String? = nil,
            segmentLength: Int32? = nil,
            minSegments: Int32? = nil,
            mediaSourceID: String? = nil,
            deviceID: String? = nil,
            audioCodec: String? = nil,
            enableAutoStreamCopy: Bool? = nil,
            allowVideoStreamCopy: Bool? = nil,
            allowAudioStreamCopy: Bool? = nil,
            isBreakOnNonKeyFrames: Bool? = nil,
            audioSampleRate: Int32? = nil,
            maxAudioBitDepth: Int32? = nil,
            maxStreamingBitrate: Int32? = nil,
            audioBitRate: Int32? = nil,
            audioChannels: Int32? = nil,
            maxAudioChannels: Int32? = nil,
            profile: String? = nil,
            level: String? = nil,
            framerate: Float? = nil,
            maxFramerate: Float? = nil,
            isCopyTimestamps: Bool? = nil,
            startTimeTicks: Int64? = nil,
            width: Int32? = nil,
            height: Int32? = nil,
            videoBitRate: Int32? = nil,
            subtitleStreamIndex: Int32? = nil,
            subtitleMethod: SubtitleMethod? = nil,
            maxRefFrames: Int32? = nil,
            maxVideoBitDepth: Int32? = nil,
            requireAvc: Bool? = nil,
            isDeInterlace: Bool? = nil,
            requireNonAnamorphic: Bool? = nil,
            transcodingMaxAudioChannels: Int32? = nil,
            cpuCoreLimit: Int32? = nil,
            liveStreamID: String? = nil,
            enableMpegtsM2TsMode: Bool? = nil,
            videoCodec: String? = nil,
            subtitleCodec: String? = nil,
            transcodeReasons: String? = nil,
            audioStreamIndex: Int32? = nil,
            videoStreamIndex: Int32? = nil,
            context: Context? = nil,
            streamOptions: StreamOptions? = nil
        ) {
            self.runtimeTicks = runtimeTicks
            self.actualSegmentLengthTicks = actualSegmentLengthTicks
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
            self.maxStreamingBitrate = maxStreamingBitrate
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
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(runtimeTicks, forKey: "runtimeTicks")
            encoder.encode(actualSegmentLengthTicks, forKey: "actualSegmentLengthTicks")
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
            encoder.encode(maxStreamingBitrate, forKey: "maxStreamingBitrate")
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
            return encoder.items
        }
    }
}
