//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class SearchHintResult.
public struct SearchHintResult: Codable, Hashable {
    /// Gets the search hints.
    public var searchHints: [SearchHint]?
    /// Gets the total record count.
    public var totalRecordCount: Int?

    public init(searchHints: [SearchHint]? = nil, totalRecordCount: Int? = nil) {
        self.searchHints = searchHints
        self.totalRecordCount = totalRecordCount
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.searchHints = try values.decodeIfPresent([SearchHint].self, forKey: "SearchHints")
        self.totalRecordCount = try values.decodeIfPresent(Int.self, forKey: "TotalRecordCount")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(searchHints, forKey: "SearchHints")
        try values.encodeIfPresent(totalRecordCount, forKey: "TotalRecordCount")
    }
}
