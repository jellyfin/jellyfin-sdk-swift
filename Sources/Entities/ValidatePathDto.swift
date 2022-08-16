//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Validate path object.
public struct ValidatePathDto: Codable {
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
}
