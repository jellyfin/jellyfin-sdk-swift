//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Library option info dto.
public struct LibraryOptionInfoDto: Codable {
    /// Gets or sets a value indicating whether default enabled.
    public var isDefaultEnabled: Bool?
    /// Gets or sets name.
    public var name: String?

    public init(isDefaultEnabled: Bool? = nil, name: String? = nil) {
        self.isDefaultEnabled = isDefaultEnabled
        self.name = name
    }
}
