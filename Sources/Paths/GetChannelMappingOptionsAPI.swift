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
    /// Get channel mapping options.
    static public func getChannelMappingOptions(providerID: String? = nil) -> Request<JellyfinAPI.ChannelMappingOptionsDto> {
        Request(method: "GET", url: "/LiveTv/ChannelMappingOptions", query: makeGetChannelMappingOptionsQuery(providerID), id: "GetChannelMappingOptions")
    }

    private static func makeGetChannelMappingOptionsQuery(_ providerID: String?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(providerID, forKey: "providerId")
        return encoder.items
    }
}
