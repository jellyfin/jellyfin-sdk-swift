//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class NewGroupRequestDto.
public struct NewGroupRequestDto: Codable {
    /// Gets or sets the group name.
    public var groupName: String?

    public init(groupName: String? = nil) {
        self.groupName = groupName
    }
}
