//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// The collection type options.
public enum CollectionTypeOptions: String, Codable, CaseIterable {
    case movies
    case tvshows
    case music
    case musicvideos
    case homevideos
    case boxsets
    case books
    case mixed
}
