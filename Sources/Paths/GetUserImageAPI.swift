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
    /// Get user profile image.
    static func getUserImage(parameters: GetUserImageParameters? = nil) -> Request<Data> {
        Request(path: "/UserImage", method: "GET", query: parameters?.asQuery, id: "GetUserImage")
    }

    struct GetUserImageParameters {
        public var userID: String?
        public var tag: String?
        public var format: Format?

        public typealias Format = JellyfinAPI.ImageFormat

        public init(userID: String? = nil, tag: String? = nil, format: Format? = nil) {
            self.userID = userID
            self.tag = tag
            self.format = format
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(userID, forKey: "userId")
            encoder.encode(tag, forKey: "tag")
            encoder.encode(format, forKey: "format")
            return encoder.items
        }
    }
}
