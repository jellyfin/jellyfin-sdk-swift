//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct LiveStreamResponse: Codable, Hashable {
    public var mediaSource: MediaSourceInfo?

    public init(mediaSource: MediaSourceInfo? = nil) {
        self.mediaSource = mediaSource
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.mediaSource = try values.decodeIfPresent(MediaSourceInfo.self, forKey: "MediaSource")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(mediaSource, forKey: "MediaSource")
    }
}
