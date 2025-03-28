//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Defines the MediaBrowser.Model.Updates.VersionInfo class.
public struct VersionInfo: Codable, Hashable {
    /// Gets the version as a System.Version.
    public var versionNumber: String?
    /// Gets or sets the changelog for this version.
    public var changelog: String?
    /// Gets or sets a checksum for the binary.
    public var checksum: String?
    /// Gets or sets the repository name.
    public var repositoryName: String?
    /// Gets or sets the repository url.
    public var repositoryURL: String?
    /// Gets or sets the source URL.
    public var sourceURL: String?
    /// Gets or sets the ABI that this version was built against.
    public var targetAbi: String?
    /// Gets or sets a timestamp of when the binary was built.
    public var timestamp: String?
    /// Gets or sets the version.
    public var version: String?

    public init(
        versionNumber: String? = nil,
        changelog: String? = nil,
        checksum: String? = nil,
        repositoryName: String? = nil,
        repositoryURL: String? = nil,
        sourceURL: String? = nil,
        targetAbi: String? = nil,
        timestamp: String? = nil,
        version: String? = nil
    ) {
        self.versionNumber = versionNumber
        self.changelog = changelog
        self.checksum = checksum
        self.repositoryName = repositoryName
        self.repositoryURL = repositoryURL
        self.sourceURL = sourceURL
        self.targetAbi = targetAbi
        self.timestamp = timestamp
        self.version = version
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.versionNumber = try values.decodeIfPresent(String.self, forKey: "VersionNumber")
        self.changelog = try values.decodeIfPresent(String.self, forKey: "changelog")
        self.checksum = try values.decodeIfPresent(String.self, forKey: "checksum")
        self.repositoryName = try values.decodeIfPresent(String.self, forKey: "repositoryName")
        self.repositoryURL = try values.decodeIfPresent(String.self, forKey: "repositoryUrl")
        self.sourceURL = try values.decodeIfPresent(String.self, forKey: "sourceUrl")
        self.targetAbi = try values.decodeIfPresent(String.self, forKey: "targetAbi")
        self.timestamp = try values.decodeIfPresent(String.self, forKey: "timestamp")
        self.version = try values.decodeIfPresent(String.self, forKey: "version")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(versionNumber, forKey: "VersionNumber")
        try values.encodeIfPresent(changelog, forKey: "changelog")
        try values.encodeIfPresent(checksum, forKey: "checksum")
        try values.encodeIfPresent(repositoryName, forKey: "repositoryName")
        try values.encodeIfPresent(repositoryURL, forKey: "repositoryUrl")
        try values.encodeIfPresent(sourceURL, forKey: "sourceUrl")
        try values.encodeIfPresent(targetAbi, forKey: "targetAbi")
        try values.encodeIfPresent(timestamp, forKey: "timestamp")
        try values.encodeIfPresent(version, forKey: "version")
    }
}
