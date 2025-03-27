//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct MusicVideoInfoRemoteSearchQuery: Codable, Hashable {
    /// Gets or sets a value indicating whether disabled providers should be included.
    public var isIncludeDisabledProviders: Bool?
    public var itemID: String?
    public var searchInfo: MusicVideoInfo?
    /// Gets or sets the provider name to search within if set.
    public var searchProviderName: String?

    public init(
        isIncludeDisabledProviders: Bool? = nil,
        itemID: String? = nil,
        searchInfo: MusicVideoInfo? = nil,
        searchProviderName: String? = nil
    ) {
        self.isIncludeDisabledProviders = isIncludeDisabledProviders
        self.itemID = itemID
        self.searchInfo = searchInfo
        self.searchProviderName = searchProviderName
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.isIncludeDisabledProviders = try values.decodeIfPresent(Bool.self, forKey: "IncludeDisabledProviders")
        self.itemID = try values.decodeIfPresent(String.self, forKey: "ItemId")
        self.searchInfo = try values.decodeIfPresent(MusicVideoInfo.self, forKey: "SearchInfo")
        self.searchProviderName = try values.decodeIfPresent(String.self, forKey: "SearchProviderName")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(isIncludeDisabledProviders, forKey: "IncludeDisabledProviders")
        try values.encodeIfPresent(itemID, forKey: "ItemId")
        try values.encodeIfPresent(searchInfo, forKey: "SearchInfo")
        try values.encodeIfPresent(searchProviderName, forKey: "SearchProviderName")
    }
}
