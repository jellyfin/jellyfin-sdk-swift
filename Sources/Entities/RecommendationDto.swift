//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct RecommendationDto: Codable {
    public var baselineItemName: String?
    public var categoryID: UUID?
    public var items: [BaseItemDto]?
    public var recommendationType: RecommendationType?

    public init(baselineItemName: String? = nil, categoryID: UUID? = nil, items: [BaseItemDto]? = nil, recommendationType: RecommendationType? = nil) {
        self.baselineItemName = baselineItemName
        self.categoryID = categoryID
        self.items = items
        self.recommendationType = recommendationType
    }
}
