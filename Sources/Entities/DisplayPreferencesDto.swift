//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Defines the display preferences for any item that supports them (usually Folders).
public struct DisplayPreferencesDto: Codable, Identifiable {
    /// Gets or sets the client.
    public var client: String?
    /// Gets or sets the custom prefs.
    public var customPrefs: [String: String]?
    /// Gets or sets the user id.
    public var id: String?
    /// Gets or sets the index by.
    public var indexBy: String?
    /// Gets or sets the height of the primary image.
    public var primaryImageHeight: Int32?
    /// Gets or sets the width of the primary image.
    public var primaryImageWidth: Int32?
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

    public init(client: String? = nil, customPrefs: [String: String]? = nil, id: String? = nil, indexBy: String? = nil, primaryImageHeight: Int32? = nil, primaryImageWidth: Int32? = nil, isRememberIndexing: Bool? = nil, isRememberSorting: Bool? = nil, scrollDirection: ScrollDirection? = nil, isShowBackdrop: Bool? = nil, isShowSidebar: Bool? = nil, sortBy: String? = nil, sortOrder: SortOrder? = nil, viewType: String? = nil) {
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
}
