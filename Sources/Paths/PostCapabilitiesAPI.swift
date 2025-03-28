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
    /// Updates capabilities for a device.
    static func postCapabilities(parameters: PostCapabilitiesParameters? = nil) -> Request<Void> {
        Request(path: "/Sessions/Capabilities", method: "POST", query: parameters?.asQuery, id: "PostCapabilities")
    }

    struct PostCapabilitiesParameters {
        public var id: String?
        public var playableMediaTypes: [JellyfinAPI.MediaType]?
        public var supportedCommands: [JellyfinAPI.GeneralCommandType]?
        public var isSupportsMediaControl: Bool?
        public var isSupportsPersistentIdentifier: Bool?

        public init(
            id: String? = nil,
            playableMediaTypes: [JellyfinAPI.MediaType]? = nil,
            supportedCommands: [JellyfinAPI.GeneralCommandType]? = nil,
            isSupportsMediaControl: Bool? = nil,
            isSupportsPersistentIdentifier: Bool? = nil
        ) {
            self.id = id
            self.playableMediaTypes = playableMediaTypes
            self.supportedCommands = supportedCommands
            self.isSupportsMediaControl = isSupportsMediaControl
            self.isSupportsPersistentIdentifier = isSupportsPersistentIdentifier
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(id, forKey: "id")
            encoder.encode(playableMediaTypes, forKey: "playableMediaTypes")
            encoder.encode(supportedCommands, forKey: "supportedCommands")
            encoder.encode(isSupportsMediaControl, forKey: "supportsMediaControl")
            encoder.encode(isSupportsPersistentIdentifier, forKey: "supportsPersistentIdentifier")
            return encoder.items
        }
    }
}
