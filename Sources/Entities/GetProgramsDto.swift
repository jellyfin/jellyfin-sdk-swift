//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Get programs dto.
public struct GetProgramsDto: Codable, Hashable {
    /// Gets or sets the channels to return guide information for.
    public var channelIDs: [String]?
    /// Gets or sets the image types to include in the output.
    ///
    /// Optional.
    public var enableImageTypes: [ImageType]?
    /// Gets or sets include image information in output.
    ///
    /// Optional.
    public var enableImages: Bool?
    /// Gets or sets a value indicating whether retrieve total record count.
    public var enableTotalRecordCount: Bool?
    /// Gets or sets include user data.
    ///
    /// Optional.
    public var enableUserData: Bool?
    /// Gets or sets specify additional fields of information to return in the output. This allows multiple, comma delimited. Options: Budget, Chapters, DateCreated, Genres, HomePageUrl, IndexOptions, MediaStreams, Overview, ParentId, Path, People, ProviderIds, PrimaryImageAspectRatio, Revenue, SortName, Studios, Taglines.
    ///
    /// Optional.
    public var fields: [ItemFields]?
    /// Gets or sets the genre ids to return guide information for.
    public var genreIDs: [String]?
    /// Gets or sets the genres to return guide information for.
    public var genres: [String]?
    /// Gets or sets filter by programs that have completed airing, or not.
    ///
    /// Optional.
    public var hasAired: Bool?
    /// Gets or sets the max number of images to return, per image type.
    ///
    /// Optional.
    public var imageTypeLimit: Int32?
    /// Gets or sets filter by programs that are currently airing, or not.
    ///
    /// Optional.
    public var isAiring: Bool?
    /// Gets or sets filter for kids.
    ///
    /// Optional.
    public var isKids: Bool?
    /// Gets or sets filter for movies.
    ///
    /// Optional.
    public var isMovie: Bool?
    /// Gets or sets filter for news.
    ///
    /// Optional.
    public var isNews: Bool?
    /// Gets or sets filter for series.
    ///
    /// Optional.
    public var isSeries: Bool?
    /// Gets or sets filter for sports.
    ///
    /// Optional.
    public var isSports: Bool?
    /// Gets or sets filter by library series id.
    ///
    /// Optional.
    public var librarySeriesID: String?
    /// Gets or sets the maximum number of records to return.
    ///
    /// Optional.
    public var limit: Int32?
    /// Gets or sets the maximum premiere end date.
    ///
    /// Optional.
    public var maxEndDate: Date?
    /// Gets or sets the maximum premiere start date.
    ///
    /// Optional.
    public var maxStartDate: Date?
    /// Gets or sets the minimum premiere end date.
    ///
    /// Optional.
    public var minEndDate: Date?
    /// Gets or sets the minimum premiere start date.
    ///
    /// Optional.
    public var minStartDate: Date?
    /// Gets or sets filter by series timer id.
    ///
    /// Optional.
    public var seriesTimerID: String?
    /// Gets or sets specify one or more sort orders, comma delimited. Options: Name, StartDate.
    ///
    /// Optional.
    public var sortBy: [String]?
    /// Gets or sets sort Order - Ascending,Descending.
    public var sortOrder: [SortOrder]?
    /// Gets or sets the record index to start at. All items with a lower index will be dropped from the results.
    ///
    /// Optional.
    public var startIndex: Int32?
    /// Gets or sets optional. Filter by user id.
    public var userID: String?

    public init(
        channelIDs: [String]? = nil,
        enableImageTypes: [ImageType]? = nil,
        enableImages: Bool? = nil,
        enableTotalRecordCount: Bool? = nil,
        enableUserData: Bool? = nil,
        fields: [ItemFields]? = nil,
        genreIDs: [String]? = nil,
        genres: [String]? = nil,
        hasAired: Bool? = nil,
        imageTypeLimit: Int32? = nil,
        isAiring: Bool? = nil,
        isKids: Bool? = nil,
        isMovie: Bool? = nil,
        isNews: Bool? = nil,
        isSeries: Bool? = nil,
        isSports: Bool? = nil,
        librarySeriesID: String? = nil,
        limit: Int32? = nil,
        maxEndDate: Date? = nil,
        maxStartDate: Date? = nil,
        minEndDate: Date? = nil,
        minStartDate: Date? = nil,
        seriesTimerID: String? = nil,
        sortBy: [String]? = nil,
        sortOrder: [SortOrder]? = nil,
        startIndex: Int32? = nil,
        userID: String? = nil
    ) {
        self.channelIDs = channelIDs
        self.enableImageTypes = enableImageTypes
        self.enableImages = enableImages
        self.enableTotalRecordCount = enableTotalRecordCount
        self.enableUserData = enableUserData
        self.fields = fields
        self.genreIDs = genreIDs
        self.genres = genres
        self.hasAired = hasAired
        self.imageTypeLimit = imageTypeLimit
        self.isAiring = isAiring
        self.isKids = isKids
        self.isMovie = isMovie
        self.isNews = isNews
        self.isSeries = isSeries
        self.isSports = isSports
        self.librarySeriesID = librarySeriesID
        self.limit = limit
        self.maxEndDate = maxEndDate
        self.maxStartDate = maxStartDate
        self.minEndDate = minEndDate
        self.minStartDate = minStartDate
        self.seriesTimerID = seriesTimerID
        self.sortBy = sortBy
        self.sortOrder = sortOrder
        self.startIndex = startIndex
        self.userID = userID
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.channelIDs = try values.decodeIfPresent([String].self, forKey: "ChannelIds")
        self.enableImageTypes = try values.decodeIfPresent([ImageType].self, forKey: "EnableImageTypes")
        self.enableImages = try values.decodeIfPresent(Bool.self, forKey: "EnableImages")
        self.enableTotalRecordCount = try values.decodeIfPresent(Bool.self, forKey: "EnableTotalRecordCount")
        self.enableUserData = try values.decodeIfPresent(Bool.self, forKey: "EnableUserData")
        self.fields = try values.decodeIfPresent([ItemFields].self, forKey: "Fields")
        self.genreIDs = try values.decodeIfPresent([String].self, forKey: "GenreIds")
        self.genres = try values.decodeIfPresent([String].self, forKey: "Genres")
        self.hasAired = try values.decodeIfPresent(Bool.self, forKey: "HasAired")
        self.imageTypeLimit = try values.decodeIfPresent(Int32.self, forKey: "ImageTypeLimit")
        self.isAiring = try values.decodeIfPresent(Bool.self, forKey: "IsAiring")
        self.isKids = try values.decodeIfPresent(Bool.self, forKey: "IsKids")
        self.isMovie = try values.decodeIfPresent(Bool.self, forKey: "IsMovie")
        self.isNews = try values.decodeIfPresent(Bool.self, forKey: "IsNews")
        self.isSeries = try values.decodeIfPresent(Bool.self, forKey: "IsSeries")
        self.isSports = try values.decodeIfPresent(Bool.self, forKey: "IsSports")
        self.librarySeriesID = try values.decodeIfPresent(String.self, forKey: "LibrarySeriesId")
        self.limit = try values.decodeIfPresent(Int32.self, forKey: "Limit")
        self.maxEndDate = try values.decodeIfPresent(Date.self, forKey: "MaxEndDate")
        self.maxStartDate = try values.decodeIfPresent(Date.self, forKey: "MaxStartDate")
        self.minEndDate = try values.decodeIfPresent(Date.self, forKey: "MinEndDate")
        self.minStartDate = try values.decodeIfPresent(Date.self, forKey: "MinStartDate")
        self.seriesTimerID = try values.decodeIfPresent(String.self, forKey: "SeriesTimerId")
        self.sortBy = try values.decodeIfPresent([String].self, forKey: "SortBy")
        self.sortOrder = try values.decodeIfPresent([SortOrder].self, forKey: "SortOrder")
        self.startIndex = try values.decodeIfPresent(Int32.self, forKey: "StartIndex")
        self.userID = try values.decodeIfPresent(String.self, forKey: "UserId")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(channelIDs, forKey: "ChannelIds")
        try values.encodeIfPresent(enableImageTypes, forKey: "EnableImageTypes")
        try values.encodeIfPresent(enableImages, forKey: "EnableImages")
        try values.encodeIfPresent(enableTotalRecordCount, forKey: "EnableTotalRecordCount")
        try values.encodeIfPresent(enableUserData, forKey: "EnableUserData")
        try values.encodeIfPresent(fields, forKey: "Fields")
        try values.encodeIfPresent(genreIDs, forKey: "GenreIds")
        try values.encodeIfPresent(genres, forKey: "Genres")
        try values.encodeIfPresent(hasAired, forKey: "HasAired")
        try values.encodeIfPresent(imageTypeLimit, forKey: "ImageTypeLimit")
        try values.encodeIfPresent(isAiring, forKey: "IsAiring")
        try values.encodeIfPresent(isKids, forKey: "IsKids")
        try values.encodeIfPresent(isMovie, forKey: "IsMovie")
        try values.encodeIfPresent(isNews, forKey: "IsNews")
        try values.encodeIfPresent(isSeries, forKey: "IsSeries")
        try values.encodeIfPresent(isSports, forKey: "IsSports")
        try values.encodeIfPresent(librarySeriesID, forKey: "LibrarySeriesId")
        try values.encodeIfPresent(limit, forKey: "Limit")
        try values.encodeIfPresent(maxEndDate, forKey: "MaxEndDate")
        try values.encodeIfPresent(maxStartDate, forKey: "MaxStartDate")
        try values.encodeIfPresent(minEndDate, forKey: "MinEndDate")
        try values.encodeIfPresent(minStartDate, forKey: "MinStartDate")
        try values.encodeIfPresent(seriesTimerID, forKey: "SeriesTimerId")
        try values.encodeIfPresent(sortBy, forKey: "SortBy")
        try values.encodeIfPresent(sortOrder, forKey: "SortOrder")
        try values.encodeIfPresent(startIndex, forKey: "StartIndex")
        try values.encodeIfPresent(userID, forKey: "UserId")
    }
}
