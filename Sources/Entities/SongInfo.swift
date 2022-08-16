//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct SongInfo: Codable {
    public var album: String?
    public var albumArtists: [String]?
    public var artists: [String]?
    public var indexNumber: Int?
    public var isAutomated: Bool?
    /// Gets or sets the metadata country code.
    public var metadataCountryCode: String?
    /// Gets or sets the metadata language.
    public var metadataLanguage: String?
    /// Gets or sets the name.
    public var name: String?
    /// Gets or sets the original title.
    public var originalTitle: String?
    public var parentIndexNumber: Int?
    /// Gets or sets the path.
    public var path: String?
    public var premiereDate: Date?
    /// Gets or sets the provider ids.
    public var providerIDs: [String: String]?
    /// Gets or sets the year.
    public var year: Int?

    public init(
        album: String? = nil,
        albumArtists: [String]? = nil,
        artists: [String]? = nil,
        indexNumber: Int? = nil,
        isAutomated: Bool? = nil,
        metadataCountryCode: String? = nil,
        metadataLanguage: String? = nil,
        name: String? = nil,
        originalTitle: String? = nil,
        parentIndexNumber: Int? = nil,
        path: String? = nil,
        premiereDate: Date? = nil,
        providerIDs: [String: String]? = nil,
        year: Int? = nil
    ) {
        self.album = album
        self.albumArtists = albumArtists
        self.artists = artists
        self.indexNumber = indexNumber
        self.isAutomated = isAutomated
        self.metadataCountryCode = metadataCountryCode
        self.metadataLanguage = metadataLanguage
        self.name = name
        self.originalTitle = originalTitle
        self.parentIndexNumber = parentIndexNumber
        self.path = path
        self.premiereDate = premiereDate
        self.providerIDs = providerIDs
        self.year = year
    }
}
