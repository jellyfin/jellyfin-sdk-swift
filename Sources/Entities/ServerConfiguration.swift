//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Represents the server configuration.
public struct ServerConfiguration: Codable {
    /// Gets or sets the number of days we should retain activity logs.
    public var activityLogRetentionDays: Int?
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
    public var imageExtractionTimeoutMs: Int?
    /// Gets or sets the image saving convention.
    public var imageSavingConvention: ImageSavingConvention?
    /// Gets or sets a value indicating whether this instance is port authorized.
    public var isPortAuthorized: Bool?
    /// Gets or sets a value indicating whether this instance is first run.
    public var isStartupWizardCompleted: Bool?
    /// Gets or sets the how many metadata refreshes can run concurrently.
    public var libraryMetadataRefreshConcurrency: Int?
    /// Gets or sets the delay in seconds that we will wait after a file system change to try and discover what has been added/removed
    ///
    /// Some delay is necessary with some items because their creation is not atomic.  It involves the creation of several
    ///
    /// different directories and files.
    public var libraryMonitorDelay: Int?
    /// Gets or sets the how the library scan fans out.
    public var libraryScanFanoutConcurrency: Int?
    /// Gets or sets the number of days we should retain log files.
    public var logFileRetentionDays: Int?
    /// Gets or sets the remaining minutes of a book that can be played while still saving playstate. If this percentage is crossed playstate will be reset to the beginning and the item will be marked watched.
    public var maxAudiobookResume: Int?
    /// Gets or sets the maximum percentage of an item that can be played while still saving playstate. If this percentage is crossed playstate will be reset to the beginning and the item will be marked watched.
    public var maxResumePct: Int?
    /// Gets or sets the metadata country code.
    public var metadataCountryCode: String?
    public var metadataNetworkPath: String?
    public var metadataOptions: [MetadataOptions]?
    /// Gets or sets the metadata path.
    public var metadataPath: String?
    /// Gets or sets the minimum minutes of a book that must be played in order for playstate to be updated.
    public var minAudiobookResume: Int?
    /// Gets or sets the minimum duration that an item must have in order to be eligible for playstate updates..
    public var minResumeDurationSeconds: Int?
    /// Gets or sets the minimum percentage of an item that must be played in order for playstate to be updated.
    public var minResumePct: Int?
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
    public var remoteClientBitrateLimit: Int?
    /// Gets or sets a value indicating whether older plugins should automatically be deleted from the plugin folder.
    public var isRemoveOldPlugins: Bool?
    public var isSaveMetadataHidden: Bool?
    public var serverName: String?
    public var isSkipDeserializationForBasicTypes: Bool?
    /// Gets or sets the threshold for the slow response time warning in ms.
    public var slowResponseThresholdMs: Int?
    /// Gets or sets characters to be removed from strings to create a sort name.
    public var sortRemoveCharacters: [String]?
    /// Gets or sets words to be removed from strings to create a sort name.
    public var sortRemoveWords: [String]?
    /// Gets or sets characters to be replaced with a ' ' in strings to create a sort name.
    public var sortReplaceCharacters: [String]?
    public var uICulture: String?

    public init(
        activityLogRetentionDays: Int? = nil,
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
        imageExtractionTimeoutMs: Int? = nil,
        imageSavingConvention: ImageSavingConvention? = nil,
        isPortAuthorized: Bool? = nil,
        isStartupWizardCompleted: Bool? = nil,
        libraryMetadataRefreshConcurrency: Int? = nil,
        libraryMonitorDelay: Int? = nil,
        libraryScanFanoutConcurrency: Int? = nil,
        logFileRetentionDays: Int? = nil,
        maxAudiobookResume: Int? = nil,
        maxResumePct: Int? = nil,
        metadataCountryCode: String? = nil,
        metadataNetworkPath: String? = nil,
        metadataOptions: [MetadataOptions]? = nil,
        metadataPath: String? = nil,
        minAudiobookResume: Int? = nil,
        minResumeDurationSeconds: Int? = nil,
        minResumePct: Int? = nil,
        pathSubstitutions: [PathSubstitution]? = nil,
        pluginRepositories: [RepositoryInfo]? = nil,
        preferredMetadataLanguage: String? = nil,
        previousVersion: String? = nil,
        previousVersionStr: String? = nil,
        isQuickConnectAvailable: Bool? = nil,
        remoteClientBitrateLimit: Int? = nil,
        isRemoveOldPlugins: Bool? = nil,
        isSaveMetadataHidden: Bool? = nil,
        serverName: String? = nil,
        isSkipDeserializationForBasicTypes: Bool? = nil,
        slowResponseThresholdMs: Int? = nil,
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
}
