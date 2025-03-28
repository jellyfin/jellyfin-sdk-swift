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
    /// Reports a session's playback progress.
    static func onPlaybackProgress(itemID: String, parameters: OnPlaybackProgressParameters? = nil) -> Request<Void> {
        Request(path: "/PlayingItems/\(itemID)/Progress", method: "POST", query: parameters?.asQuery, id: "OnPlaybackProgress")
    }

    struct OnPlaybackProgressParameters {
        public var mediaSourceID: String?
        public var positionTicks: Int?
        public var audioStreamIndex: Int?
        public var subtitleStreamIndex: Int?
        public var volumeLevel: Int?
        public var playMethod: PlayMethod?
        public var liveStreamID: String?
        public var playSessionID: String?
        public var repeatMode: RepeatMode?
        public var isPaused: Bool?
        public var isMuted: Bool?

        public typealias PlayMethod = JellyfinAPI.PlayMethod

        public typealias RepeatMode = JellyfinAPI.RepeatMode

        public init(
            mediaSourceID: String? = nil,
            positionTicks: Int? = nil,
            audioStreamIndex: Int? = nil,
            subtitleStreamIndex: Int? = nil,
            volumeLevel: Int? = nil,
            playMethod: PlayMethod? = nil,
            liveStreamID: String? = nil,
            playSessionID: String? = nil,
            repeatMode: RepeatMode? = nil,
            isPaused: Bool? = nil,
            isMuted: Bool? = nil
        ) {
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
