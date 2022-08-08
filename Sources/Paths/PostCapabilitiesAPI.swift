//
// Swiftfin is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get
import URLQueryEncoder

public extension Paths {
    /// Updates capabilities for a device.
    static func postCapabilities(parameters: PostCapabilitiesParameters? = nil) -> Request<Void> {
        Request(method: "POST", url: "/Sessions/Capabilities", query: parameters?.asQuery, id: "PostCapabilities")
    }

    struct PostCapabilitiesParameters {
        public var id: String?
        public var playableMediaTypes: [String]?
        public var supportedCommands: [JellyfinAPI.GeneralCommandType]?
        public var isSupportsMediaControl: Bool?
        public var isSupportsSync: Bool?
        public var isSupportsPersistentIdentifier: Bool?

        public init(
            id: String? = nil,
            playableMediaTypes: [String]? = nil,
            supportedCommands: [JellyfinAPI.GeneralCommandType]? = nil,
            isSupportsMediaControl: Bool? = nil,
            isSupportsSync: Bool? = nil,
            isSupportsPersistentIdentifier: Bool? = nil
        ) {
            self.id = id
            self.playableMediaTypes = playableMediaTypes
            self.supportedCommands = supportedCommands
            self.isSupportsMediaControl = isSupportsMediaControl
            self.isSupportsSync = isSupportsSync
            self.isSupportsPersistentIdentifier = isSupportsPersistentIdentifier
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(id, forKey: "id")
            encoder.encode(playableMediaTypes, forKey: "playableMediaTypes")
            encoder.encode(supportedCommands, forKey: "supportedCommands")
            encoder.encode(isSupportsMediaControl, forKey: "supportsMediaControl")
            encoder.encode(isSupportsSync, forKey: "supportsSync")
            encoder.encode(isSupportsPersistentIdentifier, forKey: "supportsPersistentIdentifier")
            return encoder.items
        }
    }
}
