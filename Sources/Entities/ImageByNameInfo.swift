//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct ImageByNameInfo: Codable {
    /// Gets or sets the context.
    public var context: String?
    /// Gets or sets the length of the file.
    public var fileLength: Int64?
    /// Gets or sets the format.
    public var format: String?
    /// Gets or sets the name.
    public var name: String?
    /// Gets or sets the theme.
    public var theme: String?

    public init(context: String? = nil, fileLength: Int64? = nil, format: String? = nil, name: String? = nil, theme: String? = nil) {
        self.context = context
        self.fileLength = fileLength
        self.format = format
        self.name = name
        self.theme = theme
    }
}
