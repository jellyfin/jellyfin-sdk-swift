//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2024 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get
import URLQueryEncoder

public extension Paths {
    /// Gets an audio stream.
    static func headUniversalAudioStream(itemID: String, parameters: HeadUniversalAudioStreamParameters? = nil) -> Request<Data> {
        Request(path: "/Audio/\(itemID)/universal", method: "HEAD", query: parameters?.asQuery, id: "HeadUniversalAudioStream")
    }

    struct HeadUniversalAudioStreamParameters {
        public var container: [String]?
        public var mediaSourceID: String?
        public var deviceID: String?
        public var userID: String?
        public var audioCodec: String?
        public var maxAudioChannels: Int?
        public var transcodingAudioChannels: Int?
        public var maxStreamingBitrate: Int?
        public var audioBitRate: Int?
        public var startTimeTicks: Int?
        public var transcodingContainer: String?
        public var transcodingProtocol: TranscodingProtocol?
        public var maxAudioSampleRate: Int?
        public var maxAudioBitDepth: Int?
        public var enableRemoteMedia: Bool?
        public var isBreakOnNonKeyFrames: Bool?
        public var enableRedirection: Bool?

        public typealias TranscodingProtocol = JellyfinAPI.MediaStreamProtocol

        public init(
            container: [String]? = nil,
            mediaSourceID: String? = nil,
            deviceID: String? = nil,
            userID: String? = nil,
            audioCodec: String? = nil,
            maxAudioChannels: Int? = nil,
            transcodingAudioChannels: Int? = nil,
            maxStreamingBitrate: Int? = nil,
            audioBitRate: Int? = nil,
            startTimeTicks: Int? = nil,
            transcodingContainer: String? = nil,
            transcodingProtocol: TranscodingProtocol? = nil,
            maxAudioSampleRate: Int? = nil,
            maxAudioBitDepth: Int? = nil,
            enableRemoteMedia: Bool? = nil,
            isBreakOnNonKeyFrames: Bool? = nil,
            enableRedirection: Bool? = nil
        ) {
            self.container = container
            self.mediaSourceID = mediaSourceID
            self.deviceID = deviceID
            self.userID = userID
            self.audioCodec = audioCodec
            self.maxAudioChannels = maxAudioChannels
            self.transcodingAudioChannels = transcodingAudioChannels
            self.maxStreamingBitrate = maxStreamingBitrate
            self.audioBitRate = audioBitRate
            self.startTimeTicks = startTimeTicks
            self.transcodingContainer = transcodingContainer
            self.transcodingProtocol = transcodingProtocol
            self.maxAudioSampleRate = maxAudioSampleRate
            self.maxAudioBitDepth = maxAudioBitDepth
            self.enableRemoteMedia = enableRemoteMedia
            self.isBreakOnNonKeyFrames = isBreakOnNonKeyFrames
            self.enableRedirection = enableRedirection
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(container, forKey: "container")
            encoder.encode(mediaSourceID, forKey: "mediaSourceId")
            encoder.encode(deviceID, forKey: "deviceId")
            encoder.encode(userID, forKey: "userId")
            encoder.encode(audioCodec, forKey: "audioCodec")
            encoder.encode(maxAudioChannels, forKey: "maxAudioChannels")
            encoder.encode(transcodingAudioChannels, forKey: "transcodingAudioChannels")
            encoder.encode(maxStreamingBitrate, forKey: "maxStreamingBitrate")
            encoder.encode(audioBitRate, forKey: "audioBitRate")
            encoder.encode(startTimeTicks, forKey: "startTimeTicks")
            encoder.encode(transcodingContainer, forKey: "transcodingContainer")
            encoder.encode(transcodingProtocol, forKey: "transcodingProtocol")
            encoder.encode(maxAudioSampleRate, forKey: "maxAudioSampleRate")
            encoder.encode(maxAudioBitDepth, forKey: "maxAudioBitDepth")
            encoder.encode(enableRemoteMedia, forKey: "enableRemoteMedia")
            encoder.encode(isBreakOnNonKeyFrames, forKey: "breakOnNonKeyFrames")
            encoder.encode(enableRedirection, forKey: "enableRedirection")
            return encoder.items
        }
    }
}
