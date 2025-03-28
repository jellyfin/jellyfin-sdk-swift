//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Enum ItemFilter.
public enum ItemFilter: String, Codable, CaseIterable {
    case isFolder = "IsFolder"
    case isNotFolder = "IsNotFolder"
    case isUnplayed = "IsUnplayed"
    case isPlayed = "IsPlayed"
    case isFavorite = "IsFavorite"
    case isResumable = "IsResumable"
    case likes = "Likes"
    case dislikes = "Dislikes"
    case isFavoriteOrLikes = "IsFavoriteOrLikes"
}
