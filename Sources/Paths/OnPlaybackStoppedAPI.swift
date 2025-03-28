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
    /// Reports that a session has stopped playing an item.
    static func onPlaybackStopped(itemID: String, parameters: OnPlaybackStoppedParameters? = nil) -> Request<Void> {
        Request(path: "/PlayingItems/\(itemID)", method: "DELETE", query: parameters?.asQuery, id: "OnPlaybackStopped")
    }

    struct OnPlaybackStoppedParameters {
        public var mediaSourceID: String?
        public var nextMediaType: String?
        public var positionTicks: Int?
        public var liveStreamID: String?
        public var playSessionID: String?

        public init(
            mediaSourceID: String? = nil,
            nextMediaType: String? = nil,
            positionTicks: Int? = nil,
            liveStreamID: String? = nil,
            playSessionID: String? = nil
        ) {
            self.mediaSourceID = mediaSourceID
            self.nextMediaType = nextMediaType
            self.positionTicks = positionTicks
            self.liveStreamID = liveStreamID
            self.playSessionID = playSessionID
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(mediaSourceID, forKey: "mediaSourceId")
            encoder.encode(nextMediaType, forKey: "nextMediaType")
            encoder.encode(positionTicks, forKey: "positionTicks")
            encoder.encode(liveStreamID, forKey: "liveStreamId")
            encoder.encode(playSessionID, forKey: "playSessionId")
            return encoder.items
        }
    }
}
