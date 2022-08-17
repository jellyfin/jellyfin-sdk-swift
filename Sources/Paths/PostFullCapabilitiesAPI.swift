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
    /// Updates capabilities for a device.
    static public func postFullCapabilities(id: String? = nil, _ body: JellyfinAPI.ClientCapabilitiesDto) -> Request<Void> {
        Request(method: "POST", url: "/Sessions/Capabilities/Full", query: makePostFullCapabilitiesQuery(id), body: body, id: "PostFullCapabilities")
    }

    private static func makePostFullCapabilitiesQuery(_ id: String?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(id, forKey: "id")
        return encoder.items
    }
}
