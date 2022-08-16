//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class ImageProviderInfo.
public struct ImageProviderInfo: Codable {
    /// Gets the name.
    public var name: String?
    /// Gets the supported image types.
    public var supportedImages: [ImageType]?

    public init(name: String? = nil, supportedImages: [ImageType]? = nil) {
        self.name = name
        self.supportedImages = supportedImages
    }
}
