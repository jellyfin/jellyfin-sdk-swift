//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Class ChapterInfo.
public struct ChapterInfo: Codable {
    public var imageDateModified: Date?
    /// Gets or sets the image path.
    public var imagePath: String?
    public var imageTag: String?
    /// Gets or sets the name.
    public var name: String?
    /// Gets or sets the start position ticks.
    public var startPositionTicks: Int64?

    public init(imageDateModified: Date? = nil, imagePath: String? = nil, imageTag: String? = nil, name: String? = nil, startPositionTicks: Int64? = nil) {
        self.imageDateModified = imageDateModified
        self.imagePath = imagePath
        self.imageTag = imageTag
        self.name = name
        self.startPositionTicks = startPositionTicks
    }
}
