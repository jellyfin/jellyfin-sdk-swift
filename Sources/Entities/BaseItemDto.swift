//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// This is strictly used as a data transfer object from the api layer.
/// 
/// This holds information about a BaseItem in a format that is convenient for the client.
public struct BaseItemDto: Codable, Identifiable {
    /// Gets or sets the air days.
    public var airDays: [DayOfWeek]?
    /// Gets or sets the air time.
    public var airTime: String?
    public var airsAfterSeasonNumber: Int32?
    public var airsBeforeEpisodeNumber: Int32?
    public var airsBeforeSeasonNumber: Int32?
    /// Gets or sets the album.
    public var album: String?
    /// Gets or sets the album artist.
    public var albumArtist: String?
    /// Gets or sets the album artists.
    public var albumArtists: [NameGuidPair]?
    /// Gets or sets the album count.
    public var albumCount: Int32?
    /// Gets or sets the album id.
    public var albumID: UUID?
    /// Gets or sets the album image tag.
    public var albumPrimaryImageTag: String?
    public var altitude: Double?
    public var aperture: Double?
    public var artistCount: Int32?
    /// Gets or sets the artist items.
    public var artistItems: [NameGuidPair]?
    /// Gets or sets the artists.
    public var artists: [String]?
    /// Gets or sets the aspect ratio.
    public var aspectRatio: String?
    /// Gets or sets the audio.
    public var audio: ProgramAudio?
    /// Gets or sets the backdrop image tags.
    public var backdropImageTags: [String]?
    public var cameraMake: String?
    public var cameraModel: String?
    public var canDelete: Bool?
    public var canDownload: Bool?
    /// Gets or sets the channel identifier.
    public var channelID: UUID?
    public var channelName: String?
    public var channelNumber: String?
    /// Gets or sets the channel primary image tag.
    public var channelPrimaryImageTag: String?
    /// Gets or sets the type of the channel.
    public var channelType: ChannelType?
    /// Gets or sets the chapters.
    public var chapters: [ChapterInfo]?
    /// Gets or sets the child count.
    public var childCount: Int32?
    /// Gets or sets the type of the collection.
    public var collectionType: String?
    /// Gets or sets the community rating.
    public var communityRating: Float?
    /// Gets or sets the completion percentage.
    public var completionPercentage: Double?
    public var container: String?
    /// Gets or sets the critic rating.
    public var criticRating: Float?
    /// Gets or sets the cumulative run time ticks.
    public var cumulativeRunTimeTicks: Int64?
    /// Gets or sets the custom rating.
    public var customRating: String?
    /// Gets or sets the date created.
    public var dateCreated: Date?
    public var dateLastMediaAdded: Date?
    /// Gets or sets the display order.
    public var displayOrder: String?
    /// Gets or sets the display preferences id.
    public var displayPreferencesID: String?
    public var enableMediaSourceDisplay: Bool?
    /// Gets or sets the end date.
    public var endDate: Date?
    /// Gets or sets the episode count.
    public var episodeCount: Int32?
    /// Gets or sets the episode title.
    public var episodeTitle: String?
    /// Gets or sets the etag.
    public var etag: String?
    public var exposureTime: Double?
    /// Gets or sets the external urls.
    public var externalURLs: [ExternalURL]?
    public var extraType: String?
    public var focalLength: Double?
    public var forcedSortName: String?
    public var genreItems: [NameGuidPair]?
    /// Gets or sets the genres.
    public var genres: [String]?
    public var hasSubtitles: Bool?
    public var height: Int32?
    /// Gets or sets the id.
    public var id: UUID?
    /// Gets or sets the blurhashes for the image tags.
    /// 
    /// Maps image type to dictionary mapping image tag to blurhash value.
    public var imageBlurHashes: ImageBlurHashes?
    public var imageOrientation: ImageOrientation?
    /// Gets or sets the image tags.
    public var imageTags: [String: String]?
    /// Gets or sets the index number.
    public var indexNumber: Int32?
    /// Gets or sets the index number end.
    public var indexNumberEnd: Int32?
    /// Gets or sets a value indicating whether this instance is folder.
    public var isFolder: Bool?
    /// Gets or sets a value indicating whether this instance is HD.
    public var isHD: Bool?
    /// Gets or sets a value indicating whether this instance is kids.
    public var isKids: Bool?
    /// Gets or sets a value indicating whether this instance is live.
    public var isLive: Bool?
    /// Gets or sets a value indicating whether this instance is movie.
    public var isMovie: Bool?
    /// Gets or sets a value indicating whether this instance is news.
    public var isNews: Bool?
    /// Gets or sets a value indicating whether this instance is place holder.
    public var isPlaceHolder: Bool?
    /// Gets or sets a value indicating whether this instance is premiere.
    public var isPremiere: Bool?
    /// Gets or sets a value indicating whether this instance is repeat.
    public var isRepeat: Bool?
    /// Gets or sets a value indicating whether this instance is series.
    public var isSeries: Bool?
    /// Gets or sets a value indicating whether this instance is sports.
    public var isSports: Bool?
    public var isoSpeedRating: Int32?
    /// Gets or sets the type of the iso.
    public var isoType: IsoType?
    public var latitude: Double?
    /// Gets or sets the local trailer count.
    public var localTrailerCount: Int32?
    /// Gets or sets the type of the location.
    public var locationType: LocationType?
    /// Gets or sets a value indicating whether [enable internet providers].
    public var lockData: Bool?
    /// Gets or sets the locked fields.
    public var lockedFields: [MetadataField]?
    public var longitude: Double?
    public var mediaSourceCount: Int32?
    /// Gets or sets the media versions.
    public var mediaSources: [MediaSourceInfo]?
    /// Gets or sets the media streams.
    public var mediaStreams: [MediaStream]?
    /// Gets or sets the type of the media.
    public var mediaType: String?
    /// Gets or sets the movie count.
    public var movieCount: Int32?
    /// Gets or sets the music video count.
    public var musicVideoCount: Int32?
    /// Gets or sets the name.
    public var name: String?
    /// Gets or sets the number.
    public var number: String?
    /// Gets or sets the official rating.
    public var officialRating: String?
    public var originalTitle: String?
    /// Gets or sets the overview.
    public var overview: String?
    /// Gets or sets the parent art image tag.
    public var parentArtImageTag: String?
    /// Gets or sets wether the item has fan art, this will hold the Id of the Parent that has one.
    public var parentArtItemID: UUID?
    /// Gets or sets the parent backdrop image tags.
    public var parentBackdropImageTags: [String]?
    /// Gets or sets wether the item has any backdrops, this will hold the Id of the Parent that has one.
    public var parentBackdropItemID: UUID?
    /// Gets or sets the parent id.
    public var parentID: UUID?
    /// Gets or sets the parent index number.
    public var parentIndexNumber: Int32?
    /// Gets or sets the parent logo image tag.
    public var parentLogoImageTag: String?
    /// Gets or sets wether the item has a logo, this will hold the Id of the Parent that has one.
    public var parentLogoItemID: UUID?
    /// Gets or sets the parent primary image item identifier.
    public var parentPrimaryImageItemID: String?
    /// Gets or sets the parent primary image tag.
    public var parentPrimaryImageTag: String?
    /// Gets or sets the parent thumb image tag.
    public var parentThumbImageTag: String?
    /// Gets or sets the parent thumb item id.
    public var parentThumbItemID: UUID?
    /// Gets or sets the part count.
    public var partCount: Int32?
    /// Gets or sets the path.
    public var path: String?
    /// Gets or sets the people.
    public var people: [BaseItemPerson]?
    /// Gets or sets the play access.
    public var playAccess: PlayAccess?
    /// Gets or sets the playlist item identifier.
    public var playlistItemID: String?
    public var preferredMetadataCountryCode: String?
    public var preferredMetadataLanguage: String?
    /// Gets or sets the premiere date.
    public var premiereDate: Date?
    /// Gets or sets the primary image aspect ratio, after image enhancements.
    public var primaryImageAspectRatio: Double?
    public var productionLocations: [String]?
    /// Gets or sets the production year.
    public var productionYear: Int32?
    public var programCount: Int32?
    /// Gets or sets the program identifier.
    public var programID: String?
    /// Gets or sets the provider ids.
    public var providerIDs: [String: String]?
    /// Gets or sets the recursive item count.
    public var recursiveItemCount: Int32?
    /// Gets or sets the trailer urls.
    public var remoteTrailers: [MediaURL]?
    /// Gets or sets the run time ticks.
    public var runTimeTicks: Int64?
    /// Gets or sets the screenshot image tags.
    public var screenshotImageTags: [String]?
    /// Gets or sets the season identifier.
    public var seasonID: UUID?
    /// Gets or sets the name of the season.
    public var seasonName: String?
    /// Gets or sets the series count.
    public var seriesCount: Int32?
    /// Gets or sets the series id.
    public var seriesID: UUID?
    /// Gets or sets the name of the series.
    public var seriesName: String?
    /// Gets or sets the series primary image tag.
    public var seriesPrimaryImageTag: String?
    /// Gets or sets the series studio.
    public var seriesStudio: String?
    /// Gets or sets the series thumb image tag.
    public var seriesThumbImageTag: String?
    /// Gets or sets the series timer identifier.
    public var seriesTimerID: String?
    /// Gets or sets the server identifier.
    public var serverID: String?
    public var shutterSpeed: Double?
    public var software: String?
    /// Gets or sets the song count.
    public var songCount: Int32?
    /// Gets or sets the name of the sort.
    public var sortName: String?
    /// Gets or sets the type of the source.
    public var sourceType: String?
    /// Gets or sets the special feature count.
    public var specialFeatureCount: Int32?
    /// Gets or sets the start date of the recording, in UTC.
    public var startDate: Date?
    /// Gets or sets the status.
    public var status: String?
    /// Gets or sets the studios.
    public var studios: [NameGuidPair]?
    /// Gets or sets a value indicating whether [supports synchronize].
    public var isSupportsSync: Bool?
    /// Gets or sets the taglines.
    public var taglines: [String]?
    /// Gets or sets the tags.
    public var tags: [String]?
    /// Gets or sets the timer identifier.
    public var timerID: String?
    /// Gets or sets the trailer count.
    public var trailerCount: Int32?
    /// Gets or sets the type.
    public var type: BaseItemKind?
    /// Gets or sets the user data for this item based on the user it's being requested for.
    public var userData: UserItemDataDto?
    /// Gets or sets the video3 D format.
    public var video3DFormat: Video3DFormat?
    /// Gets or sets the type of the video.
    public var videoType: VideoType?
    public var width: Int32?

    /// Gets or sets the blurhashes for the image tags.
    /// 
    /// Maps image type to dictionary mapping image tag to blurhash value.
    public struct ImageBlurHashes: Codable {
        public var art: [String: String]?
        public var backdrop: [String: String]?
        public var banner: [String: String]?
        public var box: [String: String]?
        public var boxRear: [String: String]?
        public var chapter: [String: String]?
        public var disc: [String: String]?
        public var logo: [String: String]?
        public var menu: [String: String]?
        public var primary: [String: String]?
        public var profile: [String: String]?
        public var screenshot: [String: String]?
        public var thumb: [String: String]?

        public init(art: [String: String]? = nil, backdrop: [String: String]? = nil, banner: [String: String]? = nil, box: [String: String]? = nil, boxRear: [String: String]? = nil, chapter: [String: String]? = nil, disc: [String: String]? = nil, logo: [String: String]? = nil, menu: [String: String]? = nil, primary: [String: String]? = nil, profile: [String: String]? = nil, screenshot: [String: String]? = nil, thumb: [String: String]? = nil) {
            self.art = art
            self.backdrop = backdrop
            self.banner = banner
            self.box = box
            self.boxRear = boxRear
            self.chapter = chapter
            self.disc = disc
            self.logo = logo
            self.menu = menu
            self.primary = primary
            self.profile = profile
            self.screenshot = screenshot
            self.thumb = thumb
        }
    }

    public init(airDays: [DayOfWeek]? = nil, airTime: String? = nil, airsAfterSeasonNumber: Int32? = nil, airsBeforeEpisodeNumber: Int32? = nil, airsBeforeSeasonNumber: Int32? = nil, album: String? = nil, albumArtist: String? = nil, albumArtists: [NameGuidPair]? = nil, albumCount: Int32? = nil, albumID: UUID? = nil, albumPrimaryImageTag: String? = nil, altitude: Double? = nil, aperture: Double? = nil, artistCount: Int32? = nil, artistItems: [NameGuidPair]? = nil, artists: [String]? = nil, aspectRatio: String? = nil, audio: ProgramAudio? = nil, backdropImageTags: [String]? = nil, cameraMake: String? = nil, cameraModel: String? = nil, canDelete: Bool? = nil, canDownload: Bool? = nil, channelID: UUID? = nil, channelName: String? = nil, channelNumber: String? = nil, channelPrimaryImageTag: String? = nil, channelType: ChannelType? = nil, chapters: [ChapterInfo]? = nil, childCount: Int32? = nil, collectionType: String? = nil, communityRating: Float? = nil, completionPercentage: Double? = nil, container: String? = nil, criticRating: Float? = nil, cumulativeRunTimeTicks: Int64? = nil, customRating: String? = nil, dateCreated: Date? = nil, dateLastMediaAdded: Date? = nil, displayOrder: String? = nil, displayPreferencesID: String? = nil, enableMediaSourceDisplay: Bool? = nil, endDate: Date? = nil, episodeCount: Int32? = nil, episodeTitle: String? = nil, etag: String? = nil, exposureTime: Double? = nil, externalURLs: [ExternalURL]? = nil, extraType: String? = nil, focalLength: Double? = nil, forcedSortName: String? = nil, genreItems: [NameGuidPair]? = nil, genres: [String]? = nil, hasSubtitles: Bool? = nil, height: Int32? = nil, id: UUID? = nil, imageBlurHashes: ImageBlurHashes? = nil, imageOrientation: ImageOrientation? = nil, imageTags: [String: String]? = nil, indexNumber: Int32? = nil, indexNumberEnd: Int32? = nil, isFolder: Bool? = nil, isHD: Bool? = nil, isKids: Bool? = nil, isLive: Bool? = nil, isMovie: Bool? = nil, isNews: Bool? = nil, isPlaceHolder: Bool? = nil, isPremiere: Bool? = nil, isRepeat: Bool? = nil, isSeries: Bool? = nil, isSports: Bool? = nil, isoSpeedRating: Int32? = nil, isoType: IsoType? = nil, latitude: Double? = nil, localTrailerCount: Int32? = nil, locationType: LocationType? = nil, lockData: Bool? = nil, lockedFields: [MetadataField]? = nil, longitude: Double? = nil, mediaSourceCount: Int32? = nil, mediaSources: [MediaSourceInfo]? = nil, mediaStreams: [MediaStream]? = nil, mediaType: String? = nil, movieCount: Int32? = nil, musicVideoCount: Int32? = nil, name: String? = nil, number: String? = nil, officialRating: String? = nil, originalTitle: String? = nil, overview: String? = nil, parentArtImageTag: String? = nil, parentArtItemID: UUID? = nil, parentBackdropImageTags: [String]? = nil, parentBackdropItemID: UUID? = nil, parentID: UUID? = nil, parentIndexNumber: Int32? = nil, parentLogoImageTag: String? = nil, parentLogoItemID: UUID? = nil, parentPrimaryImageItemID: String? = nil, parentPrimaryImageTag: String? = nil, parentThumbImageTag: String? = nil, parentThumbItemID: UUID? = nil, partCount: Int32? = nil, path: String? = nil, people: [BaseItemPerson]? = nil, playAccess: PlayAccess? = nil, playlistItemID: String? = nil, preferredMetadataCountryCode: String? = nil, preferredMetadataLanguage: String? = nil, premiereDate: Date? = nil, primaryImageAspectRatio: Double? = nil, productionLocations: [String]? = nil, productionYear: Int32? = nil, programCount: Int32? = nil, programID: String? = nil, providerIDs: [String: String]? = nil, recursiveItemCount: Int32? = nil, remoteTrailers: [MediaURL]? = nil, runTimeTicks: Int64? = nil, screenshotImageTags: [String]? = nil, seasonID: UUID? = nil, seasonName: String? = nil, seriesCount: Int32? = nil, seriesID: UUID? = nil, seriesName: String? = nil, seriesPrimaryImageTag: String? = nil, seriesStudio: String? = nil, seriesThumbImageTag: String? = nil, seriesTimerID: String? = nil, serverID: String? = nil, shutterSpeed: Double? = nil, software: String? = nil, songCount: Int32? = nil, sortName: String? = nil, sourceType: String? = nil, specialFeatureCount: Int32? = nil, startDate: Date? = nil, status: String? = nil, studios: [NameGuidPair]? = nil, isSupportsSync: Bool? = nil, taglines: [String]? = nil, tags: [String]? = nil, timerID: String? = nil, trailerCount: Int32? = nil, type: BaseItemKind? = nil, userData: UserItemDataDto? = nil, video3DFormat: Video3DFormat? = nil, videoType: VideoType? = nil, width: Int32? = nil) {
        self.airDays = airDays
        self.airTime = airTime
        self.airsAfterSeasonNumber = airsAfterSeasonNumber
        self.airsBeforeEpisodeNumber = airsBeforeEpisodeNumber
        self.airsBeforeSeasonNumber = airsBeforeSeasonNumber
        self.album = album
        self.albumArtist = albumArtist
        self.albumArtists = albumArtists
        self.albumCount = albumCount
        self.albumID = albumID
        self.albumPrimaryImageTag = albumPrimaryImageTag
        self.altitude = altitude
        self.aperture = aperture
        self.artistCount = artistCount
        self.artistItems = artistItems
        self.artists = artists
        self.aspectRatio = aspectRatio
        self.audio = audio
        self.backdropImageTags = backdropImageTags
        self.cameraMake = cameraMake
        self.cameraModel = cameraModel
        self.canDelete = canDelete
        self.canDownload = canDownload
        self.channelID = channelID
        self.channelName = channelName
        self.channelNumber = channelNumber
        self.channelPrimaryImageTag = channelPrimaryImageTag
        self.channelType = channelType
        self.chapters = chapters
        self.childCount = childCount
        self.collectionType = collectionType
        self.communityRating = communityRating
        self.completionPercentage = completionPercentage
        self.container = container
        self.criticRating = criticRating
        self.cumulativeRunTimeTicks = cumulativeRunTimeTicks
        self.customRating = customRating
        self.dateCreated = dateCreated
        self.dateLastMediaAdded = dateLastMediaAdded
        self.displayOrder = displayOrder
        self.displayPreferencesID = displayPreferencesID
        self.enableMediaSourceDisplay = enableMediaSourceDisplay
        self.endDate = endDate
        self.episodeCount = episodeCount
        self.episodeTitle = episodeTitle
        self.etag = etag
        self.exposureTime = exposureTime
        self.externalURLs = externalURLs
        self.extraType = extraType
        self.focalLength = focalLength
        self.forcedSortName = forcedSortName
        self.genreItems = genreItems
        self.genres = genres
        self.hasSubtitles = hasSubtitles
        self.height = height
        self.id = id
        self.imageBlurHashes = imageBlurHashes
        self.imageOrientation = imageOrientation
        self.imageTags = imageTags
        self.indexNumber = indexNumber
        self.indexNumberEnd = indexNumberEnd
        self.isFolder = isFolder
        self.isHD = isHD
        self.isKids = isKids
        self.isLive = isLive
        self.isMovie = isMovie
        self.isNews = isNews
        self.isPlaceHolder = isPlaceHolder
        self.isPremiere = isPremiere
        self.isRepeat = isRepeat
        self.isSeries = isSeries
        self.isSports = isSports
        self.isoSpeedRating = isoSpeedRating
        self.isoType = isoType
        self.latitude = latitude
        self.localTrailerCount = localTrailerCount
        self.locationType = locationType
        self.lockData = lockData
        self.lockedFields = lockedFields
        self.longitude = longitude
        self.mediaSourceCount = mediaSourceCount
        self.mediaSources = mediaSources
        self.mediaStreams = mediaStreams
        self.mediaType = mediaType
        self.movieCount = movieCount
        self.musicVideoCount = musicVideoCount
        self.name = name
        self.number = number
        self.officialRating = officialRating
        self.originalTitle = originalTitle
        self.overview = overview
        self.parentArtImageTag = parentArtImageTag
        self.parentArtItemID = parentArtItemID
        self.parentBackdropImageTags = parentBackdropImageTags
        self.parentBackdropItemID = parentBackdropItemID
        self.parentID = parentID
        self.parentIndexNumber = parentIndexNumber
        self.parentLogoImageTag = parentLogoImageTag
        self.parentLogoItemID = parentLogoItemID
        self.parentPrimaryImageItemID = parentPrimaryImageItemID
        self.parentPrimaryImageTag = parentPrimaryImageTag
        self.parentThumbImageTag = parentThumbImageTag
        self.parentThumbItemID = parentThumbItemID
        self.partCount = partCount
        self.path = path
        self.people = people
        self.playAccess = playAccess
        self.playlistItemID = playlistItemID
        self.preferredMetadataCountryCode = preferredMetadataCountryCode
        self.preferredMetadataLanguage = preferredMetadataLanguage
        self.premiereDate = premiereDate
        self.primaryImageAspectRatio = primaryImageAspectRatio
        self.productionLocations = productionLocations
        self.productionYear = productionYear
        self.programCount = programCount
        self.programID = programID
        self.providerIDs = providerIDs
        self.recursiveItemCount = recursiveItemCount
        self.remoteTrailers = remoteTrailers
        self.runTimeTicks = runTimeTicks
        self.screenshotImageTags = screenshotImageTags
        self.seasonID = seasonID
        self.seasonName = seasonName
        self.seriesCount = seriesCount
        self.seriesID = seriesID
        self.seriesName = seriesName
        self.seriesPrimaryImageTag = seriesPrimaryImageTag
        self.seriesStudio = seriesStudio
        self.seriesThumbImageTag = seriesThumbImageTag
        self.seriesTimerID = seriesTimerID
        self.serverID = serverID
        self.shutterSpeed = shutterSpeed
        self.software = software
        self.songCount = songCount
        self.sortName = sortName
        self.sourceType = sourceType
        self.specialFeatureCount = specialFeatureCount
        self.startDate = startDate
        self.status = status
        self.studios = studios
        self.isSupportsSync = isSupportsSync
        self.taglines = taglines
        self.tags = tags
        self.timerID = timerID
        self.trailerCount = trailerCount
        self.type = type
        self.userData = userData
        self.video3DFormat = video3DFormat
        self.videoType = videoType
        self.width = width
    }
}
