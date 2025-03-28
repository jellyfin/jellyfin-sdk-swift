//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class RemoteImageResult.
public struct RemoteImageResult: Codable, Hashable {
    /// Gets or sets the images.
    public var images: [RemoteImageInfo]?
    /// Gets or sets the providers.
    public var providers: [String]?
    /// Gets or sets the total record count.
    public var totalRecordCount: Int?

    public init(images: [RemoteImageInfo]? = nil, providers: [String]? = nil, totalRecordCount: Int? = nil) {
        self.images = images
        self.providers = providers
        self.totalRecordCount = totalRecordCount
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.images = try values.decodeIfPresent([RemoteImageInfo].self, forKey: "Images")
        self.providers = try values.decodeIfPresent([String].self, forKey: "Providers")
        self.totalRecordCount = try values.decodeIfPresent(Int.self, forKey: "TotalRecordCount")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(images, forKey: "Images")
        try values.encodeIfPresent(providers, forKey: "Providers")
        try values.encodeIfPresent(totalRecordCount, forKey: "TotalRecordCount")
    }
}
