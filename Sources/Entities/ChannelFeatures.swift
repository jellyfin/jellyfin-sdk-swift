//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct ChannelFeatures: Codable, Hashable, Identifiable {
    /// Gets or sets the automatic refresh levels.
    public var autoRefreshLevels: Int?
    /// Gets or sets a value indicating whether this instance can filter.
    public var canFilter: Bool?
    /// Gets or sets a value indicating whether this instance can search.
    public var canSearch: Bool?
    /// Gets or sets the content types.
    public var contentTypes: [ChannelMediaContentType]?
    /// Gets or sets the default sort orders.
    public var defaultSortFields: [ChannelItemSortField]?
    /// Gets or sets the identifier.
    public var id: String?
    /// Gets or sets the maximum number of records the channel allows retrieving at a time.
    public var maxPageSize: Int?
    /// Gets or sets the media types.
    public var mediaTypes: [ChannelMediaType]?
    /// Gets or sets the name.
    public var name: String?
    /// Gets or sets a value indicating whether [supports content downloading].
    public var isSupportsContentDownloading: Bool?
    /// Gets or sets a value indicating whether [supports latest media].
    public var isSupportsLatestMedia: Bool?
    /// Gets or sets a value indicating whether a sort ascending/descending toggle is supported.
    public var isSupportsSortOrderToggle: Bool?

    public init(
        autoRefreshLevels: Int? = nil,
        canFilter: Bool? = nil,
        canSearch: Bool? = nil,
        contentTypes: [ChannelMediaContentType]? = nil,
        defaultSortFields: [ChannelItemSortField]? = nil,
        id: String? = nil,
        maxPageSize: Int? = nil,
        mediaTypes: [ChannelMediaType]? = nil,
        name: String? = nil,
        isSupportsContentDownloading: Bool? = nil,
        isSupportsLatestMedia: Bool? = nil,
        isSupportsSortOrderToggle: Bool? = nil
    ) {
        self.autoRefreshLevels = autoRefreshLevels
        self.canFilter = canFilter
        self.canSearch = canSearch
        self.contentTypes = contentTypes
        self.defaultSortFields = defaultSortFields
        self.id = id
        self.maxPageSize = maxPageSize
        self.mediaTypes = mediaTypes
        self.name = name
        self.isSupportsContentDownloading = isSupportsContentDownloading
        self.isSupportsLatestMedia = isSupportsLatestMedia
        self.isSupportsSortOrderToggle = isSupportsSortOrderToggle
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.autoRefreshLevels = try values.decodeIfPresent(Int.self, forKey: "AutoRefreshLevels")
        self.canFilter = try values.decodeIfPresent(Bool.self, forKey: "CanFilter")
        self.canSearch = try values.decodeIfPresent(Bool.self, forKey: "CanSearch")
        self.contentTypes = try values.decodeIfPresent([ChannelMediaContentType].self, forKey: "ContentTypes")
        self.defaultSortFields = try values.decodeIfPresent([ChannelItemSortField].self, forKey: "DefaultSortFields")
        self.id = try values.decodeIfPresent(String.self, forKey: "Id")
        self.maxPageSize = try values.decodeIfPresent(Int.self, forKey: "MaxPageSize")
        self.mediaTypes = try values.decodeIfPresent([ChannelMediaType].self, forKey: "MediaTypes")
        self.name = try values.decodeIfPresent(String.self, forKey: "Name")
        self.isSupportsContentDownloading = try values.decodeIfPresent(Bool.self, forKey: "SupportsContentDownloading")
        self.isSupportsLatestMedia = try values.decodeIfPresent(Bool.self, forKey: "SupportsLatestMedia")
        self.isSupportsSortOrderToggle = try values.decodeIfPresent(Bool.self, forKey: "SupportsSortOrderToggle")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(autoRefreshLevels, forKey: "AutoRefreshLevels")
        try values.encodeIfPresent(canFilter, forKey: "CanFilter")
        try values.encodeIfPresent(canSearch, forKey: "CanSearch")
        try values.encodeIfPresent(contentTypes, forKey: "ContentTypes")
        try values.encodeIfPresent(defaultSortFields, forKey: "DefaultSortFields")
        try values.encodeIfPresent(id, forKey: "Id")
        try values.encodeIfPresent(maxPageSize, forKey: "MaxPageSize")
        try values.encodeIfPresent(mediaTypes, forKey: "MediaTypes")
        try values.encodeIfPresent(name, forKey: "Name")
        try values.encodeIfPresent(isSupportsContentDownloading, forKey: "SupportsContentDownloading")
        try values.encodeIfPresent(isSupportsLatestMedia, forKey: "SupportsLatestMedia")
        try values.encodeIfPresent(isSupportsSortOrderToggle, forKey: "SupportsSortOrderToggle")
    }
}
