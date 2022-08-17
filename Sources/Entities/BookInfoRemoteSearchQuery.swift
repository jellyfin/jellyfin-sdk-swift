//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct BookInfoRemoteSearchQuery: Codable {
    /// Gets or sets a value indicating whether disabled providers should be included.
    public var isIncludeDisabledProviders: Bool?
    public var itemID: UUID?
    public var searchInfo: BookInfo?
    /// Gets or sets the provider name to search within if set.
    public var searchProviderName: String?

    public init(isIncludeDisabledProviders: Bool? = nil, itemID: UUID? = nil, searchInfo: BookInfo? = nil, searchProviderName: String? = nil) {
        self.isIncludeDisabledProviders = isIncludeDisabledProviders
        self.itemID = itemID
        self.searchInfo = searchInfo
        self.searchProviderName = searchProviderName
    }
}
