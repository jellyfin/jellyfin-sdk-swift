//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct GuideInfo: Codable {
    /// Gets or sets the end date.
    public var endDate: Date?
    /// Gets or sets the start date.
    public var startDate: Date?

    public init(endDate: Date? = nil, startDate: Date? = nil) {
        self.endDate = endDate
        self.startDate = startDate
    }
}
