//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

public enum ChannelMediaContentType: String, Codable, CaseIterable {
    case clip = "Clip"
    case podcast = "Podcast"
    case trailer = "Trailer"
    case movie = "Movie"
    case episode = "Episode"
    case song = "Song"
    case movieExtra = "MovieExtra"
    case tvExtra = "TvExtra"
}
