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
    /// Reports a user's playback progress.
    static public func onPlaybackProgress(userID: String, itemID: String, parameters: OnPlaybackProgressParameters? = nil) -> Request<Void> {
        Request(method: "POST", url: "/Users/\(userID)/PlayingItems/\(itemID)/Progress", query: parameters?.asQuery, id: "OnPlaybackProgress")
    }

    public struct OnPlaybackProgressParameters {
        public var mediaSourceID: String?
        public var positionTicks: Int64?
        public var audioStreamIndex: Int32?
        public var subtitleStreamIndex: Int32?
        public var volumeLevel: Int32?
        public var playMethod: PlayMethod?
        public var liveStreamID: String?
        public var playSessionID: String?
        public var repeatMode: RepeatMode?
        public var isPaused: Bool?
        public var isMuted: Bool?

        public typealias PlayMethod = JellyfinAPI.PlayMethod

        public typealias RepeatMode = JellyfinAPI.RepeatMode

        public init(mediaSourceID: String? = nil, positionTicks: Int64? = nil, audioStreamIndex: Int32? = nil, subtitleStreamIndex: Int32? = nil, volumeLevel: Int32? = nil, playMethod: PlayMethod? = nil, liveStreamID: String? = nil, playSessionID: String? = nil, repeatMode: RepeatMode? = nil, isPaused: Bool? = nil, isMuted: Bool? = nil) {
            self.mediaSourceID = mediaSourceID
            self.positionTicks = positionTicks
            self.audioStreamIndex = audioStreamIndex
            self.subtitleStreamIndex = subtitleStreamIndex
            self.volumeLevel = volumeLevel
            self.playMethod = playMethod
            self.liveStreamID = liveStreamID
            self.playSessionID = playSessionID
            self.repeatMode = repeatMode
            self.isPaused = isPaused
            self.isMuted = isMuted
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(mediaSourceID, forKey: "mediaSourceId")
            encoder.encode(positionTicks, forKey: "positionTicks")
            encoder.encode(audioStreamIndex, forKey: "audioStreamIndex")
            encoder.encode(subtitleStreamIndex, forKey: "subtitleStreamIndex")
            encoder.encode(volumeLevel, forKey: "volumeLevel")
            encoder.encode(playMethod, forKey: "playMethod")
            encoder.encode(liveStreamID, forKey: "liveStreamId")
            encoder.encode(playSessionID, forKey: "playSessionId")
            encoder.encode(repeatMode, forKey: "repeatMode")
            encoder.encode(isPaused, forKey: "isPaused")
            encoder.encode(isMuted, forKey: "isMuted")
            return encoder.items
        }
    }
}
