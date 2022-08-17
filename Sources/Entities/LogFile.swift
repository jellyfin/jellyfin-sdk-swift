//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct LogFile: Codable {
    /// Gets or sets the date created.
    public var dateCreated: Date?
    /// Gets or sets the date modified.
    public var dateModified: Date?
    /// Gets or sets the name.
    public var name: String?
    /// Gets or sets the size.
    public var size: Int64?

    public init(dateCreated: Date? = nil, dateModified: Date? = nil, name: String? = nil, size: Int64? = nil) {
        self.dateCreated = dateCreated
        self.dateModified = dateModified
        self.name = name
        self.size = size
    }
}
