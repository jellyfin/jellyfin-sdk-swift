//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// LyricLineCue model, holds information about the timing of words within a LyricLine.
public struct LyricLineCue: Codable, Hashable {
    /// Gets the end timestamp the lyric is synced to in ticks.
    public var end: Int?
    /// Gets the end character index of the cue.
    public var endPosition: Int?
    /// Gets the start character index of the cue.
    public var position: Int?
    /// Gets the timestamp the lyric is synced to in ticks.
    public var start: Int?

    public init(end: Int? = nil, endPosition: Int? = nil, position: Int? = nil, start: Int? = nil) {
        self.end = end
        self.endPosition = endPosition
        self.position = position
        self.start = start
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.end = try values.decodeIfPresent(Int.self, forKey: "End")
        self.endPosition = try values.decodeIfPresent(Int.self, forKey: "EndPosition")
        self.position = try values.decodeIfPresent(Int.self, forKey: "Position")
        self.start = try values.decodeIfPresent(Int.self, forKey: "Start")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(end, forKey: "End")
        try values.encodeIfPresent(endPosition, forKey: "EndPosition")
        try values.encodeIfPresent(position, forKey: "Position")
        try values.encodeIfPresent(start, forKey: "Start")
    }
}
