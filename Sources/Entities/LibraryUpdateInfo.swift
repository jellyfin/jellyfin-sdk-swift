//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class LibraryUpdateInfo.
public struct LibraryUpdateInfo: Codable, Hashable {
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

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.collectionFolders = try values.decodeIfPresent([String].self, forKey: "CollectionFolders")
        self.foldersAddedTo = try values.decodeIfPresent([String].self, forKey: "FoldersAddedTo")
        self.foldersRemovedFrom = try values.decodeIfPresent([String].self, forKey: "FoldersRemovedFrom")
        self.isEmpty = try values.decodeIfPresent(Bool.self, forKey: "IsEmpty")
        self.itemsAdded = try values.decodeIfPresent([String].self, forKey: "ItemsAdded")
        self.itemsRemoved = try values.decodeIfPresent([String].self, forKey: "ItemsRemoved")
        self.itemsUpdated = try values.decodeIfPresent([String].self, forKey: "ItemsUpdated")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(collectionFolders, forKey: "CollectionFolders")
        try values.encodeIfPresent(foldersAddedTo, forKey: "FoldersAddedTo")
        try values.encodeIfPresent(foldersRemovedFrom, forKey: "FoldersRemovedFrom")
        try values.encodeIfPresent(isEmpty, forKey: "IsEmpty")
        try values.encodeIfPresent(itemsAdded, forKey: "ItemsAdded")
        try values.encodeIfPresent(itemsRemoved, forKey: "ItemsRemoved")
        try values.encodeIfPresent(itemsUpdated, forKey: "ItemsUpdated")
    }
}
