//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class ThemeMediaResult.
public struct ThemeMediaResult: Codable {
    /// Gets or sets the items.
    public var items: [BaseItemDto]?
    /// Gets or sets the owner id.
    public var ownerID: UUID?
    /// Gets or sets the index of the first record in Items.
    public var startIndex: Int?
    /// Gets or sets the total number of records available.
    public var totalRecordCount: Int?

    public init(items: [BaseItemDto]? = nil, ownerID: UUID? = nil, startIndex: Int? = nil, totalRecordCount: Int? = nil) {
        self.items = items
        self.ownerID = ownerID
        self.startIndex = startIndex
        self.totalRecordCount = totalRecordCount
    }
}
