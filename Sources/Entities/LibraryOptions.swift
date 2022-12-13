//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct LibraryOptions: Codable, Hashable {
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

    public init(
        allowEmbeddedSubtitles: EmbeddedSubtitleOptions? = nil,
        automaticRefreshIntervalDays: Int32? = nil,
        isAutomaticallyAddToCollection: Bool? = nil,
        disabledLocalMetadataReaders: [String]? = nil,
        disabledSubtitleFetchers: [String]? = nil,
        enableAutomaticSeriesGrouping: Bool? = nil,
        enableChapterImageExtraction: Bool? = nil,
        enableEmbeddedEpisodeInfos: Bool? = nil,
        enableEmbeddedTitles: Bool? = nil,
        enableInternetProviders: Bool? = nil,
        enablePhotos: Bool? = nil,
        enableRealtimeMonitor: Bool? = nil,
        isExtractChapterImagesDuringLibraryScan: Bool? = nil,
        localMetadataReaderOrder: [String]? = nil,
        metadataCountryCode: String? = nil,
        metadataSavers: [String]? = nil,
        pathInfos: [MediaPathInfo]? = nil,
        preferredMetadataLanguage: String? = nil,
        requirePerfectSubtitleMatch: Bool? = nil,
        isSaveLocalMetadata: Bool? = nil,
        isSaveSubtitlesWithMedia: Bool? = nil,
        seasonZeroDisplayName: String? = nil,
        isSkipSubtitlesIfAudioTrackMatches: Bool? = nil,
        isSkipSubtitlesIfEmbeddedSubtitlesPresent: Bool? = nil,
        subtitleDownloadLanguages: [String]? = nil,
        subtitleFetcherOrder: [String]? = nil,
        typeOptions: [TypeOptions]? = nil
    ) {
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

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.allowEmbeddedSubtitles = try values.decodeIfPresent(EmbeddedSubtitleOptions.self, forKey: "AllowEmbeddedSubtitles")
        self.automaticRefreshIntervalDays = try values.decodeIfPresent(Int32.self, forKey: "AutomaticRefreshIntervalDays")
        self.isAutomaticallyAddToCollection = try values.decodeIfPresent(Bool.self, forKey: "AutomaticallyAddToCollection")
        self.disabledLocalMetadataReaders = try values.decodeIfPresent([String].self, forKey: "DisabledLocalMetadataReaders")
        self.disabledSubtitleFetchers = try values.decodeIfPresent([String].self, forKey: "DisabledSubtitleFetchers")
        self.enableAutomaticSeriesGrouping = try values.decodeIfPresent(Bool.self, forKey: "EnableAutomaticSeriesGrouping")
        self.enableChapterImageExtraction = try values.decodeIfPresent(Bool.self, forKey: "EnableChapterImageExtraction")
        self.enableEmbeddedEpisodeInfos = try values.decodeIfPresent(Bool.self, forKey: "EnableEmbeddedEpisodeInfos")
        self.enableEmbeddedTitles = try values.decodeIfPresent(Bool.self, forKey: "EnableEmbeddedTitles")
        self.enableInternetProviders = try values.decodeIfPresent(Bool.self, forKey: "EnableInternetProviders")
        self.enablePhotos = try values.decodeIfPresent(Bool.self, forKey: "EnablePhotos")
        self.enableRealtimeMonitor = try values.decodeIfPresent(Bool.self, forKey: "EnableRealtimeMonitor")
        self.isExtractChapterImagesDuringLibraryScan = try values.decodeIfPresent(
            Bool.self,
            forKey: "ExtractChapterImagesDuringLibraryScan"
        )
        self.localMetadataReaderOrder = try values.decodeIfPresent([String].self, forKey: "LocalMetadataReaderOrder")
        self.metadataCountryCode = try values.decodeIfPresent(String.self, forKey: "MetadataCountryCode")
        self.metadataSavers = try values.decodeIfPresent([String].self, forKey: "MetadataSavers")
        self.pathInfos = try values.decodeIfPresent([MediaPathInfo].self, forKey: "PathInfos")
        self.preferredMetadataLanguage = try values.decodeIfPresent(String.self, forKey: "PreferredMetadataLanguage")
        self.requirePerfectSubtitleMatch = try values.decodeIfPresent(Bool.self, forKey: "RequirePerfectSubtitleMatch")
        self.isSaveLocalMetadata = try values.decodeIfPresent(Bool.self, forKey: "SaveLocalMetadata")
        self.isSaveSubtitlesWithMedia = try values.decodeIfPresent(Bool.self, forKey: "SaveSubtitlesWithMedia")
        self.seasonZeroDisplayName = try values.decodeIfPresent(String.self, forKey: "SeasonZeroDisplayName")
        self.isSkipSubtitlesIfAudioTrackMatches = try values.decodeIfPresent(Bool.self, forKey: "SkipSubtitlesIfAudioTrackMatches")
        self.isSkipSubtitlesIfEmbeddedSubtitlesPresent = try values.decodeIfPresent(
            Bool.self,
            forKey: "SkipSubtitlesIfEmbeddedSubtitlesPresent"
        )
        self.subtitleDownloadLanguages = try values.decodeIfPresent([String].self, forKey: "SubtitleDownloadLanguages")
        self.subtitleFetcherOrder = try values.decodeIfPresent([String].self, forKey: "SubtitleFetcherOrder")
        self.typeOptions = try values.decodeIfPresent([TypeOptions].self, forKey: "TypeOptions")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(allowEmbeddedSubtitles, forKey: "AllowEmbeddedSubtitles")
        try values.encodeIfPresent(automaticRefreshIntervalDays, forKey: "AutomaticRefreshIntervalDays")
        try values.encodeIfPresent(isAutomaticallyAddToCollection, forKey: "AutomaticallyAddToCollection")
        try values.encodeIfPresent(disabledLocalMetadataReaders, forKey: "DisabledLocalMetadataReaders")
        try values.encodeIfPresent(disabledSubtitleFetchers, forKey: "DisabledSubtitleFetchers")
        try values.encodeIfPresent(enableAutomaticSeriesGrouping, forKey: "EnableAutomaticSeriesGrouping")
        try values.encodeIfPresent(enableChapterImageExtraction, forKey: "EnableChapterImageExtraction")
        try values.encodeIfPresent(enableEmbeddedEpisodeInfos, forKey: "EnableEmbeddedEpisodeInfos")
        try values.encodeIfPresent(enableEmbeddedTitles, forKey: "EnableEmbeddedTitles")
        try values.encodeIfPresent(enableInternetProviders, forKey: "EnableInternetProviders")
        try values.encodeIfPresent(enablePhotos, forKey: "EnablePhotos")
        try values.encodeIfPresent(enableRealtimeMonitor, forKey: "EnableRealtimeMonitor")
        try values.encodeIfPresent(isExtractChapterImagesDuringLibraryScan, forKey: "ExtractChapterImagesDuringLibraryScan")
        try values.encodeIfPresent(localMetadataReaderOrder, forKey: "LocalMetadataReaderOrder")
        try values.encodeIfPresent(metadataCountryCode, forKey: "MetadataCountryCode")
        try values.encodeIfPresent(metadataSavers, forKey: "MetadataSavers")
        try values.encodeIfPresent(pathInfos, forKey: "PathInfos")
        try values.encodeIfPresent(preferredMetadataLanguage, forKey: "PreferredMetadataLanguage")
        try values.encodeIfPresent(requirePerfectSubtitleMatch, forKey: "RequirePerfectSubtitleMatch")
        try values.encodeIfPresent(isSaveLocalMetadata, forKey: "SaveLocalMetadata")
        try values.encodeIfPresent(isSaveSubtitlesWithMedia, forKey: "SaveSubtitlesWithMedia")
        try values.encodeIfPresent(seasonZeroDisplayName, forKey: "SeasonZeroDisplayName")
        try values.encodeIfPresent(isSkipSubtitlesIfAudioTrackMatches, forKey: "SkipSubtitlesIfAudioTrackMatches")
        try values.encodeIfPresent(isSkipSubtitlesIfEmbeddedSubtitlesPresent, forKey: "SkipSubtitlesIfEmbeddedSubtitlesPresent")
        try values.encodeIfPresent(subtitleDownloadLanguages, forKey: "SubtitleDownloadLanguages")
        try values.encodeIfPresent(subtitleFetcherOrder, forKey: "SubtitleFetcherOrder")
        try values.encodeIfPresent(typeOptions, forKey: "TypeOptions")
    }
}
