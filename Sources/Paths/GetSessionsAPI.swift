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
    /// Gets a list of sessions.
    static func getSessions(parameters: GetSessionsParameters? = nil) -> Request<[JellyfinAPI.SessionInfo]> {
        Request(method: "GET", url: "/Sessions", query: parameters?.asQuery, id: "GetSessions")
    }

    struct GetSessionsParameters {
        public var controllableByUserID: String?
        public var deviceID: String?
        public var activeWithinSeconds: Int?

        public init(controllableByUserID: String? = nil, deviceID: String? = nil, activeWithinSeconds: Int? = nil) {
            self.controllableByUserID = controllableByUserID
            self.deviceID = deviceID
            self.activeWithinSeconds = activeWithinSeconds
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(controllableByUserID, forKey: "controllableByUserId")
            encoder.encode(deviceID, forKey: "deviceId")
            encoder.encode(activeWithinSeconds, forKey: "activeWithinSeconds")
            return encoder.items
        }
    }
}
