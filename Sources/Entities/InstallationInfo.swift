//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class InstallationInfo.
public struct InstallationInfo: Codable, Hashable {
    /// Gets or sets the changelog for this version.
    public var changelog: String?
    /// Gets or sets a checksum for the binary.
    public var checksum: String?
    /// Gets or sets the Id.
    public var guid: String?
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
        guid: String? = nil,
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

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.changelog = try values.decodeIfPresent(String.self, forKey: "Changelog")
        self.checksum = try values.decodeIfPresent(String.self, forKey: "Checksum")
        self.guid = try values.decodeIfPresent(String.self, forKey: "Guid")
        self.name = try values.decodeIfPresent(String.self, forKey: "Name")
        self.packageInfo = try values.decodeIfPresent(PackageInfo.self, forKey: "PackageInfo")
        self.sourceURL = try values.decodeIfPresent(String.self, forKey: "SourceUrl")
        self.version = try values.decodeIfPresent(String.self, forKey: "Version")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(changelog, forKey: "Changelog")
        try values.encodeIfPresent(checksum, forKey: "Checksum")
        try values.encodeIfPresent(guid, forKey: "Guid")
        try values.encodeIfPresent(name, forKey: "Name")
        try values.encodeIfPresent(packageInfo, forKey: "PackageInfo")
        try values.encodeIfPresent(sourceURL, forKey: "SourceUrl")
        try values.encodeIfPresent(version, forKey: "Version")
    }
}
