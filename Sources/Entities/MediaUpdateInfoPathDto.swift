//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// The media update info path.
public struct MediaUpdateInfoPathDto: Codable {
    /// Gets or sets media path.
    public var path: String?
    /// Gets or sets media update type.
    ///
    /// Created, Modified, Deleted.
    public var updateType: String?

    public init(path: String? = nil, updateType: String? = nil) {
        self.path = path
        self.updateType = updateType
    }
}
