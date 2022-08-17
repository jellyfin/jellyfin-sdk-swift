//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class RemoteImageResult.
public struct RemoteImageResult: Codable {
    /// Gets or sets the images.
    public var images: [RemoteImageInfo]?
    /// Gets or sets the providers.
    public var providers: [String]?
    /// Gets or sets the total record count.
    public var totalRecordCount: Int32?

    public init(images: [RemoteImageInfo]? = nil, providers: [String]? = nil, totalRecordCount: Int32? = nil) {
        self.images = images
        self.providers = providers
        self.totalRecordCount = totalRecordCount
    }
}
