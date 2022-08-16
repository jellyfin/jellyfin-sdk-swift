//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Media Encoder Path Dto.
public struct MediaEncoderPathDto: Codable {
    /// Gets or sets media encoder path.
    public var path: String?
    /// Gets or sets media encoder path type.
    public var pathType: String?

    public init(path: String? = nil, pathType: String? = nil) {
        self.path = path
        self.pathType = pathType
    }
}
