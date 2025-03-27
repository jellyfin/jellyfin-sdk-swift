//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class SystemInfo.
public struct SystemInfo: Codable, Hashable, Identifiable {
    /// Gets or sets the cache path.
    public var cachePath: String?
    /// - warning: Deprecated.
    public var canLaunchWebBrowser: Bool
    /// Gets or sets a value indicating whether this instance can self restart.
    ///
    /// - warning: Deprecated.
    public var canSelfRestart: Bool
    /// Gets or sets the list of cast receiver applications.
    public var castReceiverApplications: [CastReceiverApplication]?
    /// Gets or sets the completed installations.
    public var completedInstallations: [InstallationInfo]?
    /// - warning: Deprecated.
    public var encoderLocation: String?
    /// Gets or sets a value indicating whether this instance has pending restart.
    public var hasPendingRestart: Bool?
    /// Gets or sets a value indicating whether this instance has update available.
    ///
    /// - warning: Deprecated.
    public var hasUpdateAvailable: Bool
    /// Gets or sets the id.
    public var id: String?
    /// Gets or sets the internal metadata path.
    public var internalMetadataPath: String?
    public var isShuttingDown: Bool?
    /// Gets or sets the items by name path.
    public var itemsByNamePath: String?
    /// Gets or sets the local address.
    public var localAddress: String?
    /// Gets or sets the log path.
    public var logPath: String?
    /// Gets or sets the operating system.
    ///
    /// - warning: Deprecated.
    public var operatingSystem: String?
    /// Gets or sets the display name of the operating system.
    ///
    /// - warning: Deprecated.
    public var operatingSystemDisplayName: String?
    /// Gets or sets the package name.
    public var packageName: String?
    /// Gets or sets the product name. This is the AssemblyProduct name.
    public var productName: String?
    /// Gets or sets the program data path.
    public var programDataPath: String?
    /// Gets or sets the name of the server.
    public var serverName: String?
    /// Gets or sets a value indicating whether the startup wizard is completed.
    public var isStartupWizardCompleted: Bool?
    /// Gets or sets a value indicating whether [supports library monitor].
    public var isSupportsLibraryMonitor: Bool?
    /// - warning: Deprecated.
    public var systemArchitecture: String?
    /// Gets or sets the transcode path.
    public var transcodingTempPath: String?
    /// Gets or sets the server version.
    public var version: String?
    /// Gets or sets the web UI resources path.
    public var webPath: String?
    /// Gets or sets the web socket port number.
    public var webSocketPortNumber: Int?

    public init(
        cachePath: String? = nil,
        canLaunchWebBrowser: Bool? = nil,
        canSelfRestart: Bool? = nil,
        castReceiverApplications: [CastReceiverApplication]? = nil,
        completedInstallations: [InstallationInfo]? = nil,
        encoderLocation: String? = nil,
        hasPendingRestart: Bool? = nil,
        hasUpdateAvailable: Bool? = nil,
        id: String? = nil,
        internalMetadataPath: String? = nil,
        isShuttingDown: Bool? = nil,
        itemsByNamePath: String? = nil,
        localAddress: String? = nil,
        logPath: String? = nil,
        operatingSystem: String? = nil,
        operatingSystemDisplayName: String? = nil,
        packageName: String? = nil,
        productName: String? = nil,
        programDataPath: String? = nil,
        serverName: String? = nil,
        isStartupWizardCompleted: Bool? = nil,
        isSupportsLibraryMonitor: Bool? = nil,
        systemArchitecture: String? = nil,
        transcodingTempPath: String? = nil,
        version: String? = nil,
        webPath: String? = nil,
        webSocketPortNumber: Int? = nil
    ) {
        self.cachePath = cachePath
        self.canLaunchWebBrowser = canLaunchWebBrowser ?? false
        self.canSelfRestart = canSelfRestart ?? true
        self.castReceiverApplications = castReceiverApplications
        self.completedInstallations = completedInstallations
        self.encoderLocation = encoderLocation
        self.hasPendingRestart = hasPendingRestart
        self.hasUpdateAvailable = hasUpdateAvailable ?? false
        self.id = id
        self.internalMetadataPath = internalMetadataPath
        self.isShuttingDown = isShuttingDown
        self.itemsByNamePath = itemsByNamePath
        self.localAddress = localAddress
        self.logPath = logPath
        self.operatingSystem = operatingSystem
        self.operatingSystemDisplayName = operatingSystemDisplayName
        self.packageName = packageName
        self.productName = productName
        self.programDataPath = programDataPath
        self.serverName = serverName
        self.isStartupWizardCompleted = isStartupWizardCompleted
        self.isSupportsLibraryMonitor = isSupportsLibraryMonitor
        self.systemArchitecture = systemArchitecture
        self.transcodingTempPath = transcodingTempPath
        self.version = version
        self.webPath = webPath
        self.webSocketPortNumber = webSocketPortNumber
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.cachePath = try values.decodeIfPresent(String.self, forKey: "CachePath")
        self.canLaunchWebBrowser = try values.decodeIfPresent(Bool.self, forKey: "CanLaunchWebBrowser") ?? false
        self.canSelfRestart = try values.decodeIfPresent(Bool.self, forKey: "CanSelfRestart") ?? true
        self.castReceiverApplications = try values.decodeIfPresent([CastReceiverApplication].self, forKey: "CastReceiverApplications")
        self.completedInstallations = try values.decodeIfPresent([InstallationInfo].self, forKey: "CompletedInstallations")
        self.encoderLocation = try values.decodeIfPresent(String.self, forKey: "EncoderLocation")
        self.hasPendingRestart = try values.decodeIfPresent(Bool.self, forKey: "HasPendingRestart")
        self.hasUpdateAvailable = try values.decodeIfPresent(Bool.self, forKey: "HasUpdateAvailable") ?? false
        self.id = try values.decodeIfPresent(String.self, forKey: "Id")
        self.internalMetadataPath = try values.decodeIfPresent(String.self, forKey: "InternalMetadataPath")
        self.isShuttingDown = try values.decodeIfPresent(Bool.self, forKey: "IsShuttingDown")
        self.itemsByNamePath = try values.decodeIfPresent(String.self, forKey: "ItemsByNamePath")
        self.localAddress = try values.decodeIfPresent(String.self, forKey: "LocalAddress")
        self.logPath = try values.decodeIfPresent(String.self, forKey: "LogPath")
        self.operatingSystem = try values.decodeIfPresent(String.self, forKey: "OperatingSystem")
        self.operatingSystemDisplayName = try values.decodeIfPresent(String.self, forKey: "OperatingSystemDisplayName")
        self.packageName = try values.decodeIfPresent(String.self, forKey: "PackageName")
        self.productName = try values.decodeIfPresent(String.self, forKey: "ProductName")
        self.programDataPath = try values.decodeIfPresent(String.self, forKey: "ProgramDataPath")
        self.serverName = try values.decodeIfPresent(String.self, forKey: "ServerName")
        self.isStartupWizardCompleted = try values.decodeIfPresent(Bool.self, forKey: "StartupWizardCompleted")
        self.isSupportsLibraryMonitor = try values.decodeIfPresent(Bool.self, forKey: "SupportsLibraryMonitor")
        self.systemArchitecture = try values.decodeIfPresent(String.self, forKey: "SystemArchitecture")
        self.transcodingTempPath = try values.decodeIfPresent(String.self, forKey: "TranscodingTempPath")
        self.version = try values.decodeIfPresent(String.self, forKey: "Version")
        self.webPath = try values.decodeIfPresent(String.self, forKey: "WebPath")
        self.webSocketPortNumber = try values.decodeIfPresent(Int.self, forKey: "WebSocketPortNumber")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(cachePath, forKey: "CachePath")
        try values.encodeIfPresent(canLaunchWebBrowser, forKey: "CanLaunchWebBrowser")
        try values.encodeIfPresent(canSelfRestart, forKey: "CanSelfRestart")
        try values.encodeIfPresent(castReceiverApplications, forKey: "CastReceiverApplications")
        try values.encodeIfPresent(completedInstallations, forKey: "CompletedInstallations")
        try values.encodeIfPresent(encoderLocation, forKey: "EncoderLocation")
        try values.encodeIfPresent(hasPendingRestart, forKey: "HasPendingRestart")
        try values.encodeIfPresent(hasUpdateAvailable, forKey: "HasUpdateAvailable")
        try values.encodeIfPresent(id, forKey: "Id")
        try values.encodeIfPresent(internalMetadataPath, forKey: "InternalMetadataPath")
        try values.encodeIfPresent(isShuttingDown, forKey: "IsShuttingDown")
        try values.encodeIfPresent(itemsByNamePath, forKey: "ItemsByNamePath")
        try values.encodeIfPresent(localAddress, forKey: "LocalAddress")
        try values.encodeIfPresent(logPath, forKey: "LogPath")
        try values.encodeIfPresent(operatingSystem, forKey: "OperatingSystem")
        try values.encodeIfPresent(operatingSystemDisplayName, forKey: "OperatingSystemDisplayName")
        try values.encodeIfPresent(packageName, forKey: "PackageName")
        try values.encodeIfPresent(productName, forKey: "ProductName")
        try values.encodeIfPresent(programDataPath, forKey: "ProgramDataPath")
        try values.encodeIfPresent(serverName, forKey: "ServerName")
        try values.encodeIfPresent(isStartupWizardCompleted, forKey: "StartupWizardCompleted")
        try values.encodeIfPresent(isSupportsLibraryMonitor, forKey: "SupportsLibraryMonitor")
        try values.encodeIfPresent(systemArchitecture, forKey: "SystemArchitecture")
        try values.encodeIfPresent(transcodingTempPath, forKey: "TranscodingTempPath")
        try values.encodeIfPresent(version, forKey: "Version")
        try values.encodeIfPresent(webPath, forKey: "WebPath")
        try values.encodeIfPresent(webSocketPortNumber, forKey: "WebSocketPortNumber")
    }
}
