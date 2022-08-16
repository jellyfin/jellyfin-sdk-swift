//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Default directory browser info.
public struct DefaultDirectoryBrowserInfoDto: Codable {
    /// Gets or sets the path.
    public var path: String?

    public init(path: String? = nil) {
        self.path = path
    }
}
