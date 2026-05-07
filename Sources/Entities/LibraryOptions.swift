//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import Foundation

public struct LibraryOptions: Codable, Hashable, Sendable {
    /// An enum representing the options to disable embedded subs.
    public var allowEmbeddedSubtitles: EmbeddedSubtitleOptions?
    public var automaticRefreshIntervalDays: Int?
    public var customTagDelimiters: [String]?
    public var delimiterWhitelist: [String]?
    public var disabledLocalMetadataReaders: [String]?
    public var disabledLyricFetchers: [String]?
    public var disabledMediaSegmentProviders: [String]?
    public var disabledSubtitleFetchers: [String]?
    public var enableAutomaticSeriesGrouping: Bool?
    public var enableChapterImageExtraction: Bool?
    public var enableEmbeddedEpisodeInfos: Bool?
    public var enableEmbeddedExtrasTitles: Bool?
    public var enableEmbeddedTitles: Bool?
    @available(*, deprecated, message: "Deprecated")
    public var enableInternetProviders: Bool?
    public var enableLUFSScan: Bool?
    public var enablePhotos: Bool?
    public var enableRealtimeMonitor: Bool?
    public var enableTrickplayImageExtraction: Bool?
    public var isAutomaticallyaddtocollection: Bool?
    public var isEnabled: Bool?
    public var isExtractchapterimagesduringlibraryscan: Bool?
    public var isExtracttrickplayimagesduringlibraryscan: Bool?
    public var isPrefernonstandardartiststag: Bool
    public var isSavelocalmetadata: Bool?
    public var isSavelyricswithmedia: Bool
    public var isSavesubtitleswithmedia: Bool?
    public var isSavetrickplaywithmedia: Bool
    public var isSkipsubtitlesifaudiotrackmatches: Bool?
    public var isSkipsubtitlesifembeddedsubtitlespresent: Bool?
    public var localMetadataReaderOrder: [String]?
    public var lyricFetcherOrder: [String]?
    public var mediaSegmentProviderOrder: [String]?
    /// Gets or sets the metadata country code.
    public var metadataCountryCode: String?
    public var metadataSavers: [String]?
    public var pathInfos: [MediaPathInfo]?
    /// Gets or sets the preferred metadata language.
    public var preferredMetadataLanguage: String?
    public var requirePerfectSubtitleMatch: Bool?
    public var seasonZeroDisplayName: String?
    public var subtitleDownloadLanguages: [String]?
    public var subtitleFetcherOrder: [String]?
    public var typeOptions: [TypeOptions]?
    public var useCustomTagDelimiters: Bool

    public init(
        allowEmbeddedSubtitles: EmbeddedSubtitleOptions? = nil,
        automaticRefreshIntervalDays: Int? = nil,
        customTagDelimiters: [String]? = nil,
        delimiterWhitelist: [String]? = nil,
        disabledLocalMetadataReaders: [String]? = nil,
        disabledLyricFetchers: [String]? = nil,
        disabledMediaSegmentProviders: [String]? = nil,
        disabledSubtitleFetchers: [String]? = nil,
        enableAutomaticSeriesGrouping: Bool? = nil,
        enableChapterImageExtraction: Bool? = nil,
        enableEmbeddedEpisodeInfos: Bool? = nil,
        enableEmbeddedExtrasTitles: Bool? = nil,
        enableEmbeddedTitles: Bool? = nil,
        enableInternetProviders: Bool? = nil,
        enableLUFSScan: Bool? = nil,
        enablePhotos: Bool? = nil,
        enableRealtimeMonitor: Bool? = nil,
        enableTrickplayImageExtraction: Bool? = nil,
        isAutomaticallyaddtocollection: Bool? = nil,
        isEnabled: Bool? = nil,
        isExtractchapterimagesduringlibraryscan: Bool? = nil,
        isExtracttrickplayimagesduringlibraryscan: Bool? = nil,
        isPrefernonstandardartiststag: Bool? = nil,
        isSavelocalmetadata: Bool? = nil,
        isSavelyricswithmedia: Bool? = nil,
        isSavesubtitleswithmedia: Bool? = nil,
        isSavetrickplaywithmedia: Bool? = nil,
        isSkipsubtitlesifaudiotrackmatches: Bool? = nil,
        isSkipsubtitlesifembeddedsubtitlespresent: Bool? = nil,
        localMetadataReaderOrder: [String]? = nil,
        lyricFetcherOrder: [String]? = nil,
        mediaSegmentProviderOrder: [String]? = nil,
        metadataCountryCode: String? = nil,
        metadataSavers: [String]? = nil,
        pathInfos: [MediaPathInfo]? = nil,
        preferredMetadataLanguage: String? = nil,
        requirePerfectSubtitleMatch: Bool? = nil,
        seasonZeroDisplayName: String? = nil,
        subtitleDownloadLanguages: [String]? = nil,
        subtitleFetcherOrder: [String]? = nil,
        typeOptions: [TypeOptions]? = nil,
        useCustomTagDelimiters: Bool? = nil
    ) {
        self.allowEmbeddedSubtitles = allowEmbeddedSubtitles
        self.automaticRefreshIntervalDays = automaticRefreshIntervalDays
        self.customTagDelimiters = customTagDelimiters
        self.delimiterWhitelist = delimiterWhitelist
        self.disabledLocalMetadataReaders = disabledLocalMetadataReaders
        self.disabledLyricFetchers = disabledLyricFetchers
        self.disabledMediaSegmentProviders = disabledMediaSegmentProviders
        self.disabledSubtitleFetchers = disabledSubtitleFetchers
        self.enableAutomaticSeriesGrouping = enableAutomaticSeriesGrouping
        self.enableChapterImageExtraction = enableChapterImageExtraction
        self.enableEmbeddedEpisodeInfos = enableEmbeddedEpisodeInfos
        self.enableEmbeddedExtrasTitles = enableEmbeddedExtrasTitles
        self.enableEmbeddedTitles = enableEmbeddedTitles
        self.enableInternetProviders = enableInternetProviders
        self.enableLUFSScan = enableLUFSScan
        self.enablePhotos = enablePhotos
        self.enableRealtimeMonitor = enableRealtimeMonitor
        self.enableTrickplayImageExtraction = enableTrickplayImageExtraction
        self.isAutomaticallyaddtocollection = isAutomaticallyaddtocollection
        self.isEnabled = isEnabled
        self.isExtractchapterimagesduringlibraryscan = isExtractchapterimagesduringlibraryscan
        self.isExtracttrickplayimagesduringlibraryscan = isExtracttrickplayimagesduringlibraryscan
        self.isPrefernonstandardartiststag = isPrefernonstandardartiststag ?? false
        self.isSavelocalmetadata = isSavelocalmetadata
        self.isSavelyricswithmedia = isSavelyricswithmedia ?? false
        self.isSavesubtitleswithmedia = isSavesubtitleswithmedia
        self.isSavetrickplaywithmedia = isSavetrickplaywithmedia ?? false
        self.isSkipsubtitlesifaudiotrackmatches = isSkipsubtitlesifaudiotrackmatches
        self.isSkipsubtitlesifembeddedsubtitlespresent = isSkipsubtitlesifembeddedsubtitlespresent
        self.localMetadataReaderOrder = localMetadataReaderOrder
        self.lyricFetcherOrder = lyricFetcherOrder
        self.mediaSegmentProviderOrder = mediaSegmentProviderOrder
        self.metadataCountryCode = metadataCountryCode
        self.metadataSavers = metadataSavers
        self.pathInfos = pathInfos
        self.preferredMetadataLanguage = preferredMetadataLanguage
        self.requirePerfectSubtitleMatch = requirePerfectSubtitleMatch
        self.seasonZeroDisplayName = seasonZeroDisplayName
        self.subtitleDownloadLanguages = subtitleDownloadLanguages
        self.subtitleFetcherOrder = subtitleFetcherOrder
        self.typeOptions = typeOptions
        self.useCustomTagDelimiters = useCustomTagDelimiters ?? false
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.allowEmbeddedSubtitles = try values.decodeIfPresent(EmbeddedSubtitleOptions.self, forKey: "AllowEmbeddedSubtitles")
        self.automaticRefreshIntervalDays = try values.decodeIfPresent(Int.self, forKey: "AutomaticRefreshIntervalDays")
        self.customTagDelimiters = try values.decodeIfPresent([String].self, forKey: "CustomTagDelimiters")
        self.delimiterWhitelist = try values.decodeIfPresent([String].self, forKey: "DelimiterWhitelist")
        self.disabledLocalMetadataReaders = try values.decodeIfPresent([String].self, forKey: "DisabledLocalMetadataReaders")
        self.disabledLyricFetchers = try values.decodeIfPresent([String].self, forKey: "DisabledLyricFetchers")
        self.disabledMediaSegmentProviders = try values.decodeIfPresent([String].self, forKey: "DisabledMediaSegmentProviders")
        self.disabledSubtitleFetchers = try values.decodeIfPresent([String].self, forKey: "DisabledSubtitleFetchers")
        self.enableAutomaticSeriesGrouping = try values.decodeIfPresent(Bool.self, forKey: "EnableAutomaticSeriesGrouping")
        self.enableChapterImageExtraction = try values.decodeIfPresent(Bool.self, forKey: "EnableChapterImageExtraction")
        self.enableEmbeddedEpisodeInfos = try values.decodeIfPresent(Bool.self, forKey: "EnableEmbeddedEpisodeInfos")
        self.enableEmbeddedExtrasTitles = try values.decodeIfPresent(Bool.self, forKey: "EnableEmbeddedExtrasTitles")
        self.enableEmbeddedTitles = try values.decodeIfPresent(Bool.self, forKey: "EnableEmbeddedTitles")
        self.enableInternetProviders = try values.decodeIfPresent(Bool.self, forKey: "EnableInternetProviders")
        self.enableLUFSScan = try values.decodeIfPresent(Bool.self, forKey: "EnableLUFSScan")
        self.enablePhotos = try values.decodeIfPresent(Bool.self, forKey: "EnablePhotos")
        self.enableRealtimeMonitor = try values.decodeIfPresent(Bool.self, forKey: "EnableRealtimeMonitor")
        self.enableTrickplayImageExtraction = try values.decodeIfPresent(Bool.self, forKey: "EnableTrickplayImageExtraction")
        self.isAutomaticallyaddtocollection = try values.decodeIfPresent(Bool.self, forKey: "AutomaticallyAddToCollection")
        self.isEnabled = try values.decodeIfPresent(Bool.self, forKey: "Enabled")
        self.isExtractchapterimagesduringlibraryscan = try values.decodeIfPresent(
            Bool.self,
            forKey: "ExtractChapterImagesDuringLibraryScan"
        )
        self.isExtracttrickplayimagesduringlibraryscan = try values.decodeIfPresent(
            Bool.self,
            forKey: "ExtractTrickplayImagesDuringLibraryScan"
        )
        self.isPrefernonstandardartiststag = try values.decodeIfPresent(Bool.self, forKey: "PreferNonstandardArtistsTag") ?? false
        self.isSavelocalmetadata = try values.decodeIfPresent(Bool.self, forKey: "SaveLocalMetadata")
        self.isSavelyricswithmedia = try values.decodeIfPresent(Bool.self, forKey: "SaveLyricsWithMedia") ?? false
        self.isSavesubtitleswithmedia = try values.decodeIfPresent(Bool.self, forKey: "SaveSubtitlesWithMedia")
        self.isSavetrickplaywithmedia = try values.decodeIfPresent(Bool.self, forKey: "SaveTrickplayWithMedia") ?? false
        self.isSkipsubtitlesifaudiotrackmatches = try values.decodeIfPresent(Bool.self, forKey: "SkipSubtitlesIfAudioTrackMatches")
        self.isSkipsubtitlesifembeddedsubtitlespresent = try values.decodeIfPresent(
            Bool.self,
            forKey: "SkipSubtitlesIfEmbeddedSubtitlesPresent"
        )
        self.localMetadataReaderOrder = try values.decodeIfPresent([String].self, forKey: "LocalMetadataReaderOrder")
        self.lyricFetcherOrder = try values.decodeIfPresent([String].self, forKey: "LyricFetcherOrder")
        self.mediaSegmentProviderOrder = try values.decodeIfPresent([String].self, forKey: "MediaSegmentProviderOrder")
        self.metadataCountryCode = try values.decodeIfPresent(String.self, forKey: "MetadataCountryCode")
        self.metadataSavers = try values.decodeIfPresent([String].self, forKey: "MetadataSavers")
        self.pathInfos = try values.decodeIfPresent([MediaPathInfo].self, forKey: "PathInfos")
        self.preferredMetadataLanguage = try values.decodeIfPresent(String.self, forKey: "PreferredMetadataLanguage")
        self.requirePerfectSubtitleMatch = try values.decodeIfPresent(Bool.self, forKey: "RequirePerfectSubtitleMatch")
        self.seasonZeroDisplayName = try values.decodeIfPresent(String.self, forKey: "SeasonZeroDisplayName")
        self.subtitleDownloadLanguages = try values.decodeIfPresent([String].self, forKey: "SubtitleDownloadLanguages")
        self.subtitleFetcherOrder = try values.decodeIfPresent([String].self, forKey: "SubtitleFetcherOrder")
        self.typeOptions = try values.decodeIfPresent([TypeOptions].self, forKey: "TypeOptions")
        self.useCustomTagDelimiters = try values.decodeIfPresent(Bool.self, forKey: "UseCustomTagDelimiters") ?? false
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(allowEmbeddedSubtitles, forKey: "AllowEmbeddedSubtitles")
        try values.encodeIfPresent(automaticRefreshIntervalDays, forKey: "AutomaticRefreshIntervalDays")
        try values.encodeIfPresent(customTagDelimiters, forKey: "CustomTagDelimiters")
        try values.encodeIfPresent(delimiterWhitelist, forKey: "DelimiterWhitelist")
        try values.encodeIfPresent(disabledLocalMetadataReaders, forKey: "DisabledLocalMetadataReaders")
        try values.encodeIfPresent(disabledLyricFetchers, forKey: "DisabledLyricFetchers")
        try values.encodeIfPresent(disabledMediaSegmentProviders, forKey: "DisabledMediaSegmentProviders")
        try values.encodeIfPresent(disabledSubtitleFetchers, forKey: "DisabledSubtitleFetchers")
        try values.encodeIfPresent(enableAutomaticSeriesGrouping, forKey: "EnableAutomaticSeriesGrouping")
        try values.encodeIfPresent(enableChapterImageExtraction, forKey: "EnableChapterImageExtraction")
        try values.encodeIfPresent(enableEmbeddedEpisodeInfos, forKey: "EnableEmbeddedEpisodeInfos")
        try values.encodeIfPresent(enableEmbeddedExtrasTitles, forKey: "EnableEmbeddedExtrasTitles")
        try values.encodeIfPresent(enableEmbeddedTitles, forKey: "EnableEmbeddedTitles")
        try values.encodeIfPresent(enableInternetProviders, forKey: "EnableInternetProviders")
        try values.encodeIfPresent(enableLUFSScan, forKey: "EnableLUFSScan")
        try values.encodeIfPresent(enablePhotos, forKey: "EnablePhotos")
        try values.encodeIfPresent(enableRealtimeMonitor, forKey: "EnableRealtimeMonitor")
        try values.encodeIfPresent(enableTrickplayImageExtraction, forKey: "EnableTrickplayImageExtraction")
        try values.encodeIfPresent(isAutomaticallyaddtocollection, forKey: "AutomaticallyAddToCollection")
        try values.encodeIfPresent(isEnabled, forKey: "Enabled")
        try values.encodeIfPresent(isExtractchapterimagesduringlibraryscan, forKey: "ExtractChapterImagesDuringLibraryScan")
        try values.encodeIfPresent(isExtracttrickplayimagesduringlibraryscan, forKey: "ExtractTrickplayImagesDuringLibraryScan")
        try values.encodeIfPresent(isPrefernonstandardartiststag, forKey: "PreferNonstandardArtistsTag")
        try values.encodeIfPresent(isSavelocalmetadata, forKey: "SaveLocalMetadata")
        try values.encodeIfPresent(isSavelyricswithmedia, forKey: "SaveLyricsWithMedia")
        try values.encodeIfPresent(isSavesubtitleswithmedia, forKey: "SaveSubtitlesWithMedia")
        try values.encodeIfPresent(isSavetrickplaywithmedia, forKey: "SaveTrickplayWithMedia")
        try values.encodeIfPresent(isSkipsubtitlesifaudiotrackmatches, forKey: "SkipSubtitlesIfAudioTrackMatches")
        try values.encodeIfPresent(isSkipsubtitlesifembeddedsubtitlespresent, forKey: "SkipSubtitlesIfEmbeddedSubtitlesPresent")
        try values.encodeIfPresent(localMetadataReaderOrder, forKey: "LocalMetadataReaderOrder")
        try values.encodeIfPresent(lyricFetcherOrder, forKey: "LyricFetcherOrder")
        try values.encodeIfPresent(mediaSegmentProviderOrder, forKey: "MediaSegmentProviderOrder")
        try values.encodeIfPresent(metadataCountryCode, forKey: "MetadataCountryCode")
        try values.encodeIfPresent(metadataSavers, forKey: "MetadataSavers")
        try values.encodeIfPresent(pathInfos, forKey: "PathInfos")
        try values.encodeIfPresent(preferredMetadataLanguage, forKey: "PreferredMetadataLanguage")
        try values.encodeIfPresent(requirePerfectSubtitleMatch, forKey: "RequirePerfectSubtitleMatch")
        try values.encodeIfPresent(seasonZeroDisplayName, forKey: "SeasonZeroDisplayName")
        try values.encodeIfPresent(subtitleDownloadLanguages, forKey: "SubtitleDownloadLanguages")
        try values.encodeIfPresent(subtitleFetcherOrder, forKey: "SubtitleFetcherOrder")
        try values.encodeIfPresent(typeOptions, forKey: "TypeOptions")
        try values.encodeIfPresent(useCustomTagDelimiters, forKey: "UseCustomTagDelimiters")
    }
}
