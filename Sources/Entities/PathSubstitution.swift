//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Defines the MediaBrowser.Model.Configuration.PathSubstitution.
public struct PathSubstitution: Codable {
    /// Gets or sets the value to substitute.
    public var from: String?
    /// Gets or sets the value to substitution with.
    public var to: String?

    public init(from: String? = nil, to: String? = nil) {
        self.from = from
        self.to = to
    }
}
