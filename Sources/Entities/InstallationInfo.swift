//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class InstallationInfo.
public struct InstallationInfo: Codable {
    /// Gets or sets the changelog for this version.
    public var changelog: String?
    /// Gets or sets a checksum for the binary.
    public var checksum: String?
    /// Gets or sets the Id.
    public var guid: UUID?
    /// Gets or sets the name.
    public var name: String?
    /// Gets or sets package information for the installation.
    public var packageInfo: PackageInfo?
    /// Gets or sets the source URL.
    public var sourceURL: String?
    /// Gets or sets the version.
    public var version: String?

    public init(
        changelog: String? = nil,
        checksum: String? = nil,
        guid: UUID? = nil,
        name: String? = nil,
        packageInfo: PackageInfo? = nil,
        sourceURL: String? = nil,
        version: String? = nil
    ) {
        self.changelog = changelog
        self.checksum = checksum
        self.guid = guid
        self.name = name
        self.packageInfo = packageInfo
        self.sourceURL = sourceURL
        self.version = version
    }
}
