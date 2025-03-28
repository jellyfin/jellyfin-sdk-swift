//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct ImageByNameInfo: Codable, Hashable {
    /// Gets or sets the context.
    public var context: String?
    /// Gets or sets the length of the file.
    public var fileLength: Int?
    /// Gets or sets the format.
    public var format: String?
    /// Gets or sets the name.
    public var name: String?
    /// Gets or sets the theme.
    public var theme: String?

    public init(context: String? = nil, fileLength: Int? = nil, format: String? = nil, name: String? = nil, theme: String? = nil) {
        self.context = context
        self.fileLength = fileLength
        self.format = format
        self.name = name
        self.theme = theme
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.context = try values.decodeIfPresent(String.self, forKey: "Context")
        self.fileLength = try values.decodeIfPresent(Int.self, forKey: "FileLength")
        self.format = try values.decodeIfPresent(String.self, forKey: "Format")
        self.name = try values.decodeIfPresent(String.self, forKey: "Name")
        self.theme = try values.decodeIfPresent(String.self, forKey: "Theme")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(context, forKey: "Context")
        try values.encodeIfPresent(fileLength, forKey: "FileLength")
        try values.encodeIfPresent(format, forKey: "Format")
        try values.encodeIfPresent(name, forKey: "Name")
        try values.encodeIfPresent(theme, forKey: "Theme")
    }
}
