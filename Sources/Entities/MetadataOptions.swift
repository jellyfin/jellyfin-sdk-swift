//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class MetadataOptions.
public struct MetadataOptions: Codable {
    public var disabledImageFetchers: [String]?
    public var disabledMetadataFetchers: [String]?
    public var disabledMetadataSavers: [String]?
    public var imageFetcherOrder: [String]?
    public var itemType: String?
    public var localMetadataReaderOrder: [String]?
    public var metadataFetcherOrder: [String]?

    public init(
        disabledImageFetchers: [String]? = nil,
        disabledMetadataFetchers: [String]? = nil,
        disabledMetadataSavers: [String]? = nil,
        imageFetcherOrder: [String]? = nil,
        itemType: String? = nil,
        localMetadataReaderOrder: [String]? = nil,
        metadataFetcherOrder: [String]? = nil
    ) {
        self.disabledImageFetchers = disabledImageFetchers
        self.disabledMetadataFetchers = disabledMetadataFetchers
        self.disabledMetadataSavers = disabledMetadataSavers
        self.imageFetcherOrder = imageFetcherOrder
        self.itemType = itemType
        self.localMetadataReaderOrder = localMetadataReaderOrder
        self.metadataFetcherOrder = metadataFetcherOrder
    }
}
