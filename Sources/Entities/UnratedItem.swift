//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation

/// An enum representing an unrated item.
public enum UnratedItem: String, Codable, CaseIterable {
    case movie = "Movie"
    case trailer = "Trailer"
    case series = "Series"
    case music = "Music"
    case book = "Book"
    case liveTvChannel = "LiveTvChannel"
    case liveTvProgram = "LiveTvProgram"
    case channelContent = "ChannelContent"
    case other = "Other"
}
