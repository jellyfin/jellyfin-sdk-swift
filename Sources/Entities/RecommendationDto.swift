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

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.baselineItemName = try values.decodeIfPresent(String.self, forKey: "BaselineItemName")
        self.categoryID = try values.decodeIfPresent(UUID.self, forKey: "CategoryId")
        self.items = try values.decodeIfPresent([BaseItemDto].self, forKey: "Items")
        self.recommendationType = try values.decodeIfPresent(RecommendationType.self, forKey: "RecommendationType")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(baselineItemName, forKey: "BaselineItemName")
        try values.encodeIfPresent(categoryID, forKey: "CategoryId")
        try values.encodeIfPresent(items, forKey: "Items")
        try values.encodeIfPresent(recommendationType, forKey: "RecommendationType")
    }
}
