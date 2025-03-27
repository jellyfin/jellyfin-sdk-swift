//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Lyric model.
public struct LyricLine: Codable, Hashable {
    /// Gets the start time in ticks.
    public var start: Int?
    /// Gets the text of this lyric line.
    public var text: String?

    public init(start: Int? = nil, text: String? = nil) {
        self.start = start
        self.text = text
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.start = try values.decodeIfPresent(Int.self, forKey: "Start")
        self.text = try values.decodeIfPresent(String.self, forKey: "Text")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(start, forKey: "Start")
        try values.encodeIfPresent(text, forKey: "Text")
    }
}
