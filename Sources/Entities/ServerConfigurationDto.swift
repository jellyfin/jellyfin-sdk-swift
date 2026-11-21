//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2026 Jellyfin & Jellyfin Contributors
//

import Foundation

/// The server configuration DTO for API use.
public struct ServerConfigurationDto: Codable, Hashable, Sendable {
    public var activityLogRetentionDays: Int?
    public var allowClientLogUpload: Bool?
    public var cachePath: String?
    public var cacheSize: Int?
    public var castReceiverApplications: [CastReceiverApplication]?
    /// Enum ImageResolution.
    public var chapterImageResolution: ImageResolution?
    public var codecsUsed: [String]?
    public var contentTypes: [NameValuePair]?
    public var corsHosts: [String]?
    public var dummyChapterDuration: Int?
    public var enableCaseSensitiveItemIDs: Bool?
    public var enableExternalContentInSuggestions: Bool?
    public var enableFolderView: Bool?
    public var enableGroupingMoviesIntoCollections: Bool?
    public var enableGroupingShowsIntoCollections: Bool?
    public var enableLegacyAuthorization: Bool?
    public var enableMetrics: Bool?
    public var enableNormalizedItemByNameIDs: Bool?
    public var enableSlowResponseWarning: Bool?
    public var imageExtractionTimeoutMs: Int?
    /// The convention used for naming saved images.
    public var imageSavingConvention: ImageSavingConvention?
    public var inactiveSessionThreshold: Int?
    public var isDisableLiveTvChannelUserDataName: Bool?
    public var isDisplaySpecialsWithinSeasons: Bool?
    public var isPortAuthorized: Bool?
    public var isQuickConnectAvailable: Bool?
    public var isSaveMetadataHidden: Bool?
    public var isSkipDeserializationForBasicTypes: Bool?
    public var isStartupWizardCompleted: Bool?
    public var libraryMetadataRefreshConcurrency: Int?
    public var libraryMonitorDelay: Int?
    public var libraryScanFanoutConcurrency: Int?
    public var libraryUpdateDuration: Int?
    public var logFileRetentionDays: Int?
    public var maxAudiobookResume: Int?
    public var maxResumePct: Int?
    public var metadataCountryCode: String?
    public var metadataOptions: [MetadataOptions]?
    public var metadataPath: String?
    public var minAudiobookResume: Int?
    public var minResumeDurationSeconds: Int?
    public var minResumePct: Int?
    public var parallelImageEncodingLimit: Int?
    public var pathSubstitutions: [PathSubstitution]?
    public var pluginRepositories: [RepositoryInfo]?
    public var preferredMetadataLanguage: String?
    public var previousVersionStr: String?
    public var remoteClientBitrateLimit: Int?
    public var serverName: String?
    public var slowResponseThresholdMs: Int?
    public var sortRemoveCharacters: [String]?
    public var sortRemoveWords: [String]?
    public var sortReplaceCharacters: [String]?
    /// Class TrickplayOptions.
    public var trickplayOptions: TrickplayOptions?
    public var uICulture: String?

    public init(
        activityLogRetentionDays: Int? = nil,
        allowClientLogUpload: Bool? = nil,
        cachePath: String? = nil,
        cacheSize: Int? = nil,
        castReceiverApplications: [CastReceiverApplication]? = nil,
        chapterImageResolution: ImageResolution? = nil,
        codecsUsed: [String]? = nil,
        contentTypes: [NameValuePair]? = nil,
        corsHosts: [String]? = nil,
        dummyChapterDuration: Int? = nil,
        enableCaseSensitiveItemIDs: Bool? = nil,
        enableExternalContentInSuggestions: Bool? = nil,
        enableFolderView: Bool? = nil,
        enableGroupingMoviesIntoCollections: Bool? = nil,
        enableGroupingShowsIntoCollections: Bool? = nil,
        enableLegacyAuthorization: Bool? = nil,
        enableMetrics: Bool? = nil,
        enableNormalizedItemByNameIDs: Bool? = nil,
        enableSlowResponseWarning: Bool? = nil,
        imageExtractionTimeoutMs: Int? = nil,
        imageSavingConvention: ImageSavingConvention? = nil,
        inactiveSessionThreshold: Int? = nil,
        isDisableLiveTvChannelUserDataName: Bool? = nil,
        isDisplaySpecialsWithinSeasons: Bool? = nil,
        isPortAuthorized: Bool? = nil,
        isQuickConnectAvailable: Bool? = nil,
        isSaveMetadataHidden: Bool? = nil,
        isSkipDeserializationForBasicTypes: Bool? = nil,
        isStartupWizardCompleted: Bool? = nil,
        libraryMetadataRefreshConcurrency: Int? = nil,
        libraryMonitorDelay: Int? = nil,
        libraryScanFanoutConcurrency: Int? = nil,
        libraryUpdateDuration: Int? = nil,
        logFileRetentionDays: Int? = nil,
        maxAudiobookResume: Int? = nil,
        maxResumePct: Int? = nil,
        metadataCountryCode: String? = nil,
        metadataOptions: [MetadataOptions]? = nil,
        metadataPath: String? = nil,
        minAudiobookResume: Int? = nil,
        minResumeDurationSeconds: Int? = nil,
        minResumePct: Int? = nil,
        parallelImageEncodingLimit: Int? = nil,
        pathSubstitutions: [PathSubstitution]? = nil,
        pluginRepositories: [RepositoryInfo]? = nil,
        preferredMetadataLanguage: String? = nil,
        previousVersionStr: String? = nil,
        remoteClientBitrateLimit: Int? = nil,
        serverName: String? = nil,
        slowResponseThresholdMs: Int? = nil,
        sortRemoveCharacters: [String]? = nil,
        sortRemoveWords: [String]? = nil,
        sortReplaceCharacters: [String]? = nil,
        trickplayOptions: TrickplayOptions? = nil,
        uICulture: String? = nil
    ) {
        self.activityLogRetentionDays = activityLogRetentionDays
        self.allowClientLogUpload = allowClientLogUpload
        self.cachePath = cachePath
        self.cacheSize = cacheSize
        self.castReceiverApplications = castReceiverApplications
        self.chapterImageResolution = chapterImageResolution
        self.codecsUsed = codecsUsed
        self.contentTypes = contentTypes
        self.corsHosts = corsHosts
        self.dummyChapterDuration = dummyChapterDuration
        self.enableCaseSensitiveItemIDs = enableCaseSensitiveItemIDs
        self.enableExternalContentInSuggestions = enableExternalContentInSuggestions
        self.enableFolderView = enableFolderView
        self.enableGroupingMoviesIntoCollections = enableGroupingMoviesIntoCollections
        self.enableGroupingShowsIntoCollections = enableGroupingShowsIntoCollections
        self.enableLegacyAuthorization = enableLegacyAuthorization
        self.enableMetrics = enableMetrics
        self.enableNormalizedItemByNameIDs = enableNormalizedItemByNameIDs
        self.enableSlowResponseWarning = enableSlowResponseWarning
        self.imageExtractionTimeoutMs = imageExtractionTimeoutMs
        self.imageSavingConvention = imageSavingConvention
        self.inactiveSessionThreshold = inactiveSessionThreshold
        self.isDisableLiveTvChannelUserDataName = isDisableLiveTvChannelUserDataName
        self.isDisplaySpecialsWithinSeasons = isDisplaySpecialsWithinSeasons
        self.isPortAuthorized = isPortAuthorized
        self.isQuickConnectAvailable = isQuickConnectAvailable
        self.isSaveMetadataHidden = isSaveMetadataHidden
        self.isSkipDeserializationForBasicTypes = isSkipDeserializationForBasicTypes
        self.isStartupWizardCompleted = isStartupWizardCompleted
        self.libraryMetadataRefreshConcurrency = libraryMetadataRefreshConcurrency
        self.libraryMonitorDelay = libraryMonitorDelay
        self.libraryScanFanoutConcurrency = libraryScanFanoutConcurrency
        self.libraryUpdateDuration = libraryUpdateDuration
        self.logFileRetentionDays = logFileRetentionDays
        self.maxAudiobookResume = maxAudiobookResume
        self.maxResumePct = maxResumePct
        self.metadataCountryCode = metadataCountryCode
        self.metadataOptions = metadataOptions
        self.metadataPath = metadataPath
        self.minAudiobookResume = minAudiobookResume
        self.minResumeDurationSeconds = minResumeDurationSeconds
        self.minResumePct = minResumePct
        self.parallelImageEncodingLimit = parallelImageEncodingLimit
        self.pathSubstitutions = pathSubstitutions
        self.pluginRepositories = pluginRepositories
        self.preferredMetadataLanguage = preferredMetadataLanguage
        self.previousVersionStr = previousVersionStr
        self.remoteClientBitrateLimit = remoteClientBitrateLimit
        self.serverName = serverName
        self.slowResponseThresholdMs = slowResponseThresholdMs
        self.sortRemoveCharacters = sortRemoveCharacters
        self.sortRemoveWords = sortRemoveWords
        self.sortReplaceCharacters = sortReplaceCharacters
        self.trickplayOptions = trickplayOptions
        self.uICulture = uICulture
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.activityLogRetentionDays = try values.decodeIfPresent(Int.self, forKey: "ActivityLogRetentionDays")
        self.allowClientLogUpload = try values.decodeIfPresent(Bool.self, forKey: "AllowClientLogUpload")
        self.cachePath = try values.decodeIfPresent(String.self, forKey: "CachePath")
        self.cacheSize = try values.decodeIfPresent(Int.self, forKey: "CacheSize")
        self.castReceiverApplications = try values.decodeIfPresent([CastReceiverApplication].self, forKey: "CastReceiverApplications")
        self.chapterImageResolution = try values.decodeIfPresent(ImageResolution.self, forKey: "ChapterImageResolution")
        self.codecsUsed = try values.decodeIfPresent([String].self, forKey: "CodecsUsed")
        self.contentTypes = try values.decodeIfPresent([NameValuePair].self, forKey: "ContentTypes")
        self.corsHosts = try values.decodeIfPresent([String].self, forKey: "CorsHosts")
        self.dummyChapterDuration = try values.decodeIfPresent(Int.self, forKey: "DummyChapterDuration")
        self.enableCaseSensitiveItemIDs = try values.decodeIfPresent(Bool.self, forKey: "EnableCaseSensitiveItemIds")
        self.enableExternalContentInSuggestions = try values.decodeIfPresent(Bool.self, forKey: "EnableExternalContentInSuggestions")
        self.enableFolderView = try values.decodeIfPresent(Bool.self, forKey: "EnableFolderView")
        self.enableGroupingMoviesIntoCollections = try values.decodeIfPresent(Bool.self, forKey: "EnableGroupingMoviesIntoCollections")
        self.enableGroupingShowsIntoCollections = try values.decodeIfPresent(Bool.self, forKey: "EnableGroupingShowsIntoCollections")
        self.enableLegacyAuthorization = try values.decodeIfPresent(Bool.self, forKey: "EnableLegacyAuthorization")
        self.enableMetrics = try values.decodeIfPresent(Bool.self, forKey: "EnableMetrics")
        self.enableNormalizedItemByNameIDs = try values.decodeIfPresent(Bool.self, forKey: "EnableNormalizedItemByNameIds")
        self.enableSlowResponseWarning = try values.decodeIfPresent(Bool.self, forKey: "EnableSlowResponseWarning")
        self.imageExtractionTimeoutMs = try values.decodeIfPresent(Int.self, forKey: "ImageExtractionTimeoutMs")
        self.imageSavingConvention = try values.decodeIfPresent(ImageSavingConvention.self, forKey: "ImageSavingConvention")
        self.inactiveSessionThreshold = try values.decodeIfPresent(Int.self, forKey: "InactiveSessionThreshold")
        self.isDisableLiveTvChannelUserDataName = try values.decodeIfPresent(Bool.self, forKey: "DisableLiveTvChannelUserDataName")
        self.isDisplaySpecialsWithinSeasons = try values.decodeIfPresent(Bool.self, forKey: "DisplaySpecialsWithinSeasons")
        self.isPortAuthorized = try values.decodeIfPresent(Bool.self, forKey: "IsPortAuthorized")
        self.isQuickConnectAvailable = try values.decodeIfPresent(Bool.self, forKey: "QuickConnectAvailable")
        self.isSaveMetadataHidden = try values.decodeIfPresent(Bool.self, forKey: "SaveMetadataHidden")
        self.isSkipDeserializationForBasicTypes = try values.decodeIfPresent(Bool.self, forKey: "SkipDeserializationForBasicTypes")
        self.isStartupWizardCompleted = try values.decodeIfPresent(Bool.self, forKey: "IsStartupWizardCompleted")
        self.libraryMetadataRefreshConcurrency = try values.decodeIfPresent(Int.self, forKey: "LibraryMetadataRefreshConcurrency")
        self.libraryMonitorDelay = try values.decodeIfPresent(Int.self, forKey: "LibraryMonitorDelay")
        self.libraryScanFanoutConcurrency = try values.decodeIfPresent(Int.self, forKey: "LibraryScanFanoutConcurrency")
        self.libraryUpdateDuration = try values.decodeIfPresent(Int.self, forKey: "LibraryUpdateDuration")
        self.logFileRetentionDays = try values.decodeIfPresent(Int.self, forKey: "LogFileRetentionDays")
        self.maxAudiobookResume = try values.decodeIfPresent(Int.self, forKey: "MaxAudiobookResume")
        self.maxResumePct = try values.decodeIfPresent(Int.self, forKey: "MaxResumePct")
        self.metadataCountryCode = try values.decodeIfPresent(String.self, forKey: "MetadataCountryCode")
        self.metadataOptions = try values.decodeIfPresent([MetadataOptions].self, forKey: "MetadataOptions")
        self.metadataPath = try values.decodeIfPresent(String.self, forKey: "MetadataPath")
        self.minAudiobookResume = try values.decodeIfPresent(Int.self, forKey: "MinAudiobookResume")
        self.minResumeDurationSeconds = try values.decodeIfPresent(Int.self, forKey: "MinResumeDurationSeconds")
        self.minResumePct = try values.decodeIfPresent(Int.self, forKey: "MinResumePct")
        self.parallelImageEncodingLimit = try values.decodeIfPresent(Int.self, forKey: "ParallelImageEncodingLimit")
        self.pathSubstitutions = try values.decodeIfPresent([PathSubstitution].self, forKey: "PathSubstitutions")
        self.pluginRepositories = try values.decodeIfPresent([RepositoryInfo].self, forKey: "PluginRepositories")
        self.preferredMetadataLanguage = try values.decodeIfPresent(String.self, forKey: "PreferredMetadataLanguage")
        self.previousVersionStr = try values.decodeIfPresent(String.self, forKey: "PreviousVersionStr")
        self.remoteClientBitrateLimit = try values.decodeIfPresent(Int.self, forKey: "RemoteClientBitrateLimit")
        self.serverName = try values.decodeIfPresent(String.self, forKey: "ServerName")
        self.slowResponseThresholdMs = try values.decodeIfPresent(Int.self, forKey: "SlowResponseThresholdMs")
        self.sortRemoveCharacters = try values.decodeIfPresent([String].self, forKey: "SortRemoveCharacters")
        self.sortRemoveWords = try values.decodeIfPresent([String].self, forKey: "SortRemoveWords")
        self.sortReplaceCharacters = try values.decodeIfPresent([String].self, forKey: "SortReplaceCharacters")
        self.trickplayOptions = try values.decodeIfPresent(TrickplayOptions.self, forKey: "TrickplayOptions")
        self.uICulture = try values.decodeIfPresent(String.self, forKey: "UICulture")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(activityLogRetentionDays, forKey: "ActivityLogRetentionDays")
        try values.encodeIfPresent(allowClientLogUpload, forKey: "AllowClientLogUpload")
        try values.encodeIfPresent(cachePath, forKey: "CachePath")
        try values.encodeIfPresent(cacheSize, forKey: "CacheSize")
        try values.encodeIfPresent(castReceiverApplications, forKey: "CastReceiverApplications")
        try values.encodeIfPresent(chapterImageResolution, forKey: "ChapterImageResolution")
        try values.encodeIfPresent(codecsUsed, forKey: "CodecsUsed")
        try values.encodeIfPresent(contentTypes, forKey: "ContentTypes")
        try values.encodeIfPresent(corsHosts, forKey: "CorsHosts")
        try values.encodeIfPresent(dummyChapterDuration, forKey: "DummyChapterDuration")
        try values.encodeIfPresent(enableCaseSensitiveItemIDs, forKey: "EnableCaseSensitiveItemIds")
        try values.encodeIfPresent(enableExternalContentInSuggestions, forKey: "EnableExternalContentInSuggestions")
        try values.encodeIfPresent(enableFolderView, forKey: "EnableFolderView")
        try values.encodeIfPresent(enableGroupingMoviesIntoCollections, forKey: "EnableGroupingMoviesIntoCollections")
        try values.encodeIfPresent(enableGroupingShowsIntoCollections, forKey: "EnableGroupingShowsIntoCollections")
        try values.encodeIfPresent(enableLegacyAuthorization, forKey: "EnableLegacyAuthorization")
        try values.encodeIfPresent(enableMetrics, forKey: "EnableMetrics")
        try values.encodeIfPresent(enableNormalizedItemByNameIDs, forKey: "EnableNormalizedItemByNameIds")
        try values.encodeIfPresent(enableSlowResponseWarning, forKey: "EnableSlowResponseWarning")
        try values.encodeIfPresent(imageExtractionTimeoutMs, forKey: "ImageExtractionTimeoutMs")
        try values.encodeIfPresent(imageSavingConvention, forKey: "ImageSavingConvention")
        try values.encodeIfPresent(inactiveSessionThreshold, forKey: "InactiveSessionThreshold")
        try values.encodeIfPresent(isDisableLiveTvChannelUserDataName, forKey: "DisableLiveTvChannelUserDataName")
        try values.encodeIfPresent(isDisplaySpecialsWithinSeasons, forKey: "DisplaySpecialsWithinSeasons")
        try values.encodeIfPresent(isPortAuthorized, forKey: "IsPortAuthorized")
        try values.encodeIfPresent(isQuickConnectAvailable, forKey: "QuickConnectAvailable")
        try values.encodeIfPresent(isSaveMetadataHidden, forKey: "SaveMetadataHidden")
        try values.encodeIfPresent(isSkipDeserializationForBasicTypes, forKey: "SkipDeserializationForBasicTypes")
        try values.encodeIfPresent(isStartupWizardCompleted, forKey: "IsStartupWizardCompleted")
        try values.encodeIfPresent(libraryMetadataRefreshConcurrency, forKey: "LibraryMetadataRefreshConcurrency")
        try values.encodeIfPresent(libraryMonitorDelay, forKey: "LibraryMonitorDelay")
        try values.encodeIfPresent(libraryScanFanoutConcurrency, forKey: "LibraryScanFanoutConcurrency")
        try values.encodeIfPresent(libraryUpdateDuration, forKey: "LibraryUpdateDuration")
        try values.encodeIfPresent(logFileRetentionDays, forKey: "LogFileRetentionDays")
        try values.encodeIfPresent(maxAudiobookResume, forKey: "MaxAudiobookResume")
        try values.encodeIfPresent(maxResumePct, forKey: "MaxResumePct")
        try values.encodeIfPresent(metadataCountryCode, forKey: "MetadataCountryCode")
        try values.encodeIfPresent(metadataOptions, forKey: "MetadataOptions")
        try values.encodeIfPresent(metadataPath, forKey: "MetadataPath")
        try values.encodeIfPresent(minAudiobookResume, forKey: "MinAudiobookResume")
        try values.encodeIfPresent(minResumeDurationSeconds, forKey: "MinResumeDurationSeconds")
        try values.encodeIfPresent(minResumePct, forKey: "MinResumePct")
        try values.encodeIfPresent(parallelImageEncodingLimit, forKey: "ParallelImageEncodingLimit")
        try values.encodeIfPresent(pathSubstitutions, forKey: "PathSubstitutions")
        try values.encodeIfPresent(pluginRepositories, forKey: "PluginRepositories")
        try values.encodeIfPresent(preferredMetadataLanguage, forKey: "PreferredMetadataLanguage")
        try values.encodeIfPresent(previousVersionStr, forKey: "PreviousVersionStr")
        try values.encodeIfPresent(remoteClientBitrateLimit, forKey: "RemoteClientBitrateLimit")
        try values.encodeIfPresent(serverName, forKey: "ServerName")
        try values.encodeIfPresent(slowResponseThresholdMs, forKey: "SlowResponseThresholdMs")
        try values.encodeIfPresent(sortRemoveCharacters, forKey: "SortRemoveCharacters")
        try values.encodeIfPresent(sortRemoveWords, forKey: "SortRemoveWords")
        try values.encodeIfPresent(sortReplaceCharacters, forKey: "SortReplaceCharacters")
        try values.encodeIfPresent(trickplayOptions, forKey: "TrickplayOptions")
        try values.encodeIfPresent(uICulture, forKey: "UICulture")
    }
}
