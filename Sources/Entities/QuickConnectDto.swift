//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// The quick connect request body.
public struct QuickConnectDto: Codable {
    /// Gets or sets the quick connect secret.
    public var secret: String

    public init(secret: String) {
        self.secret = secret
    }
}
