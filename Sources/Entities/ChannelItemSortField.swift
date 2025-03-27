//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

public enum ChannelItemSortField: String, Codable, CaseIterable {
    case name = "Name"
    case communityRating = "CommunityRating"
    case premiereDate = "PremiereDate"
    case dateCreated = "DateCreated"
    case runtime = "Runtime"
    case playCount = "PlayCount"
    case communityPlayCount = "CommunityPlayCount"
}
