//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// These represent sort orders.
public enum ItemSortBy: String, Codable, CaseIterable {
    case `default` = "Default"
    case airedEpisodeOrder = "AiredEpisodeOrder"
    case album = "Album"
    case albumArtist = "AlbumArtist"
    case artist = "Artist"
    case dateCreated = "DateCreated"
    case officialRating = "OfficialRating"
    case datePlayed = "DatePlayed"
    case premiereDate = "PremiereDate"
    case startDate = "StartDate"
    case sortName = "SortName"
    case name = "Name"
    case random = "Random"
    case runtime = "Runtime"
    case communityRating = "CommunityRating"
    case productionYear = "ProductionYear"
    case playCount = "PlayCount"
    case criticRating = "CriticRating"
    case isFolder = "IsFolder"
    case isUnplayed = "IsUnplayed"
    case isPlayed = "IsPlayed"
    case seriesSortName = "SeriesSortName"
    case videoBitRate = "VideoBitRate"
    case airTime = "AirTime"
    case studio = "Studio"
    case isFavoriteOrLiked = "IsFavoriteOrLiked"
    case dateLastContentAdded = "DateLastContentAdded"
    case seriesDatePlayed = "SeriesDatePlayed"
    case parentIndexNumber = "ParentIndexNumber"
    case indexNumber = "IndexNumber"
    case similarityScore = "SimilarityScore"
    case searchScore = "SearchScore"
}
