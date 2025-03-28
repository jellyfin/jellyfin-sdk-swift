//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Used to hold information about a user's list of configured virtual folders.
public struct VirtualFolderInfo: Codable, Hashable {
    /// Gets or sets the type of the collection.
    public var collectionType: CollectionTypeOptions?
    /// Gets or sets the item identifier.
    public var itemID: String?
    public var libraryOptions: LibraryOptions?
    /// Gets or sets the locations.
    public var locations: [String]?
    /// Gets or sets the name.
    public var name: String?
    /// Gets or sets the primary image item identifier.
    public var primaryImageItemID: String?
    public var refreshProgress: Double?
    public var refreshStatus: String?

    public init(
        collectionType: CollectionTypeOptions? = nil,
        itemID: String? = nil,
        libraryOptions: LibraryOptions? = nil,
        locations: [String]? = nil,
        name: String? = nil,
        primaryImageItemID: String? = nil,
        refreshProgress: Double? = nil,
        refreshStatus: String? = nil
    ) {
        self.collectionType = collectionType
        self.itemID = itemID
        self.libraryOptions = libraryOptions
        self.locations = locations
        self.name = name
        self.primaryImageItemID = primaryImageItemID
        self.refreshProgress = refreshProgress
        self.refreshStatus = refreshStatus
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.collectionType = try values.decodeIfPresent(CollectionTypeOptions.self, forKey: "CollectionType")
        self.itemID = try values.decodeIfPresent(String.self, forKey: "ItemId")
        self.libraryOptions = try values.decodeIfPresent(LibraryOptions.self, forKey: "LibraryOptions")
        self.locations = try values.decodeIfPresent([String].self, forKey: "Locations")
        self.name = try values.decodeIfPresent(String.self, forKey: "Name")
        self.primaryImageItemID = try values.decodeIfPresent(String.self, forKey: "PrimaryImageItemId")
        self.refreshProgress = try values.decodeIfPresent(Double.self, forKey: "RefreshProgress")
        self.refreshStatus = try values.decodeIfPresent(String.self, forKey: "RefreshStatus")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(collectionType, forKey: "CollectionType")
        try values.encodeIfPresent(itemID, forKey: "ItemId")
        try values.encodeIfPresent(libraryOptions, forKey: "LibraryOptions")
        try values.encodeIfPresent(locations, forKey: "Locations")
        try values.encodeIfPresent(name, forKey: "Name")
        try values.encodeIfPresent(primaryImageItemID, forKey: "PrimaryImageItemId")
        try values.encodeIfPresent(refreshProgress, forKey: "RefreshProgress")
        try values.encodeIfPresent(refreshStatus, forKey: "RefreshStatus")
    }
}
