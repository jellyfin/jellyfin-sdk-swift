//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

public final class RemoteSearchResult: Codable {
    public let albumArtist: RemoteSearchResult?
    public let artists: [RemoteSearchResult]?
    public let imageURL: String?
    public let indexNumber: Int32?
    public let indexNumberEnd: Int32?
    /// Gets or sets the name.
    public let name: String?
    public let overview: String?
    public let parentIndexNumber: Int32?
    public let premiereDate: Date?
    /// Gets or sets the year.
    public let productionYear: Int32?
    /// Gets or sets the provider ids.
    public let providerIDs: [String: String]?
    public let searchProviderName: String?

    public init(
        albumArtist: RemoteSearchResult? = nil,
        artists: [RemoteSearchResult]? = nil,
        imageURL: String? = nil,
        indexNumber: Int32? = nil,
        indexNumberEnd: Int32? = nil,
        name: String? = nil,
        overview: String? = nil,
        parentIndexNumber: Int32? = nil,
        premiereDate: Date? = nil,
        productionYear: Int32? = nil,
        providerIDs: [String: String]? = nil,
        searchProviderName: String? = nil
    ) {
        self.albumArtist = albumArtist
        self.artists = artists
        self.imageURL = imageURL
        self.indexNumber = indexNumber
        self.indexNumberEnd = indexNumberEnd
        self.name = name
        self.overview = overview
        self.parentIndexNumber = parentIndexNumber
        self.premiereDate = premiereDate
        self.productionYear = productionYear
        self.providerIDs = providerIDs
        self.searchProviderName = searchProviderName
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.albumArtist = try values.decodeIfPresent(RemoteSearchResult.self, forKey: "AlbumArtist")
        self.artists = try values.decodeIfPresent([RemoteSearchResult].self, forKey: "Artists")
        self.imageURL = try values.decodeIfPresent(String.self, forKey: "ImageUrl")
        self.indexNumber = try values.decodeIfPresent(Int32.self, forKey: "IndexNumber")
        self.indexNumberEnd = try values.decodeIfPresent(Int32.self, forKey: "IndexNumberEnd")
        self.name = try values.decodeIfPresent(String.self, forKey: "Name")
        self.overview = try values.decodeIfPresent(String.self, forKey: "Overview")
        self.parentIndexNumber = try values.decodeIfPresent(Int32.self, forKey: "ParentIndexNumber")
        self.premiereDate = try values.decodeIfPresent(Date.self, forKey: "PremiereDate")
        self.productionYear = try values.decodeIfPresent(Int32.self, forKey: "ProductionYear")
        self.providerIDs = try values.decodeIfPresent([String: String].self, forKey: "ProviderIds")
        self.searchProviderName = try values.decodeIfPresent(String.self, forKey: "SearchProviderName")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(albumArtist, forKey: "AlbumArtist")
        try values.encodeIfPresent(artists, forKey: "Artists")
        try values.encodeIfPresent(imageURL, forKey: "ImageUrl")
        try values.encodeIfPresent(indexNumber, forKey: "IndexNumber")
        try values.encodeIfPresent(indexNumberEnd, forKey: "IndexNumberEnd")
        try values.encodeIfPresent(name, forKey: "Name")
        try values.encodeIfPresent(overview, forKey: "Overview")
        try values.encodeIfPresent(parentIndexNumber, forKey: "ParentIndexNumber")
        try values.encodeIfPresent(premiereDate, forKey: "PremiereDate")
        try values.encodeIfPresent(productionYear, forKey: "ProductionYear")
        try values.encodeIfPresent(providerIDs, forKey: "ProviderIds")
        try values.encodeIfPresent(searchProviderName, forKey: "SearchProviderName")
    }
}
