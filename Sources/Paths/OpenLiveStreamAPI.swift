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

extension Paths {
    /// Opens a media source.
    static public func openLiveStream(parameters: OpenLiveStreamParameters? = nil, _ body: JellyfinAPI.OpenLiveStreamDto? = nil) -> Request<JellyfinAPI.LiveStreamResponse> {
        Request(method: "POST", url: "/LiveStreams/Open", query: parameters?.asQuery, body: body, id: "OpenLiveStream")
    }

    public struct OpenLiveStreamParameters {
        public var openToken: String?
        public var userID: UUID?
        public var playSessionID: String?
        public var maxStreamingBitrate: Int32?
        public var startTimeTicks: Int64?
        public var audioStreamIndex: Int32?
        public var subtitleStreamIndex: Int32?
        public var maxAudioChannels: Int32?
        public var itemID: UUID?
        public var enableDirectPlay: Bool?
        public var enableDirectStream: Bool?

        public init(openToken: String? = nil, userID: UUID? = nil, playSessionID: String? = nil, maxStreamingBitrate: Int32? = nil, startTimeTicks: Int64? = nil, audioStreamIndex: Int32? = nil, subtitleStreamIndex: Int32? = nil, maxAudioChannels: Int32? = nil, itemID: UUID? = nil, enableDirectPlay: Bool? = nil, enableDirectStream: Bool? = nil) {
            self.openToken = openToken
            self.userID = userID
            self.playSessionID = playSessionID
            self.maxStreamingBitrate = maxStreamingBitrate
            self.startTimeTicks = startTimeTicks
            self.audioStreamIndex = audioStreamIndex
            self.subtitleStreamIndex = subtitleStreamIndex
            self.maxAudioChannels = maxAudioChannels
            self.itemID = itemID
            self.enableDirectPlay = enableDirectPlay
            self.enableDirectStream = enableDirectStream
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(openToken, forKey: "openToken")
            encoder.encode(userID, forKey: "userId")
            encoder.encode(playSessionID, forKey: "playSessionId")
            encoder.encode(maxStreamingBitrate, forKey: "maxStreamingBitrate")
            encoder.encode(startTimeTicks, forKey: "startTimeTicks")
            encoder.encode(audioStreamIndex, forKey: "audioStreamIndex")
            encoder.encode(subtitleStreamIndex, forKey: "subtitleStreamIndex")
            encoder.encode(maxAudioChannels, forKey: "maxAudioChannels")
            encoder.encode(itemID, forKey: "itemId")
            encoder.encode(enableDirectPlay, forKey: "enableDirectPlay")
            encoder.encode(enableDirectStream, forKey: "enableDirectStream")
            return encoder.items
        }
    }
}
