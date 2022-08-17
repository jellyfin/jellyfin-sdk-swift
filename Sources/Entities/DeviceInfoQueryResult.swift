//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct DeviceInfoQueryResult: Codable {
    /// Gets or sets the items.
    public var items: [DeviceInfo]?
    /// Gets or sets the index of the first record in Items.
    public var startIndex: Int32?
    /// Gets or sets the total number of records available.
    public var totalRecordCount: Int32?

    public init(items: [DeviceInfo]? = nil, startIndex: Int32? = nil, totalRecordCount: Int32? = nil) {
        self.items = items
        self.startIndex = startIndex
        self.totalRecordCount = totalRecordCount
    }
}
