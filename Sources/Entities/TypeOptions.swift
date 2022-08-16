//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct TypeOptions: Codable {
    public var imageFetcherOrder: [String]?
    public var imageFetchers: [String]?
    public var imageOptions: [ImageOption]?
    public var metadataFetcherOrder: [String]?
    public var metadataFetchers: [String]?
    public var type: String?

    public init(
        imageFetcherOrder: [String]? = nil,
        imageFetchers: [String]? = nil,
        imageOptions: [ImageOption]? = nil,
        metadataFetcherOrder: [String]? = nil,
        metadataFetchers: [String]? = nil,
        type: String? = nil
    ) {
        self.imageFetcherOrder = imageFetcherOrder
        self.imageFetchers = imageFetchers
        self.imageOptions = imageOptions
        self.metadataFetcherOrder = metadataFetcherOrder
        self.metadataFetchers = metadataFetchers
        self.type = type
    }
}
