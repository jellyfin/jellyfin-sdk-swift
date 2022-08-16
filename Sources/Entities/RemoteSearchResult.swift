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
    public let indexNumber: Int?
    public let indexNumberEnd: Int?
    /// Gets or sets the name.
    public let name: String?
    public let overview: String?
    public let parentIndexNumber: Int?
    public let premiereDate: Date?
    /// Gets or sets the year.
    public let productionYear: Int?
    /// Gets or sets the provider ids.
    public let providerIDs: [String: String]?
    public let searchProviderName: String?

    public init(
        albumArtist: RemoteSearchResult? = nil,
        artists: [RemoteSearchResult]? = nil,
        imageURL: String? = nil,
        indexNumber: Int? = nil,
        indexNumberEnd: Int? = nil,
        name: String? = nil,
        overview: String? = nil,
        parentIndexNumber: Int? = nil,
        premiereDate: Date? = nil,
        productionYear: Int? = nil,
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
}
