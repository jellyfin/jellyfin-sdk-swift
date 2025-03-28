//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class FontFile.
public struct FontFile: Codable, Hashable {
    /// Gets or sets the date created.
    public var dateCreated: Date?
    /// Gets or sets the date modified.
    public var dateModified: Date?
    /// Gets or sets the name.
    public var name: String?
    /// Gets or sets the size.
    public var size: Int?

    public init(dateCreated: Date? = nil, dateModified: Date? = nil, name: String? = nil, size: Int? = nil) {
        self.dateCreated = dateCreated
        self.dateModified = dateModified
        self.name = name
        self.size = size
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.dateCreated = try values.decodeIfPresent(Date.self, forKey: "DateCreated")
        self.dateModified = try values.decodeIfPresent(Date.self, forKey: "DateModified")
        self.name = try values.decodeIfPresent(String.self, forKey: "Name")
        self.size = try values.decodeIfPresent(Int.self, forKey: "Size")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(dateCreated, forKey: "DateCreated")
        try values.encodeIfPresent(dateModified, forKey: "DateModified")
        try values.encodeIfPresent(name, forKey: "Name")
        try values.encodeIfPresent(size, forKey: "Size")
    }
}
