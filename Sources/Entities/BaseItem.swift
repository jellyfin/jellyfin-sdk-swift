//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class BaseItem.
public struct BaseItem: Codable {
    public var container: String?
    public var dateLastSaved: Date?
    public var extraIDs: [UUID]?
    public var height: Int32?
    public var isHD: Bool?
    public var isShortcut: Bool?
    /// Gets or sets the remote trailers.
    public var remoteTrailers: [MediaURL]?
    public var shortcutPath: String?
    public var size: Int64?
    public var isSupportsExternalTransfer: Bool?
    public var width: Int32?

    public init(container: String? = nil, dateLastSaved: Date? = nil, extraIDs: [UUID]? = nil, height: Int32? = nil, isHD: Bool? = nil, isShortcut: Bool? = nil, remoteTrailers: [MediaURL]? = nil, shortcutPath: String? = nil, size: Int64? = nil, isSupportsExternalTransfer: Bool? = nil, width: Int32? = nil) {
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
}
