//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Client log document response dto.
public struct ClientLogDocumentResponseDto: Codable, Hashable {
    /// Gets the resulting filename.
    public var fileName: String?

    public init(fileName: String? = nil) {
        self.fileName = fileName
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.fileName = try values.decodeIfPresent(String.self, forKey: "FileName")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(fileName, forKey: "FileName")
    }
}
