//
// jellyfin-sdk-swift is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation

/// The admin notification dto.
public struct AdminNotificationDto: Codable {
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
}
