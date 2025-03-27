//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get
import URLQueryEncoder

public extension Paths {
    /// Gets live playback media info for an item.
    ///
    /// For backwards compatibility parameters can be sent via Query or Body, with Query having higher precedence.
    ///
    /// Query parameters are obsolete.
    static func getPostedPlaybackInfo(
        itemID: String,
        parameters: GetPostedPlaybackInfoParameters? = nil,
        _ body: JellyfinAPI.PlaybackInfoDto? = nil
    ) -> Request<JellyfinAPI.PlaybackInfoResponse> {
        Request(path: "/Items/\(itemID)/PlaybackInfo", method: "POST", query: parameters?.asQuery, body: body, id: "GetPostedPlaybackInfo")
    }

    struct GetPostedPlaybackInfoParameters {
        public var userID: String?
        public var maxStreamingBitrate: Int?
        public var startTimeTicks: Int?
        public var audioStreamIndex: Int?
        public var subtitleStreamIndex: Int?
        public var maxAudioChannels: Int?
        public var mediaSourceID: String?
        public var liveStreamID: String?
        public var isAutoOpenLiveStream: Bool?
        public var enableDirectPlay: Bool?
        public var enableDirectStream: Bool?
        public var enableTranscoding: Bool?
        public var allowVideoStreamCopy: Bool?
        public var allowAudioStreamCopy: Bool?

        public init(
            userID: String? = nil,
            maxStreamingBitrate: Int? = nil,
            startTimeTicks: Int? = nil,
            audioStreamIndex: Int? = nil,
            subtitleStreamIndex: Int? = nil,
            maxAudioChannels: Int? = nil,
            mediaSourceID: String? = nil,
            liveStreamID: String? = nil,
            isAutoOpenLiveStream: Bool? = nil,
            enableDirectPlay: Bool? = nil,
            enableDirectStream: Bool? = nil,
            enableTranscoding: Bool? = nil,
            allowVideoStreamCopy: Bool? = nil,
            allowAudioStreamCopy: Bool? = nil
        ) {
            self.userID = userID
            self.maxStreamingBitrate = maxStreamingBitrate
            self.startTimeTicks = startTimeTicks
            self.audioStreamIndex = audioStreamIndex
            self.subtitleStreamIndex = subtitleStreamIndex
            self.maxAudioChannels = maxAudioChannels
            self.mediaSourceID = mediaSourceID
            self.liveStreamID = liveStreamID
            self.isAutoOpenLiveStream = isAutoOpenLiveStream
            self.enableDirectPlay = enableDirectPlay
            self.enableDirectStream = enableDirectStream
            self.enableTranscoding = enableTranscoding
            self.allowVideoStreamCopy = allowVideoStreamCopy
            self.allowAudioStreamCopy = allowAudioStreamCopy
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(userID, forKey: "userId")
            encoder.encode(maxStreamingBitrate, forKey: "maxStreamingBitrate")
            encoder.encode(startTimeTicks, forKey: "startTimeTicks")
            encoder.encode(audioStreamIndex, forKey: "audioStreamIndex")
            encoder.encode(subtitleStreamIndex, forKey: "subtitleStreamIndex")
            encoder.encode(maxAudioChannels, forKey: "maxAudioChannels")
            encoder.encode(mediaSourceID, forKey: "mediaSourceId")
            encoder.encode(liveStreamID, forKey: "liveStreamId")
            encoder.encode(isAutoOpenLiveStream, forKey: "autoOpenLiveStream")
            encoder.encode(enableDirectPlay, forKey: "enableDirectPlay")
            encoder.encode(enableDirectStream, forKey: "enableDirectStream")
            encoder.encode(enableTranscoding, forKey: "enableTranscoding")
            encoder.encode(allowVideoStreamCopy, forKey: "allowVideoStreamCopy")
            encoder.encode(allowAudioStreamCopy, forKey: "allowAudioStreamCopy")
            return encoder.items
        }
    }
}
