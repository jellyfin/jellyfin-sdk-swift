//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// The specific media type of an MediaBrowser.Model.Providers.ExternalIdInfo.
public enum ExternalIDMediaType: String, Codable, CaseIterable {
    case album = "Album"
    case albumArtist = "AlbumArtist"
    case artist = "Artist"
    case boxSet = "BoxSet"
    case episode = "Episode"
    case movie = "Movie"
    case otherArtist = "OtherArtist"
    case person = "Person"
    case releaseGroup = "ReleaseGroup"
    case season = "Season"
    case series = "Series"
    case track = "Track"
    case book = "Book"
}
