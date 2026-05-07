//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get

public extension Paths {
    /// Gets available channels.
    static func getChannels(parameters: GetChannelsParameters? = nil) -> Request<BaseItemDtoQueryResult> {
        Request(path: "/Channels", method: "GET", query: parameters?.asQuery, id: "GetChannels")
    }

    struct GetChannelsParameters {
        public var userID: String?
        public var startIndex: Int?
        public var limit: Int?
        public var isSupportslatestitems: Bool?
        public var isSupportsmediadeletion: Bool?
        public var isFavorite: Bool?

        public init(
            userID: String? = nil,
            startIndex: Int? = nil,
            limit: Int? = nil,
            isSupportslatestitems: Bool? = nil,
            isSupportsmediadeletion: Bool? = nil,
            isFavorite: Bool? = nil
        ) {
            self.userID = userID
            self.startIndex = startIndex
            self.limit = limit
            self.isSupportslatestitems = isSupportslatestitems
            self.isSupportsmediadeletion = isSupportsmediadeletion
            self.isFavorite = isFavorite
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(userID, forKey: "userId")
            encoder.encode(startIndex, forKey: "startIndex")
            encoder.encode(limit, forKey: "limit")
            encoder.encode(isSupportslatestitems, forKey: "supportsLatestItems")
            encoder.encode(isSupportsmediadeletion, forKey: "supportsMediaDeletion")
            encoder.encode(isFavorite, forKey: "isFavorite")
            return encoder.items
        }
    }
}
