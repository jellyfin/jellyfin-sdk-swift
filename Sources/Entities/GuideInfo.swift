//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct GuideInfo: Codable, Hashable {
    /// Gets or sets the end date.
    public var endDate: Date?
    /// Gets or sets the start date.
    public var startDate: Date?

    public init(endDate: Date? = nil, startDate: Date? = nil) {
        self.endDate = endDate
        self.startDate = startDate
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.endDate = try values.decodeIfPresent(Date.self, forKey: "EndDate")
        self.startDate = try values.decodeIfPresent(Date.self, forKey: "StartDate")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(endDate, forKey: "EndDate")
        try values.encodeIfPresent(startDate, forKey: "StartDate")
    }
}
