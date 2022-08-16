//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class LibraryUpdateInfo.
public struct LibraryUpdateInfo: Codable {
    public var collectionFolders: [String]?
    /// Gets or sets the folders added to.
    public var foldersAddedTo: [String]?
    /// Gets or sets the folders removed from.
    public var foldersRemovedFrom: [String]?
    public var isEmpty: Bool?
    /// Gets or sets the items added.
    public var itemsAdded: [String]?
    /// Gets or sets the items removed.
    public var itemsRemoved: [String]?
    /// Gets or sets the items updated.
    public var itemsUpdated: [String]?

    public init(
        collectionFolders: [String]? = nil,
        foldersAddedTo: [String]? = nil,
        foldersRemovedFrom: [String]? = nil,
        isEmpty: Bool? = nil,
        itemsAdded: [String]? = nil,
        itemsRemoved: [String]? = nil,
        itemsUpdated: [String]? = nil
    ) {
        self.collectionFolders = collectionFolders
        self.foldersAddedTo = foldersAddedTo
        self.foldersRemovedFrom = foldersRemovedFrom
        self.isEmpty = isEmpty
        self.itemsAdded = itemsAdded
        self.itemsRemoved = itemsRemoved
        self.itemsUpdated = itemsUpdated
    }
}
