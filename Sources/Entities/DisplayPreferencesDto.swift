//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Defines the display preferences for any item that supports them (usually Folders).
public struct DisplayPreferencesDto: Codable, Hashable, Identifiable {
    /// Gets or sets the client.
    public var client: String?
    /// Gets or sets the custom prefs.
    public var customPrefs: [String: String]?
    /// Gets or sets the user id.
    public var id: String?
    /// Gets or sets the index by.
    public var indexBy: String?
    /// Gets or sets the height of the primary image.
    public var primaryImageHeight: Int?
    /// Gets or sets the width of the primary image.
    public var primaryImageWidth: Int?
    /// Gets or sets a value indicating whether [remember indexing].
    public var isRememberIndexing: Bool?
    /// Gets or sets a value indicating whether [remember sorting].
    public var isRememberSorting: Bool?
    /// Gets or sets the scroll direction.
    public var scrollDirection: ScrollDirection?
    /// Gets or sets a value indicating whether to show backdrops on this item.
    public var isShowBackdrop: Bool?
    /// Gets or sets a value indicating whether [show sidebar].
    public var isShowSidebar: Bool?
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
        primaryImageHeight: Int? = nil,
        primaryImageWidth: Int? = nil,
        isRememberIndexing: Bool? = nil,
        isRememberSorting: Bool? = nil,
        scrollDirection: ScrollDirection? = nil,
        isShowBackdrop: Bool? = nil,
        isShowSidebar: Bool? = nil,
        sortBy: String? = nil,
        sortOrder: SortOrder? = nil,
        viewType: String? = nil
    ) {
        self.client = client
        self.customPrefs = customPrefs
        self.id = id
        self.indexBy = indexBy
        self.primaryImageHeight = primaryImageHeight
        self.primaryImageWidth = primaryImageWidth
        self.isRememberIndexing = isRememberIndexing
        self.isRememberSorting = isRememberSorting
        self.scrollDirection = scrollDirection
        self.isShowBackdrop = isShowBackdrop
        self.isShowSidebar = isShowSidebar
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
        self.primaryImageHeight = try values.decodeIfPresent(Int.self, forKey: "PrimaryImageHeight")
        self.primaryImageWidth = try values.decodeIfPresent(Int.self, forKey: "PrimaryImageWidth")
        self.isRememberIndexing = try values.decodeIfPresent(Bool.self, forKey: "RememberIndexing")
        self.isRememberSorting = try values.decodeIfPresent(Bool.self, forKey: "RememberSorting")
        self.scrollDirection = try values.decodeIfPresent(ScrollDirection.self, forKey: "ScrollDirection")
        self.isShowBackdrop = try values.decodeIfPresent(Bool.self, forKey: "ShowBackdrop")
        self.isShowSidebar = try values.decodeIfPresent(Bool.self, forKey: "ShowSidebar")
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
        try values.encodeIfPresent(primaryImageHeight, forKey: "PrimaryImageHeight")
        try values.encodeIfPresent(primaryImageWidth, forKey: "PrimaryImageWidth")
        try values.encodeIfPresent(isRememberIndexing, forKey: "RememberIndexing")
        try values.encodeIfPresent(isRememberSorting, forKey: "RememberSorting")
        try values.encodeIfPresent(scrollDirection, forKey: "ScrollDirection")
        try values.encodeIfPresent(isShowBackdrop, forKey: "ShowBackdrop")
        try values.encodeIfPresent(isShowSidebar, forKey: "ShowSidebar")
        try values.encodeIfPresent(sortBy, forKey: "SortBy")
        try values.encodeIfPresent(sortOrder, forKey: "SortOrder")
        try values.encodeIfPresent(viewType, forKey: "ViewType")
    }
}
