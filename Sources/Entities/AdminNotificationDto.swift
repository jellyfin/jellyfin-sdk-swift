//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Foundation

/// The admin notification dto.
public struct AdminNotificationDto: Codable, Hashable {
    /// Gets or sets the notification description.
    public var description: String?
    /// Gets or sets the notification name.
    public var name: String?
    /// Gets or sets the notification level.
    public var notificationLevel: NotificationLevel?
    /// Gets or sets the notification url.
    public var url: String?

    public init(description: String? = nil, name: String? = nil, notificationLevel: NotificationLevel? = nil, url: String? = nil) {
        self.description = description
        self.name = name
        self.notificationLevel = notificationLevel
        self.url = url
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.description = try values.decodeIfPresent(String.self, forKey: "Description")
        self.name = try values.decodeIfPresent(String.self, forKey: "Name")
        self.notificationLevel = try values.decodeIfPresent(NotificationLevel.self, forKey: "NotificationLevel")
        self.url = try values.decodeIfPresent(String.self, forKey: "Url")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(description, forKey: "Description")
        try values.encodeIfPresent(name, forKey: "Name")
        try values.encodeIfPresent(notificationLevel, forKey: "NotificationLevel")
        try values.encodeIfPresent(url, forKey: "Url")
    }
}
