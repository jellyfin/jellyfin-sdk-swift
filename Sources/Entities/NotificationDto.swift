//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// The notification DTO.
public struct NotificationDto: Codable, Identifiable {
    /// Gets or sets the notification date.
    public var date: Date?
    /// Gets or sets the notification's description. Defaults to an empty string.
    public var description: String?
    /// Gets or sets the notification ID. Defaults to an empty string.
    public var id: String?
    /// Gets or sets a value indicating whether the notification has been read. Defaults to false.
    public var isRead: Bool?
    /// Gets or sets the notification level.
    public var level: NotificationLevel?
    /// Gets or sets the notification's name. Defaults to an empty string.
    public var name: String?
    /// Gets or sets the notification's URL. Defaults to an empty string.
    public var url: String?
    /// Gets or sets the notification's user ID. Defaults to an empty string.
    public var userID: String?

    public init(date: Date? = nil, description: String? = nil, id: String? = nil, isRead: Bool? = nil, level: NotificationLevel? = nil, name: String? = nil, url: String? = nil, userID: String? = nil) {
        self.date = date
        self.description = description
        self.id = id
        self.isRead = isRead
        self.level = level
        self.name = name
        self.url = url
        self.userID = userID
    }
}
