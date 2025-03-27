//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class ChapterInfo.
public struct ChapterInfo: Codable, Hashable {
    public var imageDateModified: Date?
    /// Gets or sets the image path.
    public var imagePath: String?
    public var imageTag: String?
    /// Gets or sets the name.
    public var name: String?
    /// Gets or sets the start position ticks.
    public var startPositionTicks: Int?

    public init(
        imageDateModified: Date? = nil,
        imagePath: String? = nil,
        imageTag: String? = nil,
        name: String? = nil,
        startPositionTicks: Int? = nil
    ) {
        self.imageDateModified = imageDateModified
        self.imagePath = imagePath
        self.imageTag = imageTag
        self.name = name
        self.startPositionTicks = startPositionTicks
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.imageDateModified = try values.decodeIfPresent(Date.self, forKey: "ImageDateModified")
        self.imagePath = try values.decodeIfPresent(String.self, forKey: "ImagePath")
        self.imageTag = try values.decodeIfPresent(String.self, forKey: "ImageTag")
        self.name = try values.decodeIfPresent(String.self, forKey: "Name")
        self.startPositionTicks = try values.decodeIfPresent(Int.self, forKey: "StartPositionTicks")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(imageDateModified, forKey: "ImageDateModified")
        try values.encodeIfPresent(imagePath, forKey: "ImagePath")
        try values.encodeIfPresent(imageTag, forKey: "ImageTag")
        try values.encodeIfPresent(name, forKey: "Name")
        try values.encodeIfPresent(startPositionTicks, forKey: "StartPositionTicks")
    }
}
