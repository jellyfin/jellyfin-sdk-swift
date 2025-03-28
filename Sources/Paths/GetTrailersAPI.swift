//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation
import Get
import URLQueryEncoder

public extension Paths {
    /// Finds movies and trailers similar to a given trailer.
    static func getTrailers(parameters: GetTrailersParameters? = nil) -> Request<JellyfinAPI.BaseItemDtoQueryResult> {
        Request(path: "/Trailers", method: "GET", query: parameters?.asQuery, id: "GetTrailers")
    }

    struct GetTrailersParameters {
        public var userID: String?
        public var maxOfficialRating: String?
        public var hasThemeSong: Bool?
        public var hasThemeVideo: Bool?
        public var hasSubtitles: Bool?
        public var hasSpecialFeature: Bool?
        public var hasTrailer: Bool?
        public var adjacentTo: String?
        public var parentIndexNumber: Int?
        public var hasParentalRating: Bool?
        public var isHd: Bool?
        public var isIs4K: Bool?
        public var locationTypes: [JellyfinAPI.LocationType]?
        public var excludeLocationTypes: [JellyfinAPI.LocationType]?
        public var isMissing: Bool?
        public var isUnaired: Bool?
        public var minCommunityRating: Double?
        public var minCriticRating: Double?
        public var minPremiereDate: Date?
        public var minDateLastSaved: Date?
        public var minDateLastSavedForUser: Date?
        public var maxPremiereDate: Date?
        public var hasOverview: Bool?
        public var hasImdbID: Bool?
        public var hasTmdbID: Bool?
        public var hasTvdbID: Bool?
        public var isMovie: Bool?
        public var isSeries: Bool?
        public var isNews: Bool?
        public var isKids: Bool?
        public var isSports: Bool?
        public var excludeItemIDs: [String]?
        public var startIndex: Int?
        public var limit: Int?
        public var isRecursive: Bool?
        public var searchTerm: String?
        public var sortOrder: [JellyfinAPI.SortOrder]?
        public var parentID: String?
        public var fields: [JellyfinAPI.ItemFields]?
        public var excludeItemTypes: [JellyfinAPI.BaseItemKind]?
        public var filters: [JellyfinAPI.ItemFilter]?
        public var isFavorite: Bool?
        public var mediaTypes: [JellyfinAPI.MediaType]?
        public var imageTypes: [JellyfinAPI.ImageType]?
        public var sortBy: [JellyfinAPI.ItemSortBy]?
        public var isPlayed: Bool?
        public var genres: [String]?
        public var officialRatings: [String]?
        public var tags: [String]?
        public var years: [Int]?
        public var enableUserData: Bool?
        public var imageTypeLimit: Int?
        public var enableImageTypes: [JellyfinAPI.ImageType]?
        public var person: String?
        public var personIDs: [String]?
        public var personTypes: [String]?
        public var studios: [String]?
        public var artists: [String]?
        public var excludeArtistIDs: [String]?
        public var artistIDs: [String]?
        public var albumArtistIDs: [String]?
        public var contributingArtistIDs: [String]?
        public var albums: [String]?
        public var albumIDs: [String]?
        public var ids: [String]?
        public var videoTypes: [JellyfinAPI.VideoType]?
        public var minOfficialRating: String?
        public var isLocked: Bool?
        public var isPlaceHolder: Bool?
        public var hasOfficialRating: Bool?
        public var isCollapseBoxSetItems: Bool?
        public var minWidth: Int?
        public var minHeight: Int?
        public var maxWidth: Int?
        public var maxHeight: Int?
        public var isIs3D: Bool?
        public var seriesStatus: [JellyfinAPI.SeriesStatus]?
        public var nameStartsWithOrGreater: String?
        public var nameStartsWith: String?
        public var nameLessThan: String?
        public var studioIDs: [String]?
        public var genreIDs: [String]?
        public var enableTotalRecordCount: Bool?
        public var enableImages: Bool?

        public init(
            userID: String? = nil,
            maxOfficialRating: String? = nil,
            hasThemeSong: Bool? = nil,
            hasThemeVideo: Bool? = nil,
            hasSubtitles: Bool? = nil,
            hasSpecialFeature: Bool? = nil,
            hasTrailer: Bool? = nil,
            adjacentTo: String? = nil,
            parentIndexNumber: Int? = nil,
            hasParentalRating: Bool? = nil,
            isHd: Bool? = nil,
            isIs4K: Bool? = nil,
            locationTypes: [JellyfinAPI.LocationType]? = nil,
            excludeLocationTypes: [JellyfinAPI.LocationType]? = nil,
            isMissing: Bool? = nil,
            isUnaired: Bool? = nil,
            minCommunityRating: Double? = nil,
            minCriticRating: Double? = nil,
            minPremiereDate: Date? = nil,
            minDateLastSaved: Date? = nil,
            minDateLastSavedForUser: Date? = nil,
            maxPremiereDate: Date? = nil,
            hasOverview: Bool? = nil,
            hasImdbID: Bool? = nil,
            hasTmdbID: Bool? = nil,
            hasTvdbID: Bool? = nil,
            isMovie: Bool? = nil,
            isSeries: Bool? = nil,
            isNews: Bool? = nil,
            isKids: Bool? = nil,
            isSports: Bool? = nil,
            excludeItemIDs: [String]? = nil,
            startIndex: Int? = nil,
            limit: Int? = nil,
            isRecursive: Bool? = nil,
            searchTerm: String? = nil,
            sortOrder: [JellyfinAPI.SortOrder]? = nil,
            parentID: String? = nil,
            fields: [JellyfinAPI.ItemFields]? = nil,
            excludeItemTypes: [JellyfinAPI.BaseItemKind]? = nil,
            filters: [JellyfinAPI.ItemFilter]? = nil,
            isFavorite: Bool? = nil,
            mediaTypes: [JellyfinAPI.MediaType]? = nil,
            imageTypes: [JellyfinAPI.ImageType]? = nil,
            sortBy: [JellyfinAPI.ItemSortBy]? = nil,
            isPlayed: Bool? = nil,
            genres: [String]? = nil,
            officialRatings: [String]? = nil,
            tags: [String]? = nil,
            years: [Int]? = nil,
            enableUserData: Bool? = nil,
            imageTypeLimit: Int? = nil,
            enableImageTypes: [JellyfinAPI.ImageType]? = nil,
            person: String? = nil,
            personIDs: [String]? = nil,
            personTypes: [String]? = nil,
            studios: [String]? = nil,
            artists: [String]? = nil,
            excludeArtistIDs: [String]? = nil,
            artistIDs: [String]? = nil,
            albumArtistIDs: [String]? = nil,
            contributingArtistIDs: [String]? = nil,
            albums: [String]? = nil,
            albumIDs: [String]? = nil,
            ids: [String]? = nil,
            videoTypes: [JellyfinAPI.VideoType]? = nil,
            minOfficialRating: String? = nil,
            isLocked: Bool? = nil,
            isPlaceHolder: Bool? = nil,
            hasOfficialRating: Bool? = nil,
            isCollapseBoxSetItems: Bool? = nil,
            minWidth: Int? = nil,
            minHeight: Int? = nil,
            maxWidth: Int? = nil,
            maxHeight: Int? = nil,
            isIs3D: Bool? = nil,
            seriesStatus: [JellyfinAPI.SeriesStatus]? = nil,
            nameStartsWithOrGreater: String? = nil,
            nameStartsWith: String? = nil,
            nameLessThan: String? = nil,
            studioIDs: [String]? = nil,
            genreIDs: [String]? = nil,
            enableTotalRecordCount: Bool? = nil,
            enableImages: Bool? = nil
        ) {
            self.userID = userID
            self.maxOfficialRating = maxOfficialRating
            self.hasThemeSong = hasThemeSong
            self.hasThemeVideo = hasThemeVideo
            self.hasSubtitles = hasSubtitles
            self.hasSpecialFeature = hasSpecialFeature
            self.hasTrailer = hasTrailer
            self.adjacentTo = adjacentTo
            self.parentIndexNumber = parentIndexNumber
            self.hasParentalRating = hasParentalRating
            self.isHd = isHd
            self.isIs4K = isIs4K
            self.locationTypes = locationTypes
            self.excludeLocationTypes = excludeLocationTypes
            self.isMissing = isMissing
            self.isUnaired = isUnaired
            self.minCommunityRating = minCommunityRating
            self.minCriticRating = minCriticRating
            self.minPremiereDate = minPremiereDate
            self.minDateLastSaved = minDateLastSaved
            self.minDateLastSavedForUser = minDateLastSavedForUser
            self.maxPremiereDate = maxPremiereDate
            self.hasOverview = hasOverview
            self.hasImdbID = hasImdbID
            self.hasTmdbID = hasTmdbID
            self.hasTvdbID = hasTvdbID
            self.isMovie = isMovie
            self.isSeries = isSeries
            self.isNews = isNews
            self.isKids = isKids
            self.isSports = isSports
            self.excludeItemIDs = excludeItemIDs
            self.startIndex = startIndex
            self.limit = limit
            self.isRecursive = isRecursive
            self.searchTerm = searchTerm
            self.sortOrder = sortOrder
            self.parentID = parentID
            self.fields = fields
            self.excludeItemTypes = excludeItemTypes
            self.filters = filters
            self.isFavorite = isFavorite
            self.mediaTypes = mediaTypes
            self.imageTypes = imageTypes
            self.sortBy = sortBy
            self.isPlayed = isPlayed
            self.genres = genres
            self.officialRatings = officialRatings
            self.tags = tags
            self.years = years
            self.enableUserData = enableUserData
            self.imageTypeLimit = imageTypeLimit
            self.enableImageTypes = enableImageTypes
            self.person = person
            self.personIDs = personIDs
            self.personTypes = personTypes
            self.studios = studios
            self.artists = artists
            self.excludeArtistIDs = excludeArtistIDs
            self.artistIDs = artistIDs
            self.albumArtistIDs = albumArtistIDs
            self.contributingArtistIDs = contributingArtistIDs
            self.albums = albums
            self.albumIDs = albumIDs
            self.ids = ids
            self.videoTypes = videoTypes
            self.minOfficialRating = minOfficialRating
            self.isLocked = isLocked
            self.isPlaceHolder = isPlaceHolder
            self.hasOfficialRating = hasOfficialRating
            self.isCollapseBoxSetItems = isCollapseBoxSetItems
            self.minWidth = minWidth
            self.minHeight = minHeight
            self.maxWidth = maxWidth
            self.maxHeight = maxHeight
            self.isIs3D = isIs3D
            self.seriesStatus = seriesStatus
            self.nameStartsWithOrGreater = nameStartsWithOrGreater
            self.nameStartsWith = nameStartsWith
            self.nameLessThan = nameLessThan
            self.studioIDs = studioIDs
            self.genreIDs = genreIDs
            self.enableTotalRecordCount = enableTotalRecordCount
            self.enableImages = enableImages
        }

        public var asQuery: [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(userID, forKey: "userId")
            encoder.encode(maxOfficialRating, forKey: "maxOfficialRating")
            encoder.encode(hasThemeSong, forKey: "hasThemeSong")
            encoder.encode(hasThemeVideo, forKey: "hasThemeVideo")
            encoder.encode(hasSubtitles, forKey: "hasSubtitles")
            encoder.encode(hasSpecialFeature, forKey: "hasSpecialFeature")
            encoder.encode(hasTrailer, forKey: "hasTrailer")
            encoder.encode(adjacentTo, forKey: "adjacentTo")
            encoder.encode(parentIndexNumber, forKey: "parentIndexNumber")
            encoder.encode(hasParentalRating, forKey: "hasParentalRating")
            encoder.encode(isHd, forKey: "isHd")
            encoder.encode(isIs4K, forKey: "is4K")
            encoder.encode(locationTypes, forKey: "locationTypes")
            encoder.encode(excludeLocationTypes, forKey: "excludeLocationTypes")
            encoder.encode(isMissing, forKey: "isMissing")
            encoder.encode(isUnaired, forKey: "isUnaired")
            encoder.encode(minCommunityRating, forKey: "minCommunityRating")
            encoder.encode(minCriticRating, forKey: "minCriticRating")
            encoder.encode(minPremiereDate, forKey: "minPremiereDate")
            encoder.encode(minDateLastSaved, forKey: "minDateLastSaved")
            encoder.encode(minDateLastSavedForUser, forKey: "minDateLastSavedForUser")
            encoder.encode(maxPremiereDate, forKey: "maxPremiereDate")
            encoder.encode(hasOverview, forKey: "hasOverview")
            encoder.encode(hasImdbID, forKey: "hasImdbId")
            encoder.encode(hasTmdbID, forKey: "hasTmdbId")
            encoder.encode(hasTvdbID, forKey: "hasTvdbId")
            encoder.encode(isMovie, forKey: "isMovie")
            encoder.encode(isSeries, forKey: "isSeries")
            encoder.encode(isNews, forKey: "isNews")
            encoder.encode(isKids, forKey: "isKids")
            encoder.encode(isSports, forKey: "isSports")
            encoder.encode(excludeItemIDs, forKey: "excludeItemIds")
            encoder.encode(startIndex, forKey: "startIndex")
            encoder.encode(limit, forKey: "limit")
            encoder.encode(isRecursive, forKey: "recursive")
            encoder.encode(searchTerm, forKey: "searchTerm")
            encoder.encode(sortOrder, forKey: "sortOrder")
            encoder.encode(parentID, forKey: "parentId")
            encoder.encode(fields, forKey: "fields")
            encoder.encode(excludeItemTypes, forKey: "excludeItemTypes")
            encoder.encode(filters, forKey: "filters")
            encoder.encode(isFavorite, forKey: "isFavorite")
            encoder.encode(mediaTypes, forKey: "mediaTypes")
            encoder.encode(imageTypes, forKey: "imageTypes")
            encoder.encode(sortBy, forKey: "sortBy")
            encoder.encode(isPlayed, forKey: "isPlayed")
            encoder.encode(genres, forKey: "genres")
            encoder.encode(officialRatings, forKey: "officialRatings")
            encoder.encode(tags, forKey: "tags")
            encoder.encode(years, forKey: "years")
            encoder.encode(enableUserData, forKey: "enableUserData")
            encoder.encode(imageTypeLimit, forKey: "imageTypeLimit")
            encoder.encode(enableImageTypes, forKey: "enableImageTypes")
            encoder.encode(person, forKey: "person")
            encoder.encode(personIDs, forKey: "personIds")
            encoder.encode(personTypes, forKey: "personTypes")
            encoder.encode(studios, forKey: "studios")
            encoder.encode(artists, forKey: "artists")
            encoder.encode(excludeArtistIDs, forKey: "excludeArtistIds")
            encoder.encode(artistIDs, forKey: "artistIds")
            encoder.encode(albumArtistIDs, forKey: "albumArtistIds")
            encoder.encode(contributingArtistIDs, forKey: "contributingArtistIds")
            encoder.encode(albums, forKey: "albums")
            encoder.encode(albumIDs, forKey: "albumIds")
            encoder.encode(ids, forKey: "ids")
            encoder.encode(videoTypes, forKey: "videoTypes")
            encoder.encode(minOfficialRating, forKey: "minOfficialRating")
            encoder.encode(isLocked, forKey: "isLocked")
            encoder.encode(isPlaceHolder, forKey: "isPlaceHolder")
            encoder.encode(hasOfficialRating, forKey: "hasOfficialRating")
            encoder.encode(isCollapseBoxSetItems, forKey: "collapseBoxSetItems")
            encoder.encode(minWidth, forKey: "minWidth")
            encoder.encode(minHeight, forKey: "minHeight")
            encoder.encode(maxWidth, forKey: "maxWidth")
            encoder.encode(maxHeight, forKey: "maxHeight")
            encoder.encode(isIs3D, forKey: "is3D")
            encoder.encode(seriesStatus, forKey: "seriesStatus")
            encoder.encode(nameStartsWithOrGreater, forKey: "nameStartsWithOrGreater")
            encoder.encode(nameStartsWith, forKey: "nameStartsWith")
            encoder.encode(nameLessThan, forKey: "nameLessThan")
            encoder.encode(studioIDs, forKey: "studioIds")
            encoder.encode(genreIDs, forKey: "genreIds")
            encoder.encode(enableTotalRecordCount, forKey: "enableTotalRecordCount")
            encoder.encode(enableImages, forKey: "enableImages")
            return encoder.items
        }
    }
}
