//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// Enum GroupUpdateType.
public enum GroupUpdateType: String, Codable, CaseIterable {
    case userJoined = "UserJoined"
    case userLeft = "UserLeft"
    case groupJoined = "GroupJoined"
    case groupLeft = "GroupLeft"
    case stateUpdate = "StateUpdate"
    case playQueue = "PlayQueue"
    case notInGroup = "NotInGroup"
    case groupDoesNotExist = "GroupDoesNotExist"
    case createGroupDenied = "CreateGroupDenied"
    case joinGroupDenied = "JoinGroupDenied"
    case libraryAccessDenied = "LibraryAccessDenied"
}
