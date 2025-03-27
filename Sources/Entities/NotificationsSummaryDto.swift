//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// The notification summary DTO.
public struct NotificationsSummaryDto: Codable, Hashable {
    /// Gets or sets the maximum unread notification level.
    public var maxUnreadNotificationLevel: NotificationLevel?
    /// Gets or sets the number of unread notifications.
    public var unreadCount: Int?

    public init(maxUnreadNotificationLevel: NotificationLevel? = nil, unreadCount: Int? = nil) {
        self.maxUnreadNotificationLevel = maxUnreadNotificationLevel
        self.unreadCount = unreadCount
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.maxUnreadNotificationLevel = try values.decodeIfPresent(NotificationLevel.self, forKey: "MaxUnreadNotificationLevel")
        self.unreadCount = try values.decodeIfPresent(Int.self, forKey: "UnreadCount")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(maxUnreadNotificationLevel, forKey: "MaxUnreadNotificationLevel")
        try values.encodeIfPresent(unreadCount, forKey: "UnreadCount")
    }
}
