//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class SystemInfo.
public struct SystemInfo: Codable, Identifiable {
    /// Gets or sets the cache path.
    public var cachePath: String?
    public var canLaunchWebBrowser: Bool?
    /// Gets or sets a value indicating whether this instance can self restart.
    public var canSelfRestart: Bool?
    /// Gets or sets the completed installations.
    public var completedInstallations: [InstallationInfo]?
    /// Enum describing the location of the FFmpeg tool.
    ///
    /// - warning: Deprecated.
    public var encoderLocation: FFmpegLocation?
    /// Gets or sets a value indicating whether this instance has pending restart.
    public var hasPendingRestart: Bool?
    /// Gets or sets a value indicating whether this instance has update available.
    ///
    /// - warning: Deprecated.
    public var hasUpdateAvailable: Bool?
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
    public var operatingSystem: String?
    /// Gets or sets the display name of the operating system.
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
    public var systemArchitecture: Architecture?
    /// Gets or sets the transcode path.
    public var transcodingTempPath: String?
    /// Gets or sets the server version.
    public var version: String?
    /// Gets or sets the web UI resources path.
    public var webPath: String?
    /// Gets or sets the web socket port number.
    public var webSocketPortNumber: Int32?

    public init(cachePath: String? = nil, canLaunchWebBrowser: Bool? = nil, canSelfRestart: Bool? = nil, completedInstallations: [InstallationInfo]? = nil, encoderLocation: FFmpegLocation? = nil, hasPendingRestart: Bool? = nil, hasUpdateAvailable: Bool? = nil, id: String? = nil, internalMetadataPath: String? = nil, isShuttingDown: Bool? = nil, itemsByNamePath: String? = nil, localAddress: String? = nil, logPath: String? = nil, operatingSystem: String? = nil, operatingSystemDisplayName: String? = nil, packageName: String? = nil, productName: String? = nil, programDataPath: String? = nil, serverName: String? = nil, isStartupWizardCompleted: Bool? = nil, isSupportsLibraryMonitor: Bool? = nil, systemArchitecture: Architecture? = nil, transcodingTempPath: String? = nil, version: String? = nil, webPath: String? = nil, webSocketPortNumber: Int32? = nil) {
        self.cachePath = cachePath
        self.canLaunchWebBrowser = canLaunchWebBrowser
        self.canSelfRestart = canSelfRestart
        self.completedInstallations = completedInstallations
        self.encoderLocation = encoderLocation
        self.hasPendingRestart = hasPendingRestart
        self.hasUpdateAvailable = hasUpdateAvailable
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
}
