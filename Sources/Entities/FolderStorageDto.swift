//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Contains information about a specific folder.
public struct FolderStorageDto: Codable, Hashable {
    /// Gets the Device Identifier.
    public var deviceID: String?
    /// Gets the free space of the underlying storage device of the Jellyfin.Api.Models.SystemInfoDtos.FolderStorageDto.Path.
    public var freeSpace: Int?
    /// Gets the path of the folder in question.
    public var path: String?
    /// Gets the kind of storage device of the Jellyfin.Api.Models.SystemInfoDtos.FolderStorageDto.Path.
    public var storageType: String?
    /// Gets the used space of the underlying storage device of the Jellyfin.Api.Models.SystemInfoDtos.FolderStorageDto.Path.
    public var usedSpace: Int?

    public init(deviceID: String? = nil, freeSpace: Int? = nil, path: String? = nil, storageType: String? = nil, usedSpace: Int? = nil) {
        self.deviceID = deviceID
        self.freeSpace = freeSpace
        self.path = path
        self.storageType = storageType
        self.usedSpace = usedSpace
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.deviceID = try values.decodeIfPresent(String.self, forKey: "DeviceId")
        self.freeSpace = try values.decodeIfPresent(Int.self, forKey: "FreeSpace")
        self.path = try values.decodeIfPresent(String.self, forKey: "Path")
        self.storageType = try values.decodeIfPresent(String.self, forKey: "StorageType")
        self.usedSpace = try values.decodeIfPresent(Int.self, forKey: "UsedSpace")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(deviceID, forKey: "DeviceId")
        try values.encodeIfPresent(freeSpace, forKey: "FreeSpace")
        try values.encodeIfPresent(path, forKey: "Path")
        try values.encodeIfPresent(storageType, forKey: "StorageType")
        try values.encodeIfPresent(usedSpace, forKey: "UsedSpace")
    }
}
