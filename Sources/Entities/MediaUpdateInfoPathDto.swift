//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// The media update info path.
public struct MediaUpdateInfoPathDto: Codable, Hashable {
    /// Gets or sets media path.
    public var path: String?
    /// Gets or sets media update type.
    ///
    /// Created, Modified, Deleted.
    public var updateType: String?

    public init(path: String? = nil, updateType: String? = nil) {
        self.path = path
        self.updateType = updateType
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.path = try values.decodeIfPresent(String.self, forKey: "Path")
        self.updateType = try values.decodeIfPresent(String.self, forKey: "UpdateType")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(path, forKey: "Path")
        try values.encodeIfPresent(updateType, forKey: "UpdateType")
    }
}
