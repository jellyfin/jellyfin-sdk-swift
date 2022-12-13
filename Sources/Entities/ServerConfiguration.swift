//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Represents the server configuration.
public struct ServerConfiguration: Codable, Hashable {
    /// Gets or sets the number of days we should retain activity logs.
    public var activityLogRetentionDays: Int32?
    /// Gets or sets a value indicating whether clients should be allowed to upload logs.
    public var allowClientLogUpload: Bool?
    /// Gets or sets the cache path.
    public var cachePath: String?
    public var codecsUsed: [String]?
    public var contentTypes: [NameValuePair]?
    /// Gets or sets the cors hosts.
    public var corsHosts: [String]?
    public var isDisableLiveTvChannelUserDataName: Bool?
    public var isDisplaySpecialsWithinSeasons: Bool?
    /// Gets or sets a value indicating whether [enable case sensitive item ids].
    public var enableCaseSensitiveItemIDs: Bool?
    public var enableExternalContentInSuggestions: Bool?
    public var enableFolderView: Bool?
    public var enableGroupingIntoCollections: Bool?
    /// Gets or sets a value indicating whether to enable prometheus metrics exporting.
    public var enableMetrics: Bool?
    public var enableNormalizedItemByNameIDs: Bool?
    /// Gets or sets a value indicating whether slow server responses should be logged as a warning.
    public var enableSlowResponseWarning: Bool?
    public var imageExtractionTimeoutMs: Int32?
    /// Gets or sets the image saving convention.
    public var imageSavingConvention: ImageSavingConvention?
    /// Gets or sets a value indicating whether this instance is port authorized.
    public var isPortAuthorized: Bool?
    /// Gets or sets a value indicating whether this instance is first run.
    public var isStartupWizardCompleted: Bool?
    /// Gets or sets the how many metadata refreshes can run concurrently.
    public var libraryMetadataRefreshConcurrency: Int32?
    /// Gets or sets the delay in seconds that we will wait after a file system change to try and discover what has been added/removed
    ///
    /// Some delay is necessary with some items because their creation is not atomic.  It involves the creation of several
    ///
    /// different directories and files.
    public var libraryMonitorDelay: Int32?
    /// Gets or sets the how the library scan fans out.
    public var libraryScanFanoutConcurrency: Int32?
    /// Gets or sets the number of days we should retain log files.
    public var logFileRetentionDays: Int32?
    /// Gets or sets the remaining minutes of a book that can be played while still saving playstate. If this percentage is crossed playstate will be reset to the beginning and the item will be marked watched.
    public var maxAudiobookResume: Int32?
    /// Gets or sets the maximum percentage of an item that can be played while still saving playstate. If this percentage is crossed playstate will be reset to the beginning and the item will be marked watched.
    public var maxResumePct: Int32?
    /// Gets or sets the metadata country code.
    public var metadataCountryCode: String?
    public var metadataNetworkPath: String?
    public var metadataOptions: [MetadataOptions]?
    /// Gets or sets the metadata path.
    public var metadataPath: String?
    /// Gets or sets the minimum minutes of a book that must be played in order for playstate to be updated.
    public var minAudiobookResume: Int32?
    /// Gets or sets the minimum duration that an item must have in order to be eligible for playstate updates..
    public var minResumeDurationSeconds: Int32?
    /// Gets or sets the minimum percentage of an item that must be played in order for playstate to be updated.
    public var minResumePct: Int32?
    public var pathSubstitutions: [PathSubstitution]?
    public var pluginRepositories: [RepositoryInfo]?
    /// Gets or sets the preferred metadata language.
    public var preferredMetadataLanguage: String?
    /// Gets or sets the last known version that was ran using the configuration.
    public var previousVersion: String?
    /// Gets or sets the stringified PreviousVersion to be stored/loaded,
    ///
    /// because System.Version itself isn't xml-serializable.
    public var previousVersionStr: String?
    /// Gets or sets a value indicating whether quick connect is available for use on this server.
    public var isQuickConnectAvailable: Bool?
    public var remoteClientBitrateLimit: Int32?
    /// Gets or sets a value indicating whether older plugins should automatically be deleted from the plugin folder.
    public var isRemoveOldPlugins: Bool?
    public var isSaveMetadataHidden: Bool?
    public var serverName: String?
    public var isSkipDeserializationForBasicTypes: Bool?
    /// Gets or sets the threshold for the slow response time warning in ms.
    public var slowResponseThresholdMs: Int64?
    /// Gets or sets characters to be removed from strings to create a sort name.
    public var sortRemoveCharacters: [String]?
    /// Gets or sets words to be removed from strings to create a sort name.
    public var sortRemoveWords: [String]?
    /// Gets or sets characters to be replaced with a ' ' in strings to create a sort name.
    public var sortReplaceCharacters: [String]?
    public var uICulture: String?

    public init(
        activityLogRetentionDays: Int32? = nil,
        allowClientLogUpload: Bool? = nil,
        cachePath: String? = nil,
        codecsUsed: [String]? = nil,
        contentTypes: [NameValuePair]? = nil,
        corsHosts: [String]? = nil,
        isDisableLiveTvChannelUserDataName: Bool? = nil,
        isDisplaySpecialsWithinSeasons: Bool? = nil,
        enableCaseSensitiveItemIDs: Bool? = nil,
        enableExternalContentInSuggestions: Bool? = nil,
        enableFolderView: Bool? = nil,
        enableGroupingIntoCollections: Bool? = nil,
        enableMetrics: Bool? = nil,
        enableNormalizedItemByNameIDs: Bool? = nil,
        enableSlowResponseWarning: Bool? = nil,
        imageExtractionTimeoutMs: Int32? = nil,
        imageSavingConvention: ImageSavingConvention? = nil,
        isPortAuthorized: Bool? = nil,
        isStartupWizardCompleted: Bool? = nil,
        libraryMetadataRefreshConcurrency: Int32? = nil,
        libraryMonitorDelay: Int32? = nil,
        libraryScanFanoutConcurrency: Int32? = nil,
        logFileRetentionDays: Int32? = nil,
        maxAudiobookResume: Int32? = nil,
        maxResumePct: Int32? = nil,
        metadataCountryCode: String? = nil,
        metadataNetworkPath: String? = nil,
        metadataOptions: [MetadataOptions]? = nil,
        metadataPath: String? = nil,
        minAudiobookResume: Int32? = nil,
        minResumeDurationSeconds: Int32? = nil,
        minResumePct: Int32? = nil,
        pathSubstitutions: [PathSubstitution]? = nil,
        pluginRepositories: [RepositoryInfo]? = nil,
        preferredMetadataLanguage: String? = nil,
        previousVersion: String? = nil,
        previousVersionStr: String? = nil,
        isQuickConnectAvailable: Bool? = nil,
        remoteClientBitrateLimit: Int32? = nil,
        isRemoveOldPlugins: Bool? = nil,
        isSaveMetadataHidden: Bool? = nil,
        serverName: String? = nil,
        isSkipDeserializationForBasicTypes: Bool? = nil,
        slowResponseThresholdMs: Int64? = nil,
        sortRemoveCharacters: [String]? = nil,
        sortRemoveWords: [String]? = nil,
        sortReplaceCharacters: [String]? = nil,
        uICulture: String? = nil
    ) {
        self.activityLogRetentionDays = activityLogRetentionDays
        self.allowClientLogUpload = allowClientLogUpload
        self.cachePath = cachePath
        self.codecsUsed = codecsUsed
        self.contentTypes = contentTypes
        self.corsHosts = corsHosts
        self.isDisableLiveTvChannelUserDataName = isDisableLiveTvChannelUserDataName
        self.isDisplaySpecialsWithinSeasons = isDisplaySpecialsWithinSeasons
        self.enableCaseSensitiveItemIDs = enableCaseSensitiveItemIDs
        self.enableExternalContentInSuggestions = enableExternalContentInSuggestions
        self.enableFolderView = enableFolderView
        self.enableGroupingIntoCollections = enableGroupingIntoCollections
        self.enableMetrics = enableMetrics
        self.enableNormalizedItemByNameIDs = enableNormalizedItemByNameIDs
        self.enableSlowResponseWarning = enableSlowResponseWarning
        self.imageExtractionTimeoutMs = imageExtractionTimeoutMs
        self.imageSavingConvention = imageSavingConvention
        self.isPortAuthorized = isPortAuthorized
        self.isStartupWizardCompleted = isStartupWizardCompleted
        self.libraryMetadataRefreshConcurrency = libraryMetadataRefreshConcurrency
        self.libraryMonitorDelay = libraryMonitorDelay
        self.libraryScanFanoutConcurrency = libraryScanFanoutConcurrency
        self.logFileRetentionDays = logFileRetentionDays
        self.maxAudiobookResume = maxAudiobookResume
        self.maxResumePct = maxResumePct
        self.metadataCountryCode = metadataCountryCode
        self.metadataNetworkPath = metadataNetworkPath
        self.metadataOptions = metadataOptions
        self.metadataPath = metadataPath
        self.minAudiobookResume = minAudiobookResume
        self.minResumeDurationSeconds = minResumeDurationSeconds
        self.minResumePct = minResumePct
        self.pathSubstitutions = pathSubstitutions
        self.pluginRepositories = pluginRepositories
        self.preferredMetadataLanguage = preferredMetadataLanguage
        self.previousVersion = previousVersion
        self.previousVersionStr = previousVersionStr
        self.isQuickConnectAvailable = isQuickConnectAvailable
        self.remoteClientBitrateLimit = remoteClientBitrateLimit
        self.isRemoveOldPlugins = isRemoveOldPlugins
        self.isSaveMetadataHidden = isSaveMetadataHidden
        self.serverName = serverName
        self.isSkipDeserializationForBasicTypes = isSkipDeserializationForBasicTypes
        self.slowResponseThresholdMs = slowResponseThresholdMs
        self.sortRemoveCharacters = sortRemoveCharacters
        self.sortRemoveWords = sortRemoveWords
        self.sortReplaceCharacters = sortReplaceCharacters
        self.uICulture = uICulture
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.activityLogRetentionDays = try values.decodeIfPresent(Int32.self, forKey: "ActivityLogRetentionDays")
        self.allowClientLogUpload = try values.decodeIfPresent(Bool.self, forKey: "AllowClientLogUpload")
        self.cachePath = try values.decodeIfPresent(String.self, forKey: "CachePath")
        self.codecsUsed = try values.decodeIfPresent([String].self, forKey: "CodecsUsed")
        self.contentTypes = try values.decodeIfPresent([NameValuePair].self, forKey: "ContentTypes")
        self.corsHosts = try values.decodeIfPresent([String].self, forKey: "CorsHosts")
        self.isDisableLiveTvChannelUserDataName = try values.decodeIfPresent(Bool.self, forKey: "DisableLiveTvChannelUserDataName")
        self.isDisplaySpecialsWithinSeasons = try values.decodeIfPresent(Bool.self, forKey: "DisplaySpecialsWithinSeasons")
        self.enableCaseSensitiveItemIDs = try values.decodeIfPresent(Bool.self, forKey: "EnableCaseSensitiveItemIds")
        self.enableExternalContentInSuggestions = try values.decodeIfPresent(Bool.self, forKey: "EnableExternalContentInSuggestions")
        self.enableFolderView = try values.decodeIfPresent(Bool.self, forKey: "EnableFolderView")
        self.enableGroupingIntoCollections = try values.decodeIfPresent(Bool.self, forKey: "EnableGroupingIntoCollections")
        self.enableMetrics = try values.decodeIfPresent(Bool.self, forKey: "EnableMetrics")
        self.enableNormalizedItemByNameIDs = try values.decodeIfPresent(Bool.self, forKey: "EnableNormalizedItemByNameIds")
        self.enableSlowResponseWarning = try values.decodeIfPresent(Bool.self, forKey: "EnableSlowResponseWarning")
        self.imageExtractionTimeoutMs = try values.decodeIfPresent(Int32.self, forKey: "ImageExtractionTimeoutMs")
        self.imageSavingConvention = try values.decodeIfPresent(ImageSavingConvention.self, forKey: "ImageSavingConvention")
        self.isPortAuthorized = try values.decodeIfPresent(Bool.self, forKey: "IsPortAuthorized")
        self.isStartupWizardCompleted = try values.decodeIfPresent(Bool.self, forKey: "IsStartupWizardCompleted")
        self.libraryMetadataRefreshConcurrency = try values.decodeIfPresent(Int32.self, forKey: "LibraryMetadataRefreshConcurrency")
        self.libraryMonitorDelay = try values.decodeIfPresent(Int32.self, forKey: "LibraryMonitorDelay")
        self.libraryScanFanoutConcurrency = try values.decodeIfPresent(Int32.self, forKey: "LibraryScanFanoutConcurrency")
        self.logFileRetentionDays = try values.decodeIfPresent(Int32.self, forKey: "LogFileRetentionDays")
        self.maxAudiobookResume = try values.decodeIfPresent(Int32.self, forKey: "MaxAudiobookResume")
        self.maxResumePct = try values.decodeIfPresent(Int32.self, forKey: "MaxResumePct")
        self.metadataCountryCode = try values.decodeIfPresent(String.self, forKey: "MetadataCountryCode")
        self.metadataNetworkPath = try values.decodeIfPresent(String.self, forKey: "MetadataNetworkPath")
        self.metadataOptions = try values.decodeIfPresent([MetadataOptions].self, forKey: "MetadataOptions")
        self.metadataPath = try values.decodeIfPresent(String.self, forKey: "MetadataPath")
        self.minAudiobookResume = try values.decodeIfPresent(Int32.self, forKey: "MinAudiobookResume")
        self.minResumeDurationSeconds = try values.decodeIfPresent(Int32.self, forKey: "MinResumeDurationSeconds")
        self.minResumePct = try values.decodeIfPresent(Int32.self, forKey: "MinResumePct")
        self.pathSubstitutions = try values.decodeIfPresent([PathSubstitution].self, forKey: "PathSubstitutions")
        self.pluginRepositories = try values.decodeIfPresent([RepositoryInfo].self, forKey: "PluginRepositories")
        self.preferredMetadataLanguage = try values.decodeIfPresent(String.self, forKey: "PreferredMetadataLanguage")
        self.previousVersion = try values.decodeIfPresent(String.self, forKey: "PreviousVersion")
        self.previousVersionStr = try values.decodeIfPresent(String.self, forKey: "PreviousVersionStr")
        self.isQuickConnectAvailable = try values.decodeIfPresent(Bool.self, forKey: "QuickConnectAvailable")
        self.remoteClientBitrateLimit = try values.decodeIfPresent(Int32.self, forKey: "RemoteClientBitrateLimit")
        self.isRemoveOldPlugins = try values.decodeIfPresent(Bool.self, forKey: "RemoveOldPlugins")
        self.isSaveMetadataHidden = try values.decodeIfPresent(Bool.self, forKey: "SaveMetadataHidden")
        self.serverName = try values.decodeIfPresent(String.self, forKey: "ServerName")
        self.isSkipDeserializationForBasicTypes = try values.decodeIfPresent(Bool.self, forKey: "SkipDeserializationForBasicTypes")
        self.slowResponseThresholdMs = try values.decodeIfPresent(Int64.self, forKey: "SlowResponseThresholdMs")
        self.sortRemoveCharacters = try values.decodeIfPresent([String].self, forKey: "SortRemoveCharacters")
        self.sortRemoveWords = try values.decodeIfPresent([String].self, forKey: "SortRemoveWords")
        self.sortReplaceCharacters = try values.decodeIfPresent([String].self, forKey: "SortReplaceCharacters")
        self.uICulture = try values.decodeIfPresent(String.self, forKey: "UICulture")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(activityLogRetentionDays, forKey: "ActivityLogRetentionDays")
        try values.encodeIfPresent(allowClientLogUpload, forKey: "AllowClientLogUpload")
        try values.encodeIfPresent(cachePath, forKey: "CachePath")
        try values.encodeIfPresent(codecsUsed, forKey: "CodecsUsed")
        try values.encodeIfPresent(contentTypes, forKey: "ContentTypes")
        try values.encodeIfPresent(corsHosts, forKey: "CorsHosts")
        try values.encodeIfPresent(isDisableLiveTvChannelUserDataName, forKey: "DisableLiveTvChannelUserDataName")
        try values.encodeIfPresent(isDisplaySpecialsWithinSeasons, forKey: "DisplaySpecialsWithinSeasons")
        try values.encodeIfPresent(enableCaseSensitiveItemIDs, forKey: "EnableCaseSensitiveItemIds")
        try values.encodeIfPresent(enableExternalContentInSuggestions, forKey: "EnableExternalContentInSuggestions")
        try values.encodeIfPresent(enableFolderView, forKey: "EnableFolderView")
        try values.encodeIfPresent(enableGroupingIntoCollections, forKey: "EnableGroupingIntoCollections")
        try values.encodeIfPresent(enableMetrics, forKey: "EnableMetrics")
        try values.encodeIfPresent(enableNormalizedItemByNameIDs, forKey: "EnableNormalizedItemByNameIds")
        try values.encodeIfPresent(enableSlowResponseWarning, forKey: "EnableSlowResponseWarning")
        try values.encodeIfPresent(imageExtractionTimeoutMs, forKey: "ImageExtractionTimeoutMs")
        try values.encodeIfPresent(imageSavingConvention, forKey: "ImageSavingConvention")
        try values.encodeIfPresent(isPortAuthorized, forKey: "IsPortAuthorized")
        try values.encodeIfPresent(isStartupWizardCompleted, forKey: "IsStartupWizardCompleted")
        try values.encodeIfPresent(libraryMetadataRefreshConcurrency, forKey: "LibraryMetadataRefreshConcurrency")
        try values.encodeIfPresent(libraryMonitorDelay, forKey: "LibraryMonitorDelay")
        try values.encodeIfPresent(libraryScanFanoutConcurrency, forKey: "LibraryScanFanoutConcurrency")
        try values.encodeIfPresent(logFileRetentionDays, forKey: "LogFileRetentionDays")
        try values.encodeIfPresent(maxAudiobookResume, forKey: "MaxAudiobookResume")
        try values.encodeIfPresent(maxResumePct, forKey: "MaxResumePct")
        try values.encodeIfPresent(metadataCountryCode, forKey: "MetadataCountryCode")
        try values.encodeIfPresent(metadataNetworkPath, forKey: "MetadataNetworkPath")
        try values.encodeIfPresent(metadataOptions, forKey: "MetadataOptions")
        try values.encodeIfPresent(metadataPath, forKey: "MetadataPath")
        try values.encodeIfPresent(minAudiobookResume, forKey: "MinAudiobookResume")
        try values.encodeIfPresent(minResumeDurationSeconds, forKey: "MinResumeDurationSeconds")
        try values.encodeIfPresent(minResumePct, forKey: "MinResumePct")
        try values.encodeIfPresent(pathSubstitutions, forKey: "PathSubstitutions")
        try values.encodeIfPresent(pluginRepositories, forKey: "PluginRepositories")
        try values.encodeIfPresent(preferredMetadataLanguage, forKey: "PreferredMetadataLanguage")
        try values.encodeIfPresent(previousVersion, forKey: "PreviousVersion")
        try values.encodeIfPresent(previousVersionStr, forKey: "PreviousVersionStr")
        try values.encodeIfPresent(isQuickConnectAvailable, forKey: "QuickConnectAvailable")
        try values.encodeIfPresent(remoteClientBitrateLimit, forKey: "RemoteClientBitrateLimit")
        try values.encodeIfPresent(isRemoveOldPlugins, forKey: "RemoveOldPlugins")
        try values.encodeIfPresent(isSaveMetadataHidden, forKey: "SaveMetadataHidden")
        try values.encodeIfPresent(serverName, forKey: "ServerName")
        try values.encodeIfPresent(isSkipDeserializationForBasicTypes, forKey: "SkipDeserializationForBasicTypes")
        try values.encodeIfPresent(slowResponseThresholdMs, forKey: "SlowResponseThresholdMs")
        try values.encodeIfPresent(sortRemoveCharacters, forKey: "SortRemoveCharacters")
        try values.encodeIfPresent(sortRemoveWords, forKey: "SortRemoveWords")
        try values.encodeIfPresent(sortReplaceCharacters, forKey: "SortReplaceCharacters")
        try values.encodeIfPresent(uICulture, forKey: "UICulture")
    }
}
