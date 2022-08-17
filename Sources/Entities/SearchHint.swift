//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class SearchHintResult.
public struct SearchHint: Codable, Identifiable {
    /// Gets or sets the album.
    public var album: String?
    /// Gets or sets the album artist.
    public var albumArtist: String?
    public var albumID: UUID?
    /// Gets or sets the artists.
    public var artists: [String]?
    /// Gets or sets the backdrop image item identifier.
    public var backdropImageItemID: String?
    /// Gets or sets the backdrop image tag.
    public var backdropImageTag: String?
    /// Gets or sets the channel identifier.
    public var channelID: UUID?
    /// Gets or sets the name of the channel.
    public var channelName: String?
    public var endDate: Date?
    /// Gets or sets the episode count.
    public var episodeCount: Int32?
    public var id: UUID?
    /// Gets or sets the index number.
    public var indexNumber: Int32?
    public var isFolder: Bool?
    /// Gets or sets the item id.
    public var itemID: UUID?
    /// Gets or sets the matched term.
    public var matchedTerm: String?
    /// Gets or sets the type of the media.
    public var mediaType: String?
    /// Gets or sets the name.
    public var name: String?
    /// Gets or sets the parent index number.
    public var parentIndexNumber: Int32?
    /// Gets or sets the primary image aspect ratio.
    public var primaryImageAspectRatio: Double?
    /// Gets or sets the image tag.
    public var primaryImageTag: String?
    /// Gets or sets the production year.
    public var productionYear: Int32?
    /// Gets or sets the run time ticks.
    public var runTimeTicks: Int64?
    /// Gets or sets the series.
    public var series: String?
    /// Gets or sets the song count.
    public var songCount: Int32?
    public var startDate: Date?
    public var status: String?
    /// Gets or sets the thumb image item identifier.
    public var thumbImageItemID: String?
    /// Gets or sets the thumb image tag.
    public var thumbImageTag: String?
    /// Gets or sets the type.
    public var type: String?

    public init(album: String? = nil, albumArtist: String? = nil, albumID: UUID? = nil, artists: [String]? = nil, backdropImageItemID: String? = nil, backdropImageTag: String? = nil, channelID: UUID? = nil, channelName: String? = nil, endDate: Date? = nil, episodeCount: Int32? = nil, id: UUID? = nil, indexNumber: Int32? = nil, isFolder: Bool? = nil, itemID: UUID? = nil, matchedTerm: String? = nil, mediaType: String? = nil, name: String? = nil, parentIndexNumber: Int32? = nil, primaryImageAspectRatio: Double? = nil, primaryImageTag: String? = nil, productionYear: Int32? = nil, runTimeTicks: Int64? = nil, series: String? = nil, songCount: Int32? = nil, startDate: Date? = nil, status: String? = nil, thumbImageItemID: String? = nil, thumbImageTag: String? = nil, type: String? = nil) {
        self.album = album
        self.albumArtist = albumArtist
        self.albumID = albumID
        self.artists = artists
        self.backdropImageItemID = backdropImageItemID
        self.backdropImageTag = backdropImageTag
        self.channelID = channelID
        self.channelName = channelName
        self.endDate = endDate
        self.episodeCount = episodeCount
        self.id = id
        self.indexNumber = indexNumber
        self.isFolder = isFolder
        self.itemID = itemID
        self.matchedTerm = matchedTerm
        self.mediaType = mediaType
        self.name = name
        self.parentIndexNumber = parentIndexNumber
        self.primaryImageAspectRatio = primaryImageAspectRatio
        self.primaryImageTag = primaryImageTag
        self.productionYear = productionYear
        self.runTimeTicks = runTimeTicks
        self.series = series
        self.songCount = songCount
        self.startDate = startDate
        self.status = status
        self.thumbImageItemID = thumbImageItemID
        self.thumbImageTag = thumbImageTag
        self.type = type
    }
}
