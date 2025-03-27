//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct MetadataConfiguration: Codable, Hashable {
    public var useFileCreationTimeForDateAdded: Bool?

    public init(useFileCreationTimeForDateAdded: Bool? = nil) {
        self.useFileCreationTimeForDateAdded = useFileCreationTimeForDateAdded
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.useFileCreationTimeForDateAdded = try values.decodeIfPresent(Bool.self, forKey: "UseFileCreationTimeForDateAdded")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(useFileCreationTimeForDateAdded, forKey: "UseFileCreationTimeForDateAdded")
    }
}
