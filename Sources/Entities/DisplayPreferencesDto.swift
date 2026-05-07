//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Defines the display preferences for any item that supports them (usually Folders).
public struct DisplayPreferencesDto: Codable, Hashable, Identifiable, Sendable {
    /// Gets or sets the client.
    public var client: String?
    /// Gets or sets the custom prefs.
    public var customPrefs: [String: String]?
    /// Gets or sets the user id.
    public var id: String?
    /// Gets or sets the index by.
    public var indexBy: String?
    /// Gets or sets a value indicating whether [remember indexing].
    public var isRememberindexing: Bool?
    /// Gets or sets a value indicating whether [remember sorting].
    public var isRemembersorting: Bool?
    /// Gets or sets a value indicating whether to show backdrops on this item.
    public var isShowbackdrop: Bool?
    /// Gets or sets a value indicating whether [show sidebar].
    public var isShowsidebar: Bool?
    /// Gets or sets the height of the primary image.
    public var primaryImageHeight: Int?
    /// Gets or sets the width of the primary image.
    public var primaryImageWidth: Int?
    /// Gets or sets the scroll direction.
    public var scrollDirection: ScrollDirection?
    /// Gets or sets the sort by.
    public var sortBy: String?
    /// Gets or sets the sort order.
    public var sortOrder: SortOrder?
    /// Gets or sets the type of the view.
    public var viewType: String?

    public init(
        client: String? = nil,
        customPrefs: [String: String]? = nil,
        id: String? = nil,
        indexBy: String? = nil,
        isRememberindexing: Bool? = nil,
        isRemembersorting: Bool? = nil,
        isShowbackdrop: Bool? = nil,
        isShowsidebar: Bool? = nil,
        primaryImageHeight: Int? = nil,
        primaryImageWidth: Int? = nil,
        scrollDirection: ScrollDirection? = nil,
        sortBy: String? = nil,
        sortOrder: SortOrder? = nil,
        viewType: String? = nil
    ) {
        self.client = client
        self.customPrefs = customPrefs
        self.id = id
        self.indexBy = indexBy
        self.isRememberindexing = isRememberindexing
        self.isRemembersorting = isRemembersorting
        self.isShowbackdrop = isShowbackdrop
        self.isShowsidebar = isShowsidebar
        self.primaryImageHeight = primaryImageHeight
        self.primaryImageWidth = primaryImageWidth
        self.scrollDirection = scrollDirection
        self.sortBy = sortBy
        self.sortOrder = sortOrder
        self.viewType = viewType
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.client = try values.decodeIfPresent(String.self, forKey: "Client")
        self.customPrefs = try values.decodeIfPresent([String: String].self, forKey: "CustomPrefs")
        self.id = try values.decodeIfPresent(String.self, forKey: "Id")
        self.indexBy = try values.decodeIfPresent(String.self, forKey: "IndexBy")
        self.isRememberindexing = try values.decodeIfPresent(Bool.self, forKey: "RememberIndexing")
        self.isRemembersorting = try values.decodeIfPresent(Bool.self, forKey: "RememberSorting")
        self.isShowbackdrop = try values.decodeIfPresent(Bool.self, forKey: "ShowBackdrop")
        self.isShowsidebar = try values.decodeIfPresent(Bool.self, forKey: "ShowSidebar")
        self.primaryImageHeight = try values.decodeIfPresent(Int.self, forKey: "PrimaryImageHeight")
        self.primaryImageWidth = try values.decodeIfPresent(Int.self, forKey: "PrimaryImageWidth")
        self.scrollDirection = try values.decodeIfPresent(ScrollDirection.self, forKey: "ScrollDirection")
        self.sortBy = try values.decodeIfPresent(String.self, forKey: "SortBy")
        self.sortOrder = try values.decodeIfPresent(SortOrder.self, forKey: "SortOrder")
        self.viewType = try values.decodeIfPresent(String.self, forKey: "ViewType")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(client, forKey: "Client")
        try values.encodeIfPresent(customPrefs, forKey: "CustomPrefs")
        try values.encodeIfPresent(id, forKey: "Id")
        try values.encodeIfPresent(indexBy, forKey: "IndexBy")
        try values.encodeIfPresent(isRememberindexing, forKey: "RememberIndexing")
        try values.encodeIfPresent(isRemembersorting, forKey: "RememberSorting")
        try values.encodeIfPresent(isShowbackdrop, forKey: "ShowBackdrop")
        try values.encodeIfPresent(isShowsidebar, forKey: "ShowSidebar")
        try values.encodeIfPresent(primaryImageHeight, forKey: "PrimaryImageHeight")
        try values.encodeIfPresent(primaryImageWidth, forKey: "PrimaryImageWidth")
        try values.encodeIfPresent(scrollDirection, forKey: "ScrollDirection")
        try values.encodeIfPresent(sortBy, forKey: "SortBy")
        try values.encodeIfPresent(sortOrder, forKey: "SortOrder")
        try values.encodeIfPresent(viewType, forKey: "ViewType")
    }
}
