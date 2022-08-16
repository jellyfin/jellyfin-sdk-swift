//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Upload subtitles dto.
public struct UploadSubtitleDto: Codable {
    /// Gets or sets the subtitle data.
    public var data: String
    /// Gets or sets the subtitle format.
    public var format: String
    /// Gets or sets a value indicating whether the subtitle is forced.
    public var isForced: Bool
    /// Gets or sets the subtitle language.
    public var language: String

    public init(data: String, format: String, isForced: Bool, language: String) {
        self.data = data
        self.format = format
        self.isForced = isForced
        self.language = language
    }
}
