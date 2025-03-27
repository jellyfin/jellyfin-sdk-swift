//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class BaseItem.
public struct BaseItem: Codable, Hashable {
    public var container: String?
    public var dateLastSaved: Date?
    public var extraIDs: [String]?
    public var height: Int?
    public var isHD: Bool?
    public var isShortcut: Bool?
    /// Gets or sets the remote trailers.
    public var remoteTrailers: [MediaURL]?
    public var shortcutPath: String?
    public var size: Int?
    public var isSupportsExternalTransfer: Bool?
    public var width: Int?

    public init(
        container: String? = nil,
        dateLastSaved: Date? = nil,
        extraIDs: [String]? = nil,
        height: Int? = nil,
        isHD: Bool? = nil,
        isShortcut: Bool? = nil,
        remoteTrailers: [MediaURL]? = nil,
        shortcutPath: String? = nil,
        size: Int? = nil,
        isSupportsExternalTransfer: Bool? = nil,
        width: Int? = nil
    ) {
        self.container = container
        self.dateLastSaved = dateLastSaved
        self.extraIDs = extraIDs
        self.height = height
        self.isHD = isHD
        self.isShortcut = isShortcut
        self.remoteTrailers = remoteTrailers
        self.shortcutPath = shortcutPath
        self.size = size
        self.isSupportsExternalTransfer = isSupportsExternalTransfer
        self.width = width
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.container = try values.decodeIfPresent(String.self, forKey: "Container")
        self.dateLastSaved = try values.decodeIfPresent(Date.self, forKey: "DateLastSaved")
        self.extraIDs = try values.decodeIfPresent([String].self, forKey: "ExtraIds")
        self.height = try values.decodeIfPresent(Int.self, forKey: "Height")
        self.isHD = try values.decodeIfPresent(Bool.self, forKey: "IsHD")
        self.isShortcut = try values.decodeIfPresent(Bool.self, forKey: "IsShortcut")
        self.remoteTrailers = try values.decodeIfPresent([MediaURL].self, forKey: "RemoteTrailers")
        self.shortcutPath = try values.decodeIfPresent(String.self, forKey: "ShortcutPath")
        self.size = try values.decodeIfPresent(Int.self, forKey: "Size")
        self.isSupportsExternalTransfer = try values.decodeIfPresent(Bool.self, forKey: "SupportsExternalTransfer")
        self.width = try values.decodeIfPresent(Int.self, forKey: "Width")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(container, forKey: "Container")
        try values.encodeIfPresent(dateLastSaved, forKey: "DateLastSaved")
        try values.encodeIfPresent(extraIDs, forKey: "ExtraIds")
        try values.encodeIfPresent(height, forKey: "Height")
        try values.encodeIfPresent(isHD, forKey: "IsHD")
        try values.encodeIfPresent(isShortcut, forKey: "IsShortcut")
        try values.encodeIfPresent(remoteTrailers, forKey: "RemoteTrailers")
        try values.encodeIfPresent(shortcutPath, forKey: "ShortcutPath")
        try values.encodeIfPresent(size, forKey: "Size")
        try values.encodeIfPresent(isSupportsExternalTransfer, forKey: "SupportsExternalTransfer")
        try values.encodeIfPresent(width, forKey: "Width")
    }
}
