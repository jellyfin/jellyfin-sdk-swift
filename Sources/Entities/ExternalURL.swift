//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct ExternalURL: Codable {
    /// Gets or sets the name.
    public var name: String?
    /// Gets or sets the type of the item.
    public var url: String?

    public init(name: String? = nil, url: String? = nil) {
        self.name = name
        self.url = url
    }
}
