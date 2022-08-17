//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct LibraryOptions: Codable {
    /// An enum representing the options to disable embedded subs.
    public var allowEmbeddedSubtitles: EmbeddedSubtitleOptions?
    public var automaticRefreshIntervalDays: Int32?
    public var isAutomaticallyAddToCollection: Bool?
    public var disabledLocalMetadataReaders: [String]?
    public var disabledSubtitleFetchers: [String]?
    public var enableAutomaticSeriesGrouping: Bool?
    public var enableChapterImageExtraction: Bool?
    public var enableEmbeddedEpisodeInfos: Bool?
    public var enableEmbeddedTitles: Bool?
    /// - warning: Deprecated.
    public var enableInternetProviders: Bool?
    public var enablePhotos: Bool?
    public var enableRealtimeMonitor: Bool?
    public var isExtractChapterImagesDuringLibraryScan: Bool?
    public var localMetadataReaderOrder: [String]?
    /// Gets or sets the metadata country code.
    public var metadataCountryCode: String?
    public var metadataSavers: [String]?
    public var pathInfos: [MediaPathInfo]?
    /// Gets or sets the preferred metadata language.
    public var preferredMetadataLanguage: String?
    public var requirePerfectSubtitleMatch: Bool?
    public var isSaveLocalMetadata: Bool?
    public var isSaveSubtitlesWithMedia: Bool?
    public var seasonZeroDisplayName: String?
    public var isSkipSubtitlesIfAudioTrackMatches: Bool?
    public var isSkipSubtitlesIfEmbeddedSubtitlesPresent: Bool?
    public var subtitleDownloadLanguages: [String]?
    public var subtitleFetcherOrder: [String]?
    public var typeOptions: [TypeOptions]?

    public init(allowEmbeddedSubtitles: EmbeddedSubtitleOptions? = nil, automaticRefreshIntervalDays: Int32? = nil, isAutomaticallyAddToCollection: Bool? = nil, disabledLocalMetadataReaders: [String]? = nil, disabledSubtitleFetchers: [String]? = nil, enableAutomaticSeriesGrouping: Bool? = nil, enableChapterImageExtraction: Bool? = nil, enableEmbeddedEpisodeInfos: Bool? = nil, enableEmbeddedTitles: Bool? = nil, enableInternetProviders: Bool? = nil, enablePhotos: Bool? = nil, enableRealtimeMonitor: Bool? = nil, isExtractChapterImagesDuringLibraryScan: Bool? = nil, localMetadataReaderOrder: [String]? = nil, metadataCountryCode: String? = nil, metadataSavers: [String]? = nil, pathInfos: [MediaPathInfo]? = nil, preferredMetadataLanguage: String? = nil, requirePerfectSubtitleMatch: Bool? = nil, isSaveLocalMetadata: Bool? = nil, isSaveSubtitlesWithMedia: Bool? = nil, seasonZeroDisplayName: String? = nil, isSkipSubtitlesIfAudioTrackMatches: Bool? = nil, isSkipSubtitlesIfEmbeddedSubtitlesPresent: Bool? = nil, subtitleDownloadLanguages: [String]? = nil, subtitleFetcherOrder: [String]? = nil, typeOptions: [TypeOptions]? = nil) {
        self.allowEmbeddedSubtitles = allowEmbeddedSubtitles
        self.automaticRefreshIntervalDays = automaticRefreshIntervalDays
        self.isAutomaticallyAddToCollection = isAutomaticallyAddToCollection
        self.disabledLocalMetadataReaders = disabledLocalMetadataReaders
        self.disabledSubtitleFetchers = disabledSubtitleFetchers
        self.enableAutomaticSeriesGrouping = enableAutomaticSeriesGrouping
        self.enableChapterImageExtraction = enableChapterImageExtraction
        self.enableEmbeddedEpisodeInfos = enableEmbeddedEpisodeInfos
        self.enableEmbeddedTitles = enableEmbeddedTitles
        self.enableInternetProviders = enableInternetProviders
        self.enablePhotos = enablePhotos
        self.enableRealtimeMonitor = enableRealtimeMonitor
        self.isExtractChapterImagesDuringLibraryScan = isExtractChapterImagesDuringLibraryScan
        self.localMetadataReaderOrder = localMetadataReaderOrder
        self.metadataCountryCode = metadataCountryCode
        self.metadataSavers = metadataSavers
        self.pathInfos = pathInfos
        self.preferredMetadataLanguage = preferredMetadataLanguage
        self.requirePerfectSubtitleMatch = requirePerfectSubtitleMatch
        self.isSaveLocalMetadata = isSaveLocalMetadata
        self.isSaveSubtitlesWithMedia = isSaveSubtitlesWithMedia
        self.seasonZeroDisplayName = seasonZeroDisplayName
        self.isSkipSubtitlesIfAudioTrackMatches = isSkipSubtitlesIfAudioTrackMatches
        self.isSkipSubtitlesIfEmbeddedSubtitlesPresent = isSkipSubtitlesIfEmbeddedSubtitlesPresent
        self.subtitleDownloadLanguages = subtitleDownloadLanguages
        self.subtitleFetcherOrder = subtitleFetcherOrder
        self.typeOptions = typeOptions
    }
}
