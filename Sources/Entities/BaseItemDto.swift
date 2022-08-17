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

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.art = try values.decodeIfPresent([String: String].self, forKey: "Art")
            self.backdrop = try values.decodeIfPresent([String: String].self, forKey: "Backdrop")
            self.banner = try values.decodeIfPresent([String: String].self, forKey: "Banner")
            self.box = try values.decodeIfPresent([String: String].self, forKey: "Box")
            self.boxRear = try values.decodeIfPresent([String: String].self, forKey: "BoxRear")
            self.chapter = try values.decodeIfPresent([String: String].self, forKey: "Chapter")
            self.disc = try values.decodeIfPresent([String: String].self, forKey: "Disc")
            self.logo = try values.decodeIfPresent([String: String].self, forKey: "Logo")
            self.menu = try values.decodeIfPresent([String: String].self, forKey: "Menu")
            self.primary = try values.decodeIfPresent([String: String].self, forKey: "Primary")
            self.profile = try values.decodeIfPresent([String: String].self, forKey: "Profile")
            self.screenshot = try values.decodeIfPresent([String: String].self, forKey: "Screenshot")
            self.thumb = try values.decodeIfPresent([String: String].self, forKey: "Thumb")
        }

        public func encode(to encoder: Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encodeIfPresent(art, forKey: "Art")
            try values.encodeIfPresent(backdrop, forKey: "Backdrop")
            try values.encodeIfPresent(banner, forKey: "Banner")
            try values.encodeIfPresent(box, forKey: "Box")
            try values.encodeIfPresent(boxRear, forKey: "BoxRear")
            try values.encodeIfPresent(chapter, forKey: "Chapter")
            try values.encodeIfPresent(disc, forKey: "Disc")
            try values.encodeIfPresent(logo, forKey: "Logo")
            try values.encodeIfPresent(menu, forKey: "Menu")
            try values.encodeIfPresent(primary, forKey: "Primary")
            try values.encodeIfPresent(profile, forKey: "Profile")
            try values.encodeIfPresent(screenshot, forKey: "Screenshot")
            try values.encodeIfPresent(thumb, forKey: "Thumb")
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

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.airDays = try values.decodeIfPresent([DayOfWeek].self, forKey: "AirDays")
        self.airTime = try values.decodeIfPresent(String.self, forKey: "AirTime")
        self.airsAfterSeasonNumber = try values.decodeIfPresent(Int32.self, forKey: "AirsAfterSeasonNumber")
        self.airsBeforeEpisodeNumber = try values.decodeIfPresent(Int32.self, forKey: "AirsBeforeEpisodeNumber")
        self.airsBeforeSeasonNumber = try values.decodeIfPresent(Int32.self, forKey: "AirsBeforeSeasonNumber")
        self.album = try values.decodeIfPresent(String.self, forKey: "Album")
        self.albumArtist = try values.decodeIfPresent(String.self, forKey: "AlbumArtist")
        self.albumArtists = try values.decodeIfPresent([NameGuidPair].self, forKey: "AlbumArtists")
        self.albumCount = try values.decodeIfPresent(Int32.self, forKey: "AlbumCount")
        self.albumID = try values.decodeIfPresent(UUID.self, forKey: "AlbumId")
        self.albumPrimaryImageTag = try values.decodeIfPresent(String.self, forKey: "AlbumPrimaryImageTag")
        self.altitude = try values.decodeIfPresent(Double.self, forKey: "Altitude")
        self.aperture = try values.decodeIfPresent(Double.self, forKey: "Aperture")
        self.artistCount = try values.decodeIfPresent(Int32.self, forKey: "ArtistCount")
        self.artistItems = try values.decodeIfPresent([NameGuidPair].self, forKey: "ArtistItems")
        self.artists = try values.decodeIfPresent([String].self, forKey: "Artists")
        self.aspectRatio = try values.decodeIfPresent(String.self, forKey: "AspectRatio")
        self.audio = try values.decodeIfPresent(ProgramAudio.self, forKey: "Audio")
        self.backdropImageTags = try values.decodeIfPresent([String].self, forKey: "BackdropImageTags")
        self.cameraMake = try values.decodeIfPresent(String.self, forKey: "CameraMake")
        self.cameraModel = try values.decodeIfPresent(String.self, forKey: "CameraModel")
        self.canDelete = try values.decodeIfPresent(Bool.self, forKey: "CanDelete")
        self.canDownload = try values.decodeIfPresent(Bool.self, forKey: "CanDownload")
        self.channelID = try values.decodeIfPresent(UUID.self, forKey: "ChannelId")
        self.channelName = try values.decodeIfPresent(String.self, forKey: "ChannelName")
        self.channelNumber = try values.decodeIfPresent(String.self, forKey: "ChannelNumber")
        self.channelPrimaryImageTag = try values.decodeIfPresent(String.self, forKey: "ChannelPrimaryImageTag")
        self.channelType = try values.decodeIfPresent(ChannelType.self, forKey: "ChannelType")
        self.chapters = try values.decodeIfPresent([ChapterInfo].self, forKey: "Chapters")
        self.childCount = try values.decodeIfPresent(Int32.self, forKey: "ChildCount")
        self.collectionType = try values.decodeIfPresent(String.self, forKey: "CollectionType")
        self.communityRating = try values.decodeIfPresent(Float.self, forKey: "CommunityRating")
        self.completionPercentage = try values.decodeIfPresent(Double.self, forKey: "CompletionPercentage")
        self.container = try values.decodeIfPresent(String.self, forKey: "Container")
        self.criticRating = try values.decodeIfPresent(Float.self, forKey: "CriticRating")
        self.cumulativeRunTimeTicks = try values.decodeIfPresent(Int64.self, forKey: "CumulativeRunTimeTicks")
        self.customRating = try values.decodeIfPresent(String.self, forKey: "CustomRating")
        self.dateCreated = try values.decodeIfPresent(Date.self, forKey: "DateCreated")
        self.dateLastMediaAdded = try values.decodeIfPresent(Date.self, forKey: "DateLastMediaAdded")
        self.displayOrder = try values.decodeIfPresent(String.self, forKey: "DisplayOrder")
        self.displayPreferencesID = try values.decodeIfPresent(String.self, forKey: "DisplayPreferencesId")
        self.enableMediaSourceDisplay = try values.decodeIfPresent(Bool.self, forKey: "EnableMediaSourceDisplay")
        self.endDate = try values.decodeIfPresent(Date.self, forKey: "EndDate")
        self.episodeCount = try values.decodeIfPresent(Int32.self, forKey: "EpisodeCount")
        self.episodeTitle = try values.decodeIfPresent(String.self, forKey: "EpisodeTitle")
        self.etag = try values.decodeIfPresent(String.self, forKey: "Etag")
        self.exposureTime = try values.decodeIfPresent(Double.self, forKey: "ExposureTime")
        self.externalURLs = try values.decodeIfPresent([ExternalURL].self, forKey: "ExternalUrls")
        self.extraType = try values.decodeIfPresent(String.self, forKey: "ExtraType")
        self.focalLength = try values.decodeIfPresent(Double.self, forKey: "FocalLength")
        self.forcedSortName = try values.decodeIfPresent(String.self, forKey: "ForcedSortName")
        self.genreItems = try values.decodeIfPresent([NameGuidPair].self, forKey: "GenreItems")
        self.genres = try values.decodeIfPresent([String].self, forKey: "Genres")
        self.hasSubtitles = try values.decodeIfPresent(Bool.self, forKey: "HasSubtitles")
        self.height = try values.decodeIfPresent(Int32.self, forKey: "Height")
        self.id = try values.decodeIfPresent(UUID.self, forKey: "Id")
        self.imageBlurHashes = try values.decodeIfPresent(ImageBlurHashes.self, forKey: "ImageBlurHashes")
        self.imageOrientation = try values.decodeIfPresent(ImageOrientation.self, forKey: "ImageOrientation")
        self.imageTags = try values.decodeIfPresent([String: String].self, forKey: "ImageTags")
        self.indexNumber = try values.decodeIfPresent(Int32.self, forKey: "IndexNumber")
        self.indexNumberEnd = try values.decodeIfPresent(Int32.self, forKey: "IndexNumberEnd")
        self.isFolder = try values.decodeIfPresent(Bool.self, forKey: "IsFolder")
        self.isHD = try values.decodeIfPresent(Bool.self, forKey: "IsHD")
        self.isKids = try values.decodeIfPresent(Bool.self, forKey: "IsKids")
        self.isLive = try values.decodeIfPresent(Bool.self, forKey: "IsLive")
        self.isMovie = try values.decodeIfPresent(Bool.self, forKey: "IsMovie")
        self.isNews = try values.decodeIfPresent(Bool.self, forKey: "IsNews")
        self.isPlaceHolder = try values.decodeIfPresent(Bool.self, forKey: "IsPlaceHolder")
        self.isPremiere = try values.decodeIfPresent(Bool.self, forKey: "IsPremiere")
        self.isRepeat = try values.decodeIfPresent(Bool.self, forKey: "IsRepeat")
        self.isSeries = try values.decodeIfPresent(Bool.self, forKey: "IsSeries")
        self.isSports = try values.decodeIfPresent(Bool.self, forKey: "IsSports")
        self.isoSpeedRating = try values.decodeIfPresent(Int32.self, forKey: "IsoSpeedRating")
        self.isoType = try values.decodeIfPresent(IsoType.self, forKey: "IsoType")
        self.latitude = try values.decodeIfPresent(Double.self, forKey: "Latitude")
        self.localTrailerCount = try values.decodeIfPresent(Int32.self, forKey: "LocalTrailerCount")
        self.locationType = try values.decodeIfPresent(LocationType.self, forKey: "LocationType")
        self.lockData = try values.decodeIfPresent(Bool.self, forKey: "LockData")
        self.lockedFields = try values.decodeIfPresent([MetadataField].self, forKey: "LockedFields")
        self.longitude = try values.decodeIfPresent(Double.self, forKey: "Longitude")
        self.mediaSourceCount = try values.decodeIfPresent(Int32.self, forKey: "MediaSourceCount")
        self.mediaSources = try values.decodeIfPresent([MediaSourceInfo].self, forKey: "MediaSources")
        self.mediaStreams = try values.decodeIfPresent([MediaStream].self, forKey: "MediaStreams")
        self.mediaType = try values.decodeIfPresent(String.self, forKey: "MediaType")
        self.movieCount = try values.decodeIfPresent(Int32.self, forKey: "MovieCount")
        self.musicVideoCount = try values.decodeIfPresent(Int32.self, forKey: "MusicVideoCount")
        self.name = try values.decodeIfPresent(String.self, forKey: "Name")
        self.number = try values.decodeIfPresent(String.self, forKey: "Number")
        self.officialRating = try values.decodeIfPresent(String.self, forKey: "OfficialRating")
        self.originalTitle = try values.decodeIfPresent(String.self, forKey: "OriginalTitle")
        self.overview = try values.decodeIfPresent(String.self, forKey: "Overview")
        self.parentArtImageTag = try values.decodeIfPresent(String.self, forKey: "ParentArtImageTag")
        self.parentArtItemID = try values.decodeIfPresent(UUID.self, forKey: "ParentArtItemId")
        self.parentBackdropImageTags = try values.decodeIfPresent([String].self, forKey: "ParentBackdropImageTags")
        self.parentBackdropItemID = try values.decodeIfPresent(UUID.self, forKey: "ParentBackdropItemId")
        self.parentID = try values.decodeIfPresent(UUID.self, forKey: "ParentId")
        self.parentIndexNumber = try values.decodeIfPresent(Int32.self, forKey: "ParentIndexNumber")
        self.parentLogoImageTag = try values.decodeIfPresent(String.self, forKey: "ParentLogoImageTag")
        self.parentLogoItemID = try values.decodeIfPresent(UUID.self, forKey: "ParentLogoItemId")
        self.parentPrimaryImageItemID = try values.decodeIfPresent(String.self, forKey: "ParentPrimaryImageItemId")
        self.parentPrimaryImageTag = try values.decodeIfPresent(String.self, forKey: "ParentPrimaryImageTag")
        self.parentThumbImageTag = try values.decodeIfPresent(String.self, forKey: "ParentThumbImageTag")
        self.parentThumbItemID = try values.decodeIfPresent(UUID.self, forKey: "ParentThumbItemId")
        self.partCount = try values.decodeIfPresent(Int32.self, forKey: "PartCount")
        self.path = try values.decodeIfPresent(String.self, forKey: "Path")
        self.people = try values.decodeIfPresent([BaseItemPerson].self, forKey: "People")
        self.playAccess = try values.decodeIfPresent(PlayAccess.self, forKey: "PlayAccess")
        self.playlistItemID = try values.decodeIfPresent(String.self, forKey: "PlaylistItemId")
        self.preferredMetadataCountryCode = try values.decodeIfPresent(String.self, forKey: "PreferredMetadataCountryCode")
        self.preferredMetadataLanguage = try values.decodeIfPresent(String.self, forKey: "PreferredMetadataLanguage")
        self.premiereDate = try values.decodeIfPresent(Date.self, forKey: "PremiereDate")
        self.primaryImageAspectRatio = try values.decodeIfPresent(Double.self, forKey: "PrimaryImageAspectRatio")
        self.productionLocations = try values.decodeIfPresent([String].self, forKey: "ProductionLocations")
        self.productionYear = try values.decodeIfPresent(Int32.self, forKey: "ProductionYear")
        self.programCount = try values.decodeIfPresent(Int32.self, forKey: "ProgramCount")
        self.programID = try values.decodeIfPresent(String.self, forKey: "ProgramId")
        self.providerIDs = try values.decodeIfPresent([String: String].self, forKey: "ProviderIds")
        self.recursiveItemCount = try values.decodeIfPresent(Int32.self, forKey: "RecursiveItemCount")
        self.remoteTrailers = try values.decodeIfPresent([MediaURL].self, forKey: "RemoteTrailers")
        self.runTimeTicks = try values.decodeIfPresent(Int64.self, forKey: "RunTimeTicks")
        self.screenshotImageTags = try values.decodeIfPresent([String].self, forKey: "ScreenshotImageTags")
        self.seasonID = try values.decodeIfPresent(UUID.self, forKey: "SeasonId")
        self.seasonName = try values.decodeIfPresent(String.self, forKey: "SeasonName")
        self.seriesCount = try values.decodeIfPresent(Int32.self, forKey: "SeriesCount")
        self.seriesID = try values.decodeIfPresent(UUID.self, forKey: "SeriesId")
        self.seriesName = try values.decodeIfPresent(String.self, forKey: "SeriesName")
        self.seriesPrimaryImageTag = try values.decodeIfPresent(String.self, forKey: "SeriesPrimaryImageTag")
        self.seriesStudio = try values.decodeIfPresent(String.self, forKey: "SeriesStudio")
        self.seriesThumbImageTag = try values.decodeIfPresent(String.self, forKey: "SeriesThumbImageTag")
        self.seriesTimerID = try values.decodeIfPresent(String.self, forKey: "SeriesTimerId")
        self.serverID = try values.decodeIfPresent(String.self, forKey: "ServerId")
        self.shutterSpeed = try values.decodeIfPresent(Double.self, forKey: "ShutterSpeed")
        self.software = try values.decodeIfPresent(String.self, forKey: "Software")
        self.songCount = try values.decodeIfPresent(Int32.self, forKey: "SongCount")
        self.sortName = try values.decodeIfPresent(String.self, forKey: "SortName")
        self.sourceType = try values.decodeIfPresent(String.self, forKey: "SourceType")
        self.specialFeatureCount = try values.decodeIfPresent(Int32.self, forKey: "SpecialFeatureCount")
        self.startDate = try values.decodeIfPresent(Date.self, forKey: "StartDate")
        self.status = try values.decodeIfPresent(String.self, forKey: "Status")
        self.studios = try values.decodeIfPresent([NameGuidPair].self, forKey: "Studios")
        self.isSupportsSync = try values.decodeIfPresent(Bool.self, forKey: "SupportsSync")
        self.taglines = try values.decodeIfPresent([String].self, forKey: "Taglines")
        self.tags = try values.decodeIfPresent([String].self, forKey: "Tags")
        self.timerID = try values.decodeIfPresent(String.self, forKey: "TimerId")
        self.trailerCount = try values.decodeIfPresent(Int32.self, forKey: "TrailerCount")
        self.type = try values.decodeIfPresent(BaseItemKind.self, forKey: "Type")
        self.userData = try values.decodeIfPresent(UserItemDataDto.self, forKey: "UserData")
        self.video3DFormat = try values.decodeIfPresent(Video3DFormat.self, forKey: "Video3DFormat")
        self.videoType = try values.decodeIfPresent(VideoType.self, forKey: "VideoType")
        self.width = try values.decodeIfPresent(Int32.self, forKey: "Width")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(airDays, forKey: "AirDays")
        try values.encodeIfPresent(airTime, forKey: "AirTime")
        try values.encodeIfPresent(airsAfterSeasonNumber, forKey: "AirsAfterSeasonNumber")
        try values.encodeIfPresent(airsBeforeEpisodeNumber, forKey: "AirsBeforeEpisodeNumber")
        try values.encodeIfPresent(airsBeforeSeasonNumber, forKey: "AirsBeforeSeasonNumber")
        try values.encodeIfPresent(album, forKey: "Album")
        try values.encodeIfPresent(albumArtist, forKey: "AlbumArtist")
        try values.encodeIfPresent(albumArtists, forKey: "AlbumArtists")
        try values.encodeIfPresent(albumCount, forKey: "AlbumCount")
        try values.encodeIfPresent(albumID, forKey: "AlbumId")
        try values.encodeIfPresent(albumPrimaryImageTag, forKey: "AlbumPrimaryImageTag")
        try values.encodeIfPresent(altitude, forKey: "Altitude")
        try values.encodeIfPresent(aperture, forKey: "Aperture")
        try values.encodeIfPresent(artistCount, forKey: "ArtistCount")
        try values.encodeIfPresent(artistItems, forKey: "ArtistItems")
        try values.encodeIfPresent(artists, forKey: "Artists")
        try values.encodeIfPresent(aspectRatio, forKey: "AspectRatio")
        try values.encodeIfPresent(audio, forKey: "Audio")
        try values.encodeIfPresent(backdropImageTags, forKey: "BackdropImageTags")
        try values.encodeIfPresent(cameraMake, forKey: "CameraMake")
        try values.encodeIfPresent(cameraModel, forKey: "CameraModel")
        try values.encodeIfPresent(canDelete, forKey: "CanDelete")
        try values.encodeIfPresent(canDownload, forKey: "CanDownload")
        try values.encodeIfPresent(channelID, forKey: "ChannelId")
        try values.encodeIfPresent(channelName, forKey: "ChannelName")
        try values.encodeIfPresent(channelNumber, forKey: "ChannelNumber")
        try values.encodeIfPresent(channelPrimaryImageTag, forKey: "ChannelPrimaryImageTag")
        try values.encodeIfPresent(channelType, forKey: "ChannelType")
        try values.encodeIfPresent(chapters, forKey: "Chapters")
        try values.encodeIfPresent(childCount, forKey: "ChildCount")
        try values.encodeIfPresent(collectionType, forKey: "CollectionType")
        try values.encodeIfPresent(communityRating, forKey: "CommunityRating")
        try values.encodeIfPresent(completionPercentage, forKey: "CompletionPercentage")
        try values.encodeIfPresent(container, forKey: "Container")
        try values.encodeIfPresent(criticRating, forKey: "CriticRating")
        try values.encodeIfPresent(cumulativeRunTimeTicks, forKey: "CumulativeRunTimeTicks")
        try values.encodeIfPresent(customRating, forKey: "CustomRating")
        try values.encodeIfPresent(dateCreated, forKey: "DateCreated")
        try values.encodeIfPresent(dateLastMediaAdded, forKey: "DateLastMediaAdded")
        try values.encodeIfPresent(displayOrder, forKey: "DisplayOrder")
        try values.encodeIfPresent(displayPreferencesID, forKey: "DisplayPreferencesId")
        try values.encodeIfPresent(enableMediaSourceDisplay, forKey: "EnableMediaSourceDisplay")
        try values.encodeIfPresent(endDate, forKey: "EndDate")
        try values.encodeIfPresent(episodeCount, forKey: "EpisodeCount")
        try values.encodeIfPresent(episodeTitle, forKey: "EpisodeTitle")
        try values.encodeIfPresent(etag, forKey: "Etag")
        try values.encodeIfPresent(exposureTime, forKey: "ExposureTime")
        try values.encodeIfPresent(externalURLs, forKey: "ExternalUrls")
        try values.encodeIfPresent(extraType, forKey: "ExtraType")
        try values.encodeIfPresent(focalLength, forKey: "FocalLength")
        try values.encodeIfPresent(forcedSortName, forKey: "ForcedSortName")
        try values.encodeIfPresent(genreItems, forKey: "GenreItems")
        try values.encodeIfPresent(genres, forKey: "Genres")
        try values.encodeIfPresent(hasSubtitles, forKey: "HasSubtitles")
        try values.encodeIfPresent(height, forKey: "Height")
        try values.encodeIfPresent(id, forKey: "Id")
        try values.encodeIfPresent(imageBlurHashes, forKey: "ImageBlurHashes")
        try values.encodeIfPresent(imageOrientation, forKey: "ImageOrientation")
        try values.encodeIfPresent(imageTags, forKey: "ImageTags")
        try values.encodeIfPresent(indexNumber, forKey: "IndexNumber")
        try values.encodeIfPresent(indexNumberEnd, forKey: "IndexNumberEnd")
        try values.encodeIfPresent(isFolder, forKey: "IsFolder")
        try values.encodeIfPresent(isHD, forKey: "IsHD")
        try values.encodeIfPresent(isKids, forKey: "IsKids")
        try values.encodeIfPresent(isLive, forKey: "IsLive")
        try values.encodeIfPresent(isMovie, forKey: "IsMovie")
        try values.encodeIfPresent(isNews, forKey: "IsNews")
        try values.encodeIfPresent(isPlaceHolder, forKey: "IsPlaceHolder")
        try values.encodeIfPresent(isPremiere, forKey: "IsPremiere")
        try values.encodeIfPresent(isRepeat, forKey: "IsRepeat")
        try values.encodeIfPresent(isSeries, forKey: "IsSeries")
        try values.encodeIfPresent(isSports, forKey: "IsSports")
        try values.encodeIfPresent(isoSpeedRating, forKey: "IsoSpeedRating")
        try values.encodeIfPresent(isoType, forKey: "IsoType")
        try values.encodeIfPresent(latitude, forKey: "Latitude")
        try values.encodeIfPresent(localTrailerCount, forKey: "LocalTrailerCount")
        try values.encodeIfPresent(locationType, forKey: "LocationType")
        try values.encodeIfPresent(lockData, forKey: "LockData")
        try values.encodeIfPresent(lockedFields, forKey: "LockedFields")
        try values.encodeIfPresent(longitude, forKey: "Longitude")
        try values.encodeIfPresent(mediaSourceCount, forKey: "MediaSourceCount")
        try values.encodeIfPresent(mediaSources, forKey: "MediaSources")
        try values.encodeIfPresent(mediaStreams, forKey: "MediaStreams")
        try values.encodeIfPresent(mediaType, forKey: "MediaType")
        try values.encodeIfPresent(movieCount, forKey: "MovieCount")
        try values.encodeIfPresent(musicVideoCount, forKey: "MusicVideoCount")
        try values.encodeIfPresent(name, forKey: "Name")
        try values.encodeIfPresent(number, forKey: "Number")
        try values.encodeIfPresent(officialRating, forKey: "OfficialRating")
        try values.encodeIfPresent(originalTitle, forKey: "OriginalTitle")
        try values.encodeIfPresent(overview, forKey: "Overview")
        try values.encodeIfPresent(parentArtImageTag, forKey: "ParentArtImageTag")
        try values.encodeIfPresent(parentArtItemID, forKey: "ParentArtItemId")
        try values.encodeIfPresent(parentBackdropImageTags, forKey: "ParentBackdropImageTags")
        try values.encodeIfPresent(parentBackdropItemID, forKey: "ParentBackdropItemId")
        try values.encodeIfPresent(parentID, forKey: "ParentId")
        try values.encodeIfPresent(parentIndexNumber, forKey: "ParentIndexNumber")
        try values.encodeIfPresent(parentLogoImageTag, forKey: "ParentLogoImageTag")
        try values.encodeIfPresent(parentLogoItemID, forKey: "ParentLogoItemId")
        try values.encodeIfPresent(parentPrimaryImageItemID, forKey: "ParentPrimaryImageItemId")
        try values.encodeIfPresent(parentPrimaryImageTag, forKey: "ParentPrimaryImageTag")
        try values.encodeIfPresent(parentThumbImageTag, forKey: "ParentThumbImageTag")
        try values.encodeIfPresent(parentThumbItemID, forKey: "ParentThumbItemId")
        try values.encodeIfPresent(partCount, forKey: "PartCount")
        try values.encodeIfPresent(path, forKey: "Path")
        try values.encodeIfPresent(people, forKey: "People")
        try values.encodeIfPresent(playAccess, forKey: "PlayAccess")
        try values.encodeIfPresent(playlistItemID, forKey: "PlaylistItemId")
        try values.encodeIfPresent(preferredMetadataCountryCode, forKey: "PreferredMetadataCountryCode")
        try values.encodeIfPresent(preferredMetadataLanguage, forKey: "PreferredMetadataLanguage")
        try values.encodeIfPresent(premiereDate, forKey: "PremiereDate")
        try values.encodeIfPresent(primaryImageAspectRatio, forKey: "PrimaryImageAspectRatio")
        try values.encodeIfPresent(productionLocations, forKey: "ProductionLocations")
        try values.encodeIfPresent(productionYear, forKey: "ProductionYear")
        try values.encodeIfPresent(programCount, forKey: "ProgramCount")
        try values.encodeIfPresent(programID, forKey: "ProgramId")
        try values.encodeIfPresent(providerIDs, forKey: "ProviderIds")
        try values.encodeIfPresent(recursiveItemCount, forKey: "RecursiveItemCount")
        try values.encodeIfPresent(remoteTrailers, forKey: "RemoteTrailers")
        try values.encodeIfPresent(runTimeTicks, forKey: "RunTimeTicks")
        try values.encodeIfPresent(screenshotImageTags, forKey: "ScreenshotImageTags")
        try values.encodeIfPresent(seasonID, forKey: "SeasonId")
        try values.encodeIfPresent(seasonName, forKey: "SeasonName")
        try values.encodeIfPresent(seriesCount, forKey: "SeriesCount")
        try values.encodeIfPresent(seriesID, forKey: "SeriesId")
        try values.encodeIfPresent(seriesName, forKey: "SeriesName")
        try values.encodeIfPresent(seriesPrimaryImageTag, forKey: "SeriesPrimaryImageTag")
        try values.encodeIfPresent(seriesStudio, forKey: "SeriesStudio")
        try values.encodeIfPresent(seriesThumbImageTag, forKey: "SeriesThumbImageTag")
        try values.encodeIfPresent(seriesTimerID, forKey: "SeriesTimerId")
        try values.encodeIfPresent(serverID, forKey: "ServerId")
        try values.encodeIfPresent(shutterSpeed, forKey: "ShutterSpeed")
        try values.encodeIfPresent(software, forKey: "Software")
        try values.encodeIfPresent(songCount, forKey: "SongCount")
        try values.encodeIfPresent(sortName, forKey: "SortName")
        try values.encodeIfPresent(sourceType, forKey: "SourceType")
        try values.encodeIfPresent(specialFeatureCount, forKey: "SpecialFeatureCount")
        try values.encodeIfPresent(startDate, forKey: "StartDate")
        try values.encodeIfPresent(status, forKey: "Status")
        try values.encodeIfPresent(studios, forKey: "Studios")
        try values.encodeIfPresent(isSupportsSync, forKey: "SupportsSync")
        try values.encodeIfPresent(taglines, forKey: "Taglines")
        try values.encodeIfPresent(tags, forKey: "Tags")
        try values.encodeIfPresent(timerID, forKey: "TimerId")
        try values.encodeIfPresent(trailerCount, forKey: "TrailerCount")
        try values.encodeIfPresent(type, forKey: "Type")
        try values.encodeIfPresent(userData, forKey: "UserData")
        try values.encodeIfPresent(video3DFormat, forKey: "Video3DFormat")
        try values.encodeIfPresent(videoType, forKey: "VideoType")
        try values.encodeIfPresent(width, forKey: "Width")
    }
}
