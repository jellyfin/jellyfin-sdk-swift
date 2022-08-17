//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct QueryFiltersLegacy: Codable {
    public var genres: [String]?
    public var officialRatings: [String]?
    public var tags: [String]?
    public var years: [Int32]?

    public init(genres: [String]? = nil, officialRatings: [String]? = nil, tags: [String]? = nil, years: [Int32]? = nil) {
        self.genres = genres
        self.officialRatings = officialRatings
        self.tags = tags
        self.years = years
    }
}
