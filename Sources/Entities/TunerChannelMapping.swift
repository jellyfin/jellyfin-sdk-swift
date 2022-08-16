//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct TunerChannelMapping: Codable, Identifiable {
    public var id: String?
    public var name: String?
    public var providerChannelID: String?
    public var providerChannelName: String?

    public init(id: String? = nil, name: String? = nil, providerChannelID: String? = nil, providerChannelName: String? = nil) {
        self.id = id
        self.name = name
        self.providerChannelID = providerChannelID
        self.providerChannelName = providerChannelName
    }
}
