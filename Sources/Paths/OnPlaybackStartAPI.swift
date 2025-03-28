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
    /// Reports that a session has begun playing an item.
    static func onPlaybackStart(itemID: String, parameters: OnPlaybackStartParameters? = nil) -> Request<Void> {
        Request(path: "/PlayingItems/\(itemID)", method: "POST", query: parameters?.asQuery, id: "OnPlaybackStart")
    }

    struct OnPlaybackStartParameters {
        public var mediaSourceID: String?
        public var audioStreamIndex: Int?
        public var subtitleStreamIndex: Int?
        public var playMethod: PlayMethod?
        public var liveStreamID: String?
        public var playSessionID: String?
        public var canSeek: Bool?

        public typealias PlayMethod = JellyfinAPI.PlayMethod

        public init(
            mediaSourceID: String? = nil,
            audioStreamIndex: Int? = nil,
            subtitleStreamIndex: Int? = nil,
            playMethod: PlayMethod? = nil,
            liveStreamID: String? = nil,
            playSessionID: String? = nil,
            canSeek: Bool? = nil
        ) {
            self.mediaSourceID = mediaSourceID
            self.audioStreamIndex = audioStreamIndex
            self.subtitleStreamIndex = subtitleStreamIndex
            self.playMethod = playMethod
            self.liveStreamID = liveStreamID
            self.playSessionID = playSessionID
            self.canSeek = canSeek
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(mediaSourceID, forKey: "mediaSourceId")
            encoder.encode(audioStreamIndex, forKey: "audioStreamIndex")
            encoder.encode(subtitleStreamIndex, forKey: "subtitleStreamIndex")
            encoder.encode(playMethod, forKey: "playMethod")
            encoder.encode(liveStreamID, forKey: "liveStreamId")
            encoder.encode(playSessionID, forKey: "playSessionId")
            encoder.encode(canSeek, forKey: "canSeek")
            return encoder.items
        }
    }
}
