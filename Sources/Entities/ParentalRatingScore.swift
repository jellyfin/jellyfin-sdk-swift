//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// A class representing an parental rating score.
public struct ParentalRatingScore: Codable, Hashable {
    /// Gets or sets the score.
    public var score: Int?
    /// Gets or sets the sub score.
    public var subScore: Int?

    public init(score: Int? = nil, subScore: Int? = nil) {
        self.score = score
        self.subScore = subScore
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.score = try values.decodeIfPresent(Int.self, forKey: "score")
        self.subScore = try values.decodeIfPresent(Int.self, forKey: "subScore")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(score, forKey: "score")
        try values.encodeIfPresent(subScore, forKey: "subScore")
    }
}
