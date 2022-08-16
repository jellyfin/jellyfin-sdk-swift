//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class QueueRequestDto.
public struct QueueRequestDto: Codable {
    /// Gets or sets the items to enqueue.
    public var itemIDs: [UUID]?
    /// Enum GroupQueueMode.
    public var mode: GroupQueueMode?

    public init(itemIDs: [UUID]? = nil, mode: GroupQueueMode? = nil) {
        self.itemIDs = itemIDs
        self.mode = mode
    }
}
