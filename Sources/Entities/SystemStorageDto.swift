//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Contains informations about the systems storage.
public struct SystemStorageDto: Codable, Hashable {
    /// Gets or sets the Storage information of the cache folder.
    public var cacheFolder: FolderStorageDto?
    /// Gets or sets the Storage information of the folder where images are cached.
    public var imageCacheFolder: FolderStorageDto?
    /// Gets or sets the Storage information of the folder where metadata is stored.
    public var internalMetadataFolder: FolderStorageDto?
    /// Gets or sets the storage informations of all libraries.
    public var libraries: [LibraryStorageDto]?
    /// Gets or sets the Storage information of the folder where logfiles are saved to.
    public var logFolder: FolderStorageDto?
    /// Gets or sets the Storage information of the program data folder.
    public var programDataFolder: FolderStorageDto?
    /// Gets or sets the Storage information of the transcoding cache.
    public var transcodingTempFolder: FolderStorageDto?
    /// Gets or sets the Storage information of the web UI resources folder.
    public var webFolder: FolderStorageDto?

    public init(
        cacheFolder: FolderStorageDto? = nil,
        imageCacheFolder: FolderStorageDto? = nil,
        internalMetadataFolder: FolderStorageDto? = nil,
        libraries: [LibraryStorageDto]? = nil,
        logFolder: FolderStorageDto? = nil,
        programDataFolder: FolderStorageDto? = nil,
        transcodingTempFolder: FolderStorageDto? = nil,
        webFolder: FolderStorageDto? = nil
    ) {
        self.cacheFolder = cacheFolder
        self.imageCacheFolder = imageCacheFolder
        self.internalMetadataFolder = internalMetadataFolder
        self.libraries = libraries
        self.logFolder = logFolder
        self.programDataFolder = programDataFolder
        self.transcodingTempFolder = transcodingTempFolder
        self.webFolder = webFolder
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.cacheFolder = try values.decodeIfPresent(FolderStorageDto.self, forKey: "CacheFolder")
        self.imageCacheFolder = try values.decodeIfPresent(FolderStorageDto.self, forKey: "ImageCacheFolder")
        self.internalMetadataFolder = try values.decodeIfPresent(FolderStorageDto.self, forKey: "InternalMetadataFolder")
        self.libraries = try values.decodeIfPresent([LibraryStorageDto].self, forKey: "Libraries")
        self.logFolder = try values.decodeIfPresent(FolderStorageDto.self, forKey: "LogFolder")
        self.programDataFolder = try values.decodeIfPresent(FolderStorageDto.self, forKey: "ProgramDataFolder")
        self.transcodingTempFolder = try values.decodeIfPresent(FolderStorageDto.self, forKey: "TranscodingTempFolder")
        self.webFolder = try values.decodeIfPresent(FolderStorageDto.self, forKey: "WebFolder")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(cacheFolder, forKey: "CacheFolder")
        try values.encodeIfPresent(imageCacheFolder, forKey: "ImageCacheFolder")
        try values.encodeIfPresent(internalMetadataFolder, forKey: "InternalMetadataFolder")
        try values.encodeIfPresent(libraries, forKey: "Libraries")
        try values.encodeIfPresent(logFolder, forKey: "LogFolder")
        try values.encodeIfPresent(programDataFolder, forKey: "ProgramDataFolder")
        try values.encodeIfPresent(transcodingTempFolder, forKey: "TranscodingTempFolder")
        try values.encodeIfPresent(webFolder, forKey: "WebFolder")
    }
}
