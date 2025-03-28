//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct MessageCommand: Codable, Hashable {
    public var header: String?
    public var text: String
    public var timeoutMs: Int?

    public init(header: String? = nil, text: String, timeoutMs: Int? = nil) {
        self.header = header
        self.text = text
        self.timeoutMs = timeoutMs
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.header = try values.decodeIfPresent(String.self, forKey: "Header")
        self.text = try values.decode(String.self, forKey: "Text")
        self.timeoutMs = try values.decodeIfPresent(Int.self, forKey: "TimeoutMs")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(header, forKey: "Header")
        try values.encode(text, forKey: "Text")
        try values.encodeIfPresent(timeoutMs, forKey: "TimeoutMs")
    }
}
