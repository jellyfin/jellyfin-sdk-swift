//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct ChannelFeatures: Codable, Identifiable {
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
    public var id: UUID?
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
        id: UUID? = nil,
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
}
