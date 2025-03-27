//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Validate path object.
public struct ValidatePathDto: Codable, Hashable {
    /// Gets or sets is path file.
    public var isFile: Bool?
    /// Gets or sets the path.
    public var path: String?
    /// Gets or sets a value indicating whether validate if path is writable.
    public var isValidateWritable: Bool?

    public init(isFile: Bool? = nil, path: String? = nil, isValidateWritable: Bool? = nil) {
        self.isFile = isFile
        self.path = path
        self.isValidateWritable = isValidateWritable
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.isFile = try values.decodeIfPresent(Bool.self, forKey: "IsFile")
        self.path = try values.decodeIfPresent(String.self, forKey: "Path")
        self.isValidateWritable = try values.decodeIfPresent(Bool.self, forKey: "ValidateWritable")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(isFile, forKey: "IsFile")
        try values.encodeIfPresent(path, forKey: "Path")
        try values.encodeIfPresent(isValidateWritable, forKey: "ValidateWritable")
    }
}
