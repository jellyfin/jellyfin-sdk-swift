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
    /// Gets the live tv timers.
    static func getTimers(parameters: GetTimersParameters? = nil) -> Request<JellyfinAPI.TimerInfoDtoQueryResult> {
        Request(path: "/LiveTv/Timers", method: "GET", query: parameters?.asQuery, id: "GetTimers")
    }

    struct GetTimersParameters {
        public var channelID: String?
        public var seriesTimerID: String?
        public var isActive: Bool?
        public var isScheduled: Bool?

        public init(channelID: String? = nil, seriesTimerID: String? = nil, isActive: Bool? = nil, isScheduled: Bool? = nil) {
            self.channelID = channelID
            self.seriesTimerID = seriesTimerID
            self.isActive = isActive
            self.isScheduled = isScheduled
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(channelID, forKey: "channelId")
            encoder.encode(seriesTimerID, forKey: "seriesTimerId")
            encoder.encode(isActive, forKey: "isActive")
            encoder.encode(isScheduled, forKey: "isScheduled")
            return encoder.items
        }
    }
}
