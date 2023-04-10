//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Enum describing the location of the FFmpeg tool.
public enum FFmpegLocation: String, Codable, CaseIterable {
    case notFound = "NotFound"
    case setByArgument = "SetByArgument"
    case custom = "Custom"
    case system = "System"
}
