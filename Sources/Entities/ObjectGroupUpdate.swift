//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class GroupUpdate.
public struct ObjectGroupUpdate: Codable {
    /// Gets the update data.
    public var data: AnyJSON?
    /// Gets the group identifier.
    public var groupID: UUID?
    /// Gets the update type.
    public var type: GroupUpdateType?

    public init(data: AnyJSON? = nil, groupID: UUID? = nil, type: GroupUpdateType? = nil) {
        self.data = data
        self.groupID = groupID
        self.type = type
    }
}
