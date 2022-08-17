//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// The notification summary DTO.
public struct NotificationsSummaryDto: Codable {
    /// Gets or sets the maximum unread notification level.
    public var maxUnreadNotificationLevel: NotificationLevel?
    /// Gets or sets the number of unread notifications.
    public var unreadCount: Int32?

    public init(maxUnreadNotificationLevel: NotificationLevel? = nil, unreadCount: Int32? = nil) {
        self.maxUnreadNotificationLevel = maxUnreadNotificationLevel
        self.unreadCount = unreadCount
    }
}
